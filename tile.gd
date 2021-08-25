extends KinematicBody2D

export (float) var vel = 200

func _process(delta):
	move_and_slide(Vector2.DOWN * vel)
