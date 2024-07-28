class_name Enemy extends Entity


var player: Player

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	player = g.player
	state_machine.initialize(self)
	set_hp(3)
	set_max_hp(3)



