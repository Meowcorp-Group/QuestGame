extends CharacterBody2D

const speed = 300.0

@onready var actionable_finder = $Direction/ActionableFinder

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed

	move_and_slide()

func _unhandled_input(event):
	if Input.is_action_pressed("interact"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
