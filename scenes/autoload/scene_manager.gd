extends Node

var current_scene = null
var scene_stack = []

func _ready() -> void:
	pass

func push_scene(res_path: String) -> void:
	# add element to scene stack
	scene_stack.push_back(res_path)
	# switch to said scene
	switch_scene(res_path)

# TODO: this is broken
func pop_scene() -> void:
	pass

func switch_scene(res_path: String) -> void:
	call_deferred("_deferred_switch_scene", res_path)

func _deferred_switch_scene(res_path: String) -> void:
	current_scene.free()
	var scene = load(res_path)
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

# func _process(delta):
# 	print_debug(scene_stack)
