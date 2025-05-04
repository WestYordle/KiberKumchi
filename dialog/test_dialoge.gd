extends Area2D

var check = 0

func _on_body_entered(_body: Node2D) -> void:
	$AnimatedSprite2D.visible = true
	Signals.emit_signal("dialoge", "test_dialog")
		
func _on_body_exited(_body: Node2D) -> void:
	Signals.emit_signal("dialoge", "out")
	$AnimatedSprite2D.visible = false
