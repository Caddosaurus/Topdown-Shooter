class_name Enemy_Idle extends State



@export_category("AI")
@export var state_duration_min: float = 0.5
@export var state_duration_max: float = 1.5

var _timer: float = 0.0

func init():
	anim_name = "idle"

func enter():
	# Stop moving, set the animation to idle and start the timer
	entity.velocity = Vector2.ZERO
	_timer = randf_range(state_duration_max, state_duration_min)
	entity.update_animation(anim_name)

func process(_delta: float) -> State:
	# When the idle timer expires, go to the next state
	_timer -= _delta
	if _timer <= 0:
		return next_state
	return null
