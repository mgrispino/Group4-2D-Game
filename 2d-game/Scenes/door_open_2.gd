extends Sprite2D

@onready var keycard = $"../Keycard"
var open = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	
	pass


func _on_keycard_hidden() -> void:
	self.show()
	open = true
	
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:	
	if open:
		if body.name == "CharacterBody2D":  
			get_tree().change_scene_to_file("res://Scenes/level 3.tscn")
	pass # Replace with function body.
