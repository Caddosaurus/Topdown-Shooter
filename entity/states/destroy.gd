class_name Destroy extends State
# This is my cool smoke effect
@onready var destroy_effect = $"../../DestroyEffect"

# Allow the animation finish to trigger destruction
func init():
	anim_name = "destroy"
	animated_sprite_2d.animation_finished.connect(_on_animated_sprite_2d_animation_finished)

# Play my cool smoke animation
func enter():
	entity.invulnerable = true
	destroy_effect.play("smoke")
	entity.update_animation(anim_name)

# Kill the entity
func _on_animated_sprite_2d_animation_finished():
	if state_machine.current_state is Destroy:
		entity.queue_free()
