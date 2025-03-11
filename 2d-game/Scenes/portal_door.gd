extends Area2D

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "CharacterBody2D":  
		get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
