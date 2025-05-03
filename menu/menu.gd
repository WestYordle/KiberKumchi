extends Node2D

@onready var menu_buttuns_click: AudioStreamPlayer = $menu_buttuns_click


func _on_play_pressed() -> void:
	menu_buttuns_click.play()
	get_tree().change_scene_to_file("res://location/testlocation.tscn")


func _on_exit_pressed() -> void:
	menu_buttuns_click.play()
	await menu_buttuns_click.finished
	get_tree().quit()
