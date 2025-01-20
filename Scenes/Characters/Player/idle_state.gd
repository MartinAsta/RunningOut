extends NodeState

@export var player: Player
@export var animated_sprite : AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	animated_sprite.play("Idle")
	if !player.is_on_floor():
		player.apply_gravity(_delta)
		player.move_and_slide()


func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if Input.is_action_just_pressed("jump"):
		transition.emit("Jump")
	elif GameInputEvents.is_movement_input():
		transition.emit("Run")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite.stop()
