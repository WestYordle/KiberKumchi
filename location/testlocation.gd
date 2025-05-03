extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.connect("compartment", Callable(self, "_on_compartment"))
	Signals.connect("out_compartment", Callable(self, "_on_out_compartment"))
	Signals.connect("item", Callable(self, "_on_item"))
	Signals.connect("die", Callable(self, "_on_die"))
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


func _on_area_right_2d_2_body_entered(body: Node2D) -> void:
	print("СТЕНАААААА")
	Signals.emit_signal("wall")

func _on_area_left_2d_body_entered(body: Node2D) -> void:
	print("ААААААА")
	Signals.emit_signal("wall")

func _on_die():
	print("Смерть")
	$AnimationPlayer.play("Die")
	$CanvasLayer/End.visible = true
	$CanvasLayer/TextEnd.visible = true
