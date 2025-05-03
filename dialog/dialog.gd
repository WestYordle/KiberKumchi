extends CanvasLayer

@export_file("*.json") var d_file
var dialoge
var json = JSON.new()
var part_dialoge 
var dialoge_reset : int
var dialog_loag = false
var npc
var has_shown_dialogue = false # Новая переменная, отслеживающая показ диалога

func _ready() -> void:
	Signals.connect("dialoge", Callable(self, "_on_dialog"))
	$".".visible = false

func start():
	if not has_shown_dialogue: # Запустится только если ещё не было показано
		has_shown_dialogue = true # Ставим флаг, что диалог уже показан
		part_dialoge = -1
		dialoge = load_dialoge()

func load_dialoge():
	var file = FileAccess.open(d_file, FileAccess.READ)
	file = file.get_as_text()
	return JSON.parse_string(file)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("use") and dialog_loag == true:
		next_chat()

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
		$".".visible = false
