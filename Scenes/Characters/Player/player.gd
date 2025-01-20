class_name Player
extends CharacterBody2D

var player_direction : Vector2 = Vector2.RIGHT
var gravity: int = 1000

func apply_gravity(delta: float):
	velocity.y += gravity * delta
