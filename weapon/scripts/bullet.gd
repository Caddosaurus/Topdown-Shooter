class_name Bullet extends Hurtbox

@export var speed: int = 100
var timer: float = 10.0

func _ready():
	# Connect to the superclass body detection signal
	super()


func _physics_process(delta):
	# Move forward
	move_local_x(speed * delta)
	# When the timer expires, kill the bullet
	timer -= delta
	if timer <= 0:
		queue_free()

