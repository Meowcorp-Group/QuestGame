extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$CheckBoxFullscreen.toggled = ConfigManager.load_option("display", "fullscreen", false)

func _on_button_back_pressed():
	SceneManager.switch_scene("res://main.tscn")


func _on_check_box_fullscreen_toggled(toggled_on:bool):
	ConfigManager.set_option("display", "fullscreen", toggled_on)
	ConfigManager.save_config()
