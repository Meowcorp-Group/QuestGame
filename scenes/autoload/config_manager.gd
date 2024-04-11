extends Node

var config = ConfigFile.new()

var user_config = "user://config.cfg"

# Called when the node enters the scene tree for the first time.
func _ready():
	# Load the config file, if it exists.
	var err = config.load(user_config)
	if err != OK:
		# If it doesn't exist, create it.
		config.save(user_config)

func set_option(section, key, value):
	config.set_value(section, key, value)
	
func load_option(section, key, default_value):
	var val = config.get_value(section, key)
	if val != null:
		print_debug(val)
		return val
	else:
		set_option(section, key, default_value)
		return default_value

func save_config():
	config.save(user_config)