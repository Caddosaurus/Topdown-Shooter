class_name Player_Attack extends State

## This script is unused! It is not attached to anything!
@onready var walk: State = $"../Walk"
@onready var idle: State = $"../Idle"
@export_range(0,20,1) var friction: float = 3.0
@onready var hurtbox: Hurtbox = $"../../Interactions/Hurtbox"
@onready var muzzle = $"../../Interactions/Marker2D"

var attacking: bool = false

func init():
	anim_name = "attack"

func enter():
	attacking = true
	await get_tree().create_timer(0.1).timeout
	hurtbox.monitoring = true
	# Bullet code - it works, but I will be changing all of this so that shooting is independent from movement
	var b = entity.bullet.instantiate()
	b.global_position = muzzle.global_position
	b.global_rotation = entity.cardinal_direction.angle()
	get_parent().add_child(b)

func exit():
	hurtbox.monitoring = false

# What happens during _process()
func process(delta) -> State:
	
	entity.velocity -= entity.velocity * friction * delta
	if not attacking:
		if entity.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

# What happens during _physics_process()
func physics(_delta) -> State:
	return null

# What happens with input
func handle_input(_event: InputEvent) -> State:
	return null

func end_attack():
	attacking = false
