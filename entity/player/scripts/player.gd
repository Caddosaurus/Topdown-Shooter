class_name Player extends Entity

@onready var health_hud = $CanvasLayer/Label

# Call the superclass constructor, set HP, hud text, the global player, connect signals, initialize stuff
func _ready():
	super()
	set_max_hp(10)
	set_hp(10)
	health_hud.text = str(get_hp())
	g.player = self
	state_machine.initialize(self)
	self.damaged.connect(_on_hitbox_damaged)
	gun.initialize(self)
	self.update_hud.connect(change_hud)


func _process(_delta):
	# Set direction based on player input
	direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()

# Update hud text - I will change this eventually
func change_hud():
	health_hud.text = str(get_hp())

func end_attack():
	pass # Replace with function body.

# gun.shoot(): Yes, it is that simple.
func _input(event: InputEvent):
	if event.is_action_pressed("primary"):
		gun.shoot()

# Also change hud text, but this time with signals
func _on_hitbox_damaged(_area: Area2D):
	health_hud.text = str(get_hp())

# Shift responsibility to the gun
func upgrade_weapon(part_type: String, part_name: String):
	gun.set_gun_stat(part_type, part_name)

