extends CanvasLayer

@export_file("*.json") var d_file
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Signals.connect("dialog", Callable(self, "_on_dialog"))

func start():
	part_dialoge = -1
	dialoge = load_dialoge()
	
func load_dialoge():
	var file = FileAccess.open(d_file, FileAccess.READ)
	file = file.get_as_text()
	return JSON.parse_string(file)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_dialog():
	pass
