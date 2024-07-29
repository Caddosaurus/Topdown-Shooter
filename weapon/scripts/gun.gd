class_name Gun extends Node

var entity: Entity
var damage: int
var accuracy: int
var fire_rate: int

# Called when the node enters the scene tree for the first time.
func _ready():
	damage = 1

# Set the entity
func initialize(e: Entity):
	entity = e

func _process(_delta):
	pass

func shoot():
	# Create a bullet and orient it in the proper direction
	var b = entity.bullet.instantiate()
	b.global_position = entity.muzzle.global_position
	b.global_rotation = entity.cardinal_direction.angle()
	b.damage = damage
	# Don't kill the owner!
	if entity is Player:
		b.set_collision_mask_value(9, true)
	if entity is Enemy:
		b.set_collision_mask_value(2, true)
	# Add the bullet as a child of the entity's gun
	entity.gun.add_child(b)

# Set an aspect of the gun - barrel, stock, grip, etc. This can be extended for more part types - I only have barrel so far.
func set_gun_stat(part_type: String, part_name: String):
	if part_type in g.gun_parts and part_type == "barrel":
		set_barrel_stats(part_name)
	else: 
		print("Error: Gun part type not found")

# Set the current barrel - this can also be extended to other types.
func set_barrel_stats(barrel: String):
	match barrel:
		"upgraded":
			damage = 3
		"default":
			damage = 1
		_:
			damage = 1

