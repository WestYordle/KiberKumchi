extends CharacterBody2D

var check = 0
@export var gui_item : Node
@export var item_name : String = "battery"


func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("use") and check == 1:
		var tween = get_tree().create_tween();
		tween.tween_property(self,"position",position-Vector2(0,50),1)
		tween.parallel().tween_property(self,"modulate",self_modulate-Color(0,0,0,1),1)
		tween.parallel().tween_property(gui_item,"modulate",gui_item.self_modulate+Color(0,0,0,1),1)
		tween.parallel().tween_property(gui_item,"position",gui_item.position+Vector2(100,0),1)
		tween.tween_callback(queue_free);
		Signals.emit_signal("item", item_name)
		
func _on_area_2d_body_entered(_body: Node2D) -> void:
	check = 1
	$AnimatedSprite2D.visible = true

func _on_area_2d_body_exited(_body: Node2D) -> void:
	check = 0
	$AnimatedSprite2D.visible = false
