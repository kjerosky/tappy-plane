class_name Game extends Node2D

@export var parallax_background: ParallaxBackground

var background_scroll_speed := 150


func _process(delta):
	parallax_background.scroll_offset += Vector2.LEFT * background_scroll_speed * delta
