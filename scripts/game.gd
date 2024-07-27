class_name Game extends Node2D

@export var parallax_background: ParallaxBackground
@export var player: Player

var background_scroll_speed := 150


func _process(delta):
	parallax_background.scroll_offset += Vector2.LEFT * background_scroll_speed * delta


func _on_player_collided(body):
	if body as Player != null:
		player.die()
