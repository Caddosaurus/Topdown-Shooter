class_name Entity extends CharacterBody2D

# List the requirements and locations of the children of every Entity
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine : StateMachine = $StateMachine
@onready var hitbox: Hitbox = $Interactions/Hitbox
@onready var muzzle: Marker2D = $Interactions/Marker2D
@onready var interactions: Node2D = $Interactions
@onready var hurtbox: Hurtbox = $Interactions/Hurtbox
@onready var gun: Gun = $Gun

# Set the bullet type - may not need this
@export var bullet: PackedScene

signal update_hud()
signal direction_changed(new_direction: Vector2)
signal damaged(area: Node2D)

# Start as nonmoving
var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
var invulnerable: bool = false

# Default values for speed, HP, and max HP
@export var speed: int = 100
@export var hp: int = 1
@export var max_hp: int = 1

func init():
	pass

# Initialize the state machine and connect the signal
func _ready():
	hurtbox.destructible = false
	hitbox.damaged.connect(take_damage)
	


# Setters and getters
func set_hp(value: int):
	hp = value
func get_hp() -> int:
	return hp
func set_max_hp(value: int):
	max_hp = value
func get_max_hp() -> int:
	return max_hp
func set_invulnerable(value: bool):
	invulnerable = value
func get_invulnerable() -> bool:
	return invulnerable
func set_speed(value: int):
	speed = value
func get_speed():
	return speed

func _physics_process(_delta):
	move_and_slide()

# Set the direction to new_direction, a Vector2 
func set_direction(new_direction) -> bool:
	direction = new_direction
	# If setting the direction to nothing, return false
	if direction == Vector2.ZERO:
		return false
	# Take an angle and round it to one of the four cardinal directions, point a little bit more towards the previous direction
	var direction_id = int(round((direction + cardinal_direction * 0.1).angle() / TAU * g.DIR_4.size()))
	var new_dir = g.DIR_4[direction_id]
	
	
	# Cardinal direction will only ever be one of up, down, left, and right - it is used to set the animations
	if new_dir == cardinal_direction:
		return false
	cardinal_direction = new_dir
	# Update the direction
	direction_changed.emit(new_dir)
	interactions.update_direction(direction)
	# Flip the entity sprite
	animated_sprite_2d.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true
	
# Set the current animation to the state and the direction
func update_animation(state: String):
	animated_sprite_2d.play(state + "_" + anim_direction())

# Change health by value, do not let it go over max HP
func change_health(value):
	if get_hp() + value > get_max_hp():
		set_hp(get_max_hp())
	else:
		set_hp(get_hp() + value)
	update_hud.emit()

# Gets the player's direction and translates it for the animations
func anim_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"

# Take damage from area and then broadcast it
func take_damage(area: Node2D):
	if not invulnerable:
		set_hp(get_hp() - area.damage)
		damaged.emit(area)

# SChange health/speed/whatever
func upgrade(property: String, value: int):
	match property:
		"max_health":
			set_max_hp(get_max_hp() + value)
		"health":
			change_health(value)
		"speed":
			set_speed(get_speed() + speed)
		_:
			print("Error: Invalid property")
