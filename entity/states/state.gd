class_name State extends Node

# opposition is the non-self collider in a collision, I guess? Not really sure how to explain it.
var entity: Entity
var opposition: Entity
var state_machine: StateMachine
@export var next_state: State
@onready var animated_sprite_2d = $"../../AnimatedSprite2D"


var _direction: Vector2
var anim_name: String

func init():
	pass

#  When the player enters the state
func enter():
	pass

# Damn you, object-oriented design!
func finish_enter():
	entity.set_direction(_direction)
	# No idea why this works the way it does, but if I take it out, the animations work funny on the enemy.
	entity.update_animation(anim_name)

func exit():
	pass

# What happens during _process()
func process(_delta) -> State:
	return null

# What happens during _physics_process()
func physics(_delta) -> State:
	return null

# What happens with input
func handle_input(_event: InputEvent) -> State:
	return null
