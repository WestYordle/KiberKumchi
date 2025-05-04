extends Node2D

@onready var menu_buttuns_click: AudioStreamPlayer = $menu_buttuns_click


func _on_play_pressed() -> void:
<<<<<<< HEAD
	get_tree().change_scene_to_file("res://location/train.tscn")
=======
	menu_buttuns_click.play()
	get_tree().change_scene_to_file("res://location/testlocation.tscn")
>>>>>>> 95e9a85 (звуки кнопок в меню)

func _on_exit_pressed() -> void:
	menu_buttuns_click.play()
	await menu_buttuns_click.finished
	get_tree().quit()

func _on_exit_mouse_entered() -> void:
	$Exit.flat = false

func _on_play_mouse_entered() -> void:
	$Play.flat = false

func _on_exit_mouse_exited() -> void:
	$Exit.flat = true

func _on_play_mouse_exited() -> void:
	$Play.flat = true
