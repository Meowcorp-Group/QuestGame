extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_exit_pressed():
	get_tree().quit()


func _on_button_options_pressed():
	SceneManager.switch_scene("res://scenes/ui/options/options_menu.tscn")
