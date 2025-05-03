extends CanvasLayer

@export_file("*.json") var d_file
# Called when the node enters the scene tree for the first time.
var dialoge
var json = JSON.new()
var part_dialoge 
var dialoge_reset : int
var dialog_loag = false
var npc

func _ready() -> void:
	Signals.connect("dialoge", Callable(self, "_on_dialog"))
	$".".visible = false

func start():
	part_dialoge = -1
	dialoge = load_dialoge()
	
func load_dialoge():
	var file = FileAccess.open(d_file, FileAccess.READ)
	file = file.get_as_text()
	return JSON.parse_string(file)
<<<<<<< HEAD:dialog/dialog.gd
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("use") and dialog_loag == true:
		next_chat()
		
=======

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("use") and dialog_loag == true:
		next_chat()

>>>>>>> be06265 (no message):dialog.gd
func next_chat():
	if part_dialoge == -1:
		$".".visible = true
	part_dialoge += 1
	if part_dialoge < len(dialoge):
		$NinePatchRect/Name.text = dialoge[part_dialoge]["name"]
		$NinePatchRect/Chat.text = dialoge[part_dialoge]["text"]
	else: 
		$".".visible = false
		start()
		
func _on_dialog(chat):
	print(chat)
	if chat != "out":
		dialog_loag = true
		npc = chat
		$".".d_file = "res://dialog/"+"test_dialog"+".json"
		start()
	else:
		dialog_loag = false
<<<<<<< HEAD:dialog/dialog.gd
		$".".visible = false
=======
		$NinePatchRect.visible = false
>>>>>>> be06265 (no message):dialog.gd
