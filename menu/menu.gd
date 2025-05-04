extends Node2D


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://location/train.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_exit_mouse_entered() -> void:
	$Exit.flat = false

func _on_play_mouse_entered() -> void:
	$Play.flat = false

func _on_exit_mouse_exited() -> void:
	$Exit.flat = true

func _on_play_mouse_exited() -> void:
	$Play.flat = true
