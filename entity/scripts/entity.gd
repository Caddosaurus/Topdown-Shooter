class_name Entity extends CharacterBody2D

const DIR_4 = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine : StateMachine = $StateMachine
@onready var hitbox: Hitbox = $Interactions/Hitbox
@onready var muzzle: Marker2D = $Interactions/Marker2D
@onready var interactions: Node2D = $Interactions
@onready var hurtbox: Hurtbox = $Interactions/Hurtbox

@export var bullet: PackedScene



signal direction_changed(new_direction: Vector2)
signal damaged(area: Node2D)

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
var invulnerable: bool = false

@export var hp: int = 1
@export var max_hp: int = 1

func init():
	pass

# Initialize the state machine
func _ready():
	hurtbox.destructible = false
	hitbox.damaged.connect(take_damage)
	


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

func _physics_process(_delta):
	move_and_slide()


func set_direction(new_direction) -> bool:
	direction = new_direction
	if direction == Vector2.ZERO:
		return false
	# Take an angle and round it to one of the four cardinal directions, point a little bit more towards the previous direction
	var direction_id = int(round((direction + cardinal_direction * 0.1).angle() / TAU * DIR_4.size()))
	var new_dir = DIR_4[direction_id]
	
	
	
	if new_dir == cardinal_direction:
		return false
	cardinal_direction = new_dir
	direction_changed.emit(new_dir)
	interactions.update_direction(direction)
	animated_sprite_2d.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true
	
# Set the current animation to the state and the direction
func update_animation(state: String):
	
	animated_sprite_2d.play(state + "_" + anim_direction())

# Gets the player's direction and translates it for the animations
func anim_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"

func take_damage(area: Node2D):
	if not invulnerable:
		set_hp(get_hp() - area.damage)
		damaged.emit(area)
