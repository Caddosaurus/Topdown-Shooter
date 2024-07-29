class_name StateMachine extends Node

# Wow, a real state machine?
var states: Array[State]
var prev_state: State
var current_state: State

# Don't do anything until the state machine is initialized
func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta):
	# Run process(delta) in the current state - this will usually return null, but sometimes the state will actually have to get changed
	change_state(current_state.process(delta))

func _physics_process(delta):
	# Same as above
	current_state.physics(delta)

func _input(event):
	# Same as above
	change_state(current_state.handle_input(event))

# Initialize the state machine
func initialize(_entity : Entity):
	states = []
	# Get all states from below the StateMachine node
	for c in get_children():
		if c is State:
			states.append(c)
	# Initialize all the states
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
	# Yes, I have two enter() functions - enter() runs in the state's subclass, while finish_enter() runs in the State class.
	# Maybe I will fix this. 
	# Maybe I won't.
	current_state.enter()
	current_state.finish_enter()
