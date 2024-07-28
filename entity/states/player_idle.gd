class_name Player_Idle extends State
@onready var walk: State = $"../Walk"
@onready var attack: State = $"../Attack"


#  When the player enters the state

func init():
	anim_name = "idle"

func enter():
	pass

func exit():
	pass

# What happens during _process()
func process(_delta) -> State:
	if entity.direction != Vector2.ZERO:
		return walk
	entity.velocity = Vector2.ZERO
	return null

# What happens during _physics_process()
func physics(_delta) -> State:
	return null

# What happens with input
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("primary"):
		return attack
	return null
