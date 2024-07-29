class_name Enemy_Wander extends State


@onready var idle = $"../Idle"

@export var wander_speed: float = 20.0

@export_category("AI")
# All walk animations must be of the same length or else I need to find a better way to do this!
@export var state_anim_duration: float = 0.8
@export var state_cycles_min: int = 1
@export var state_cycles_max: int = 3

var _timer: float = 0.0

func init():
	anim_name = "walk"

func enter():
	# Set the animation an dstart the cycle timer
	entity.update_animation(anim_name)
	_timer = randi_range(state_cycles_max, state_cycles_min) * state_anim_duration
	# Point in a random direction and set the velocity
	var rand = randi_range(0, 3)
	_direction = g.DIR_4[rand]
	entity.velocity = _direction * wander_speed
	

func process(delta: float) -> State:
	# Trigger next state on timer expiry
	_timer -= delta
	if _timer <= 0:
		return next_state
	return null
