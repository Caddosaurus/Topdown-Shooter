class_name Plant extends Node2D

# Make the plant an enemy (?) and a wall
# $hitbox...
func _ready():
	$hitbox.set_collision_layer_value(5, true)
	$hitbox.set_collision_layer_value(9, true)


func _on_hitbox_damaged(_area: Node2D):
	queue_free()
