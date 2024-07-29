class_name Player_Walk extends State
@onready var idle: State = $"../Idle"
@export var move_speed: float = 500.0
#  When the player enters the state

func init():
	anim_name = "walk"

func enter():
	pass

func exit():
	pass

# What happens during _process()
func process(_delta) -> State:
	# If not moving, switch the state to idle
	if entity.direction == Vector2.ZERO:
		return idle
	
	# Set the velocity
	entity.velocity = entity.direction * move_speed
	
	# Set the direction
	if entity.set_direction(entity.direction): 
		entity.update_animation("walk")
	# Do not change the state
	return null

# What happens during _physics_process()
func physics(_delta) -> State:
	return null

# What happens with input
func handle_input(_event: InputEvent) -> State:
	return null
