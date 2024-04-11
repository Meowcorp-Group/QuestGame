extends Node

var current_scene = null
var scene_stack = []

func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	scene_stack.push_back(current_scene)

func push_scene(res_path: String) -> void:
	scene_stack.push_back(current_scene)
	call_deferred("_deferred_switch_scene", res_path)

# TODO: this is broken
func pop_scene() -> void:
	if scene_stack.size() > 1:
		scene_stack.pop_back()
		call_deferred("_deferred_switch_scene", scene_stack[scene_stack.size() - 1].get_path())
	else:
		print_debug("Scene stack is empty, cannot pop scene")

# legacy, will clear the scene stack
func switch_scene(res_path: String) -> void:
	scene_stack.clear()
	call_deferred("_deferred_switch_scene", res_path)

func _deferred_switch_scene(res_path: String) -> void:
	current_scene.free()
	var scene = load(res_path)
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

# func _process(delta):
# 	print_debug(scene_stack)