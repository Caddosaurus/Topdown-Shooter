class_name Hitbox extends Area2D

signal damaged(area: Node2D)

@export var is_destructible: bool = true

# This is the code for the part that gets damaged (the body etc.)
func damage(area: Node2D):
	damaged.emit(area)

