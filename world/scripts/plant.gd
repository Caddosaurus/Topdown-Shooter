class_name Plant extends Node2D




func _on_hitbox_damaged(_area: Node2D):
	queue_free()
