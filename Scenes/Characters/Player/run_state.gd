extends NodeState

@export var player: Player
@export var animated_sprite: AnimatedSprite2D
@export var speed: int = 6000

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	
	if direction == Vector2.LEFT:
		animated_sprite.flip_h = true
		animated_sprite.play("Run")
	if direction == Vector2.RIGHT:
		animated_sprite.flip_h = false
		animated_sprite.play("Run")
		
	if direction != Vector2.ZERO:
		player.player_direction = direction
		
	print(player.player_direction)
	player.velocity = direction * speed * _delta
	if !player.is_on_floor():
		player.apply_gravity(_delta)
	player.move_and_slide()

func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite.stop()
