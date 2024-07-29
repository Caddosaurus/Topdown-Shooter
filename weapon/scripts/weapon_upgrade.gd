class_name WeaponUpgrade extends Hitbox
@export var part_type: String
@export var part_name: String

# You might notice that this is pretty similar to pickup.gd - it is, but it's too different to have in the same class, as far as I can tell.
func _ready():
	# Allow the weapon upgrades to touch the player and connect to the superclass signal
	set_collision_layer_value(17, true)
	self.damaged.connect(change_property)

func change_property(area: Area2D):
	# Maybe I should use something other than get_parent().
	# Checks if the player is touching the upgrade, then deletes the upgrade if they are
	if area.get_parent().get_parent() is Player:
		area.get_parent().get_parent().upgrade_weapon(part_type, part_name)
		queue_free()
