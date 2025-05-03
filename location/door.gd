extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var check = 0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("use") and check == 1:
		Signals.emit_signal("compartment")


func _on_search_player_body_entered(body: Node2D) -> void:
	check = 1
	$AnimatedSprite2D.visible = true

func _on_search_player_body_exited(body: Node2D) -> void:
	check = 0
	$AnimatedSprite2D.visible = false
