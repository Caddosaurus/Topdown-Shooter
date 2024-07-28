class_name Stun extends State

@export_category("AI")
@export var destroy_state: State
var _animation_finished: bool = false

func init():
	anim_name = "stun"
	animated_sprite_2d.animation_finished.connect(_on_animated_sprite_2d_animation_finished)
	entity.damaged.connect(_on_entity_damaged)

func enter():
	entity.update_animation(anim_name)
	entity.invulnerable = true
	_animation_finished = false
	# Knockback
	_direction = entity.global_position.direction_to(opposition.global_position)
	# Friction
	entity.velocity = _direction * -g.knockback_speed
	entity.interactions.update_direction(_direction)
	
	
	
	
	
	


func process(_delta: float) -> State:
	if _animation_finished == true:
		if entity.hp <= 0:
			return destroy_state
		return next_state
	entity.velocity -= entity.velocity * g.decelerate_speed * _delta
	return null

# Let the entity take damage
func _on_entity_damaged(area: Node2D):
	if not entity.invulnerable:
		opposition = area.get_parent().get_parent()
		state_machine.change_state(self)

# Checks if the player is no longer stunned
func _on_animated_sprite_2d_animation_finished():
	_animation_finished = true

func exit():
	entity.invulnerable = false
	
