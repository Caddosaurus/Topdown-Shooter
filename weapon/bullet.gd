class_name Bullet extends Hurtbox

@export var speed = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect to the superclass body detection signal
	super()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_local_x(speed * delta)

