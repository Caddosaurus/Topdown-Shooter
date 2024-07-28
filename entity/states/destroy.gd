class_name Destroy extends State

@onready var destroy_effect = $"../../DestroyEffect"
# Called when the node enters the scene tree for the first time.
func init():
	anim_name = "destroy"
	animated_sprite_2d.animation_finished.connect(_on_animated_sprite_2d_animation_finished)

func enter():
	entity.invulnerable = true
	destroy_effect.play("smoke")
	entity.update_animation(anim_name)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animated_sprite_2d_animation_finished():
	if state_machine.current_state is Destroy:
		entity.queue_free()
