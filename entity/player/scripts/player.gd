class_name Player extends Entity

@onready var health_hud = $CanvasLayer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	set_max_hp(10)
	set_hp(10)
	health_hud.text = str(get_hp())
	g.player = self
	state_machine.initialize(self)
	self.damaged.connect(_on_hitbox_damaged)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# Set direction based on player input
	direction = Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()


func end_attack():
	pass # Replace with function body.


func _on_hitbox_damaged(area: Area2D):
	health_hud.text = str(get_hp())
