extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://level 1.tscn")
	pass # Replace with function body.

func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Controls.tscn")
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
	
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	pass # Replace with function body.
