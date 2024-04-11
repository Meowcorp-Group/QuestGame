extends Node

var screen_size = DisplayServer.screen_get_size()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Set the window size to 1280x720 if the screen size is greater than or equal to 1280x720
	if (screen_size.x >= 1280 && screen_size.y >= 720):
		get_window().set_size(Vector2(1280, 720))


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
# 	pass
