class_name Player_Walk extends State
@onready var idle: State = $"../Idle"
@export var move_speed: float = 500.0
@onready var attack: State = $"../Attack"
#  When the player enters the state

func init():
	anim_name = "walk"
func enter():
	pass

func exit():
	pass

# What happens during _process()
func process(_delta) -> State:
	if entity.direction == Vector2.ZERO:
		return idle
	
	entity.velocity = entity.direction * move_speed
	
	if entity.set_direction(entity.direction): 
		entity.update_animation("walk")
	return null

# What happens during _physics_process()
func physics(_delta) -> State:
	return null

# What happens with input
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("primary"):
		return attack
	return null
