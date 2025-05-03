extends CharacterBody2D

var check = 0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("use") and check == 1:
		Signals.emit_signal("compartment")
		var tween = get_tree().create_tween();
		tween.tween_callback(queue_free);
		Signals.emit_signal("item", "sword")
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	check = 1
	$AnimatedSprite2D.visible = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	check = 0
	$AnimatedSprite2D.visible = false
