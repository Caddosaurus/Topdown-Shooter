class_name Enemy extends Entity


var player: Player

# Initialize the enemy's state machine and gun, and set the base variables
func _ready():
	super()
	player = g.player
	state_machine.initialize(self)
	gun.initialize(self)
	set_hp(3)
	set_max_hp(3)



