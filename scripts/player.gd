class_name Player extends CharacterBody2D

const JUMP_VELOCITY = -700.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

enum PlayerState {
	WAITING_TO_START,
	PLAYING,
	JUST_DIED,
}
var state: PlayerState


func _ready():
	state = PlayerState.WAITING_TO_START


func _physics_process(delta):
	if state == PlayerState.JUST_DIED:
		get_tree().reload_current_scene()
		return
	
	if state == PlayerState.PLAYING:
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("flap"):
		state = PlayerState.PLAYING
		velocity.y = JUMP_VELOCITY
	
	move_and_slide()


func die():
	state = PlayerState.JUST_DIED
