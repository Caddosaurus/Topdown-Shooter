class_name Pickup extends Hitbox
@export var property: String
@export var value: int
# Make the pickup usable by entities on layer 17
func _ready():
	set_collision_layer_value(17, true)
	self.damaged.connect(change_property)

# Tell the entity to change an aspect of itself, then delete the pickup
func change_property(area: Area2D):
	if area.get_parent().get_parent() is Player:
		area.get_parent().get_parent().upgrade(property, value)
		queue_free()
