class_name Hurtbox extends Area2D

@export var damage: int = 1
@export var destructible = true
func _ready():
	area_entered.connect(_on_area_entered)
# This is the part that damages an object (i.e. a sword)
func _on_area_entered(area: Area2D):
	if area is Hitbox:
		area.damage(self)
		if destructible:
			# Destroy bullets
			queue_free()
