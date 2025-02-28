extends CharacterBody2D

@export var speed = 5
var jump = false
@onready var sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Move_Right"):
		position.x =+ speed
		sprite.play("Walk")
		sprite.flip_h = false
	elif Input.is_action_pressed("Move_Left"):
		position.x -= speed
		sprite.play("Walk")
		sprite.flip_h = true
	elif Input.is_action_pressed("Jump") or jump:
		sprite.play("Jump")
		jump = true
	else:
		sprite.play("Idle")
	
	pass


func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "Jump":
		jump = false
	pass # Replace with function body.
