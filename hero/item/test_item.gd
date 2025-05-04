extends CharacterBody2D

var check = 0
@onready var battery = $"../CanvasLayer/Item07"

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("use") and check == 1:
		var tween = get_tree().create_tween();
		tween.tween_property(self,"position",position-Vector2(0,50),1)
		tween.parallel().tween_property(self,"modulate",self_modulate-Color(0,0,0,1),1)
		tween.parallel().tween_property(battery,"modulate",battery.self_modulate+Color(0,0,0,1),1)
		tween.parallel().tween_property(battery,"position",battery.position+Vector2(100,0),1)
		tween.tween_callback(queue_free);
		Signals.emit_signal("item", "sword")
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	check = 1
	$AnimatedSprite2D.visible = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	check = 0
	$AnimatedSprite2D.visible = false
