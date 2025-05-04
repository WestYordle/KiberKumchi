extends Node2D


# Called when the node enters the scene tree for the first time.
	
func _ready() -> void:
	Signals.emit_signal("camera", 0, 2240)
	
	Signals.connect("compartment", Callable(self, "_on_compartment"))
	Signals.connect("out_compartment", Callable(self, "_on_out_compartment"))
	Signals.connect("item", Callable(self, "_on_item"))
	Signals.connect("die", Callable(self, "_on_die"))
	Signals.connect("light_up", Callable(self, "_on_light_up"))
	$DirectionalLight2D.energy = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
	
	
func _on_compartment():
	$Hero.position.y = 443.0+650

func _on_out_compartment():
	print("out")
	$Hero.position.y = 443.0

func _on_item(name):
	$CanvasLayer/Item07.visible = true

func _on_light_up(_posX, _posY):
	#var tween = get_tree().create_tween()
	#tween.tween_property($CanvasLayer/Item07,"modulate",$CanvasLayer/Item07.self_modulate+Color(1,1,1,-1),0.5)
	#tween.play()
	$CanvasLayer/Item07.visible = false
	pass

func _on_area_right_2d_2_body_entered(body: Node2D) -> void:
	Signals.emit_signal("wall")
	print("СТЕНАААААА")


func _on_area_left_2d_body_entered(body: Node2D) -> void:
	Signals.emit_signal("wall")
	print("ААААААА")

func _on_die():
	print("Смерть")
	$AnimationPlayer.play("Die")
	$CanvasLayer/End.visible = true
	$CanvasLayer/TextEnd.visible = true
