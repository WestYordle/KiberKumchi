extends Node2D

var start_menu = 0;

func _ready() -> void:
	Signals.connect("compartment", Callable(self, "_on_compartment"))
	Signals.connect("out_compartment", Callable(self, "_on_out_compartment"))
	Signals.connect("item", Callable(self, "_on_item"))
	Signals.connect("die", Callable(self, "_on_die"))
	$DirectionalLight2D.energy = 1
	start()

func _on_compartment():
	Signals.emit_signal("camera", 1536, 3520)
	$hero.position.y = 2112.0

func _on_out_compartment():
	print("out")
	Signals.emit_signal("camera", -2400, 7200)
	$hero.position.y -= 1350

func start():
	if start_menu == 0:
		Signals.emit_signal("dialoge", "dialog2")
	Signals.emit_signal("camera", 1536, 3520)
	$hero.position.y = 2112.0
	$hero.position.x = 1984.0
	
