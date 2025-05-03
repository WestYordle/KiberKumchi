extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.connect("compartment", Callable(self, "_on_compartment"))
	Signals.connect("out_compartment", Callable(self, "_on_out_compartment"))
	Signals.connect("item", Callable(self, "_on_item"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print($Hero.position)
	
func _on_compartment():
	print("in")
	$Hero.position.y = 443.0+650

func _on_out_compartment():
	print("out")
	$Hero.position.y = 443.0

func _on_item(name):
	$CanvasLayer/Item07.visible = true
