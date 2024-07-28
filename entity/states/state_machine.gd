class_name StateMachine extends Node

var states: Array[State]
var prev_state: State
var current_state: State


func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_state(current_state.process(delta))

func _physics_process(delta):
	current_state.physics(delta)

func _input(event):
	change_state(current_state.handle_input(event))

# Initialize the state machine
func initialize(_entity : Entity):
	states = []
	# Get all states from below the StateMachine node
	for c in get_children():
		if c is State:
			states.append(c)
	for s in states:
		s.entity = _entity
		s.state_machine = self
		s.init()
	# Set the state to the first state and begin processing
	if states.size() > 0:
		change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT

# Switch the current state to the new state
func change_state(new_state : State):
	if new_state == current_state or new_state == null:
		return
	if current_state:
		current_state.exit()
	prev_state = current_state
	current_state = new_state
	current_state.enter()
	current_state.finish_enter()
