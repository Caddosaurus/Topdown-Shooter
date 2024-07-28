extends Node2D

@onready var player = $".."

func update_direction(new_direction: Vector2):
	match new_direction:
		Vector2.DOWN:
			rotation_degrees = 0
		Vector2.UP:
			rotation_degrees = 180
		Vector2.LEFT:
			rotation_degrees = 90
		Vector2.RIGHT:
			rotation_degrees = 270
		_: 
			rotation_degrees = 0


