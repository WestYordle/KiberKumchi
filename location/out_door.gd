extends CharacterBody2D

var check_out = 0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("use") and check_out == 2:
		Signals.emit_signal("out_compartment")

func _on_search_player_body_entered(body: Node2D) -> void:
	check_out = 2
	$AnimatedSprite2D.visible = true

func _on_search_player_body_exited(body: Node2D) -> void:
	check_out = 0
	$AnimatedSprite2D.visible = false
