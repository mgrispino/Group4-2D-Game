extends CharacterBody2D

@export var speed = 500
@export var jump_force = 400
@export var gravity = 600 

var gravity_direction = 1
# 1 = normal grav, 0 = flipped gravity
var in_air = false
# Tracking if the character is floating in air
var jumping = false
# Tracks character jumping

@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
	# GRAVITY
	velocity.y += gravity * gravity_direction * delta

	var moving = false
	var on_ground = is_on_floor() if gravity_direction == 1 else is_on_ceiling()

	if in_air and on_ground:
		sprite.play("Land")
		in_air = false
		jumping = false
	
	# RIGHT/LEFT
	if Input.is_action_pressed("Move_Right"):
		velocity.x = speed
		sprite.flip_h = false
		moving = true
	elif Input.is_action_pressed("Move_Left"):
		velocity.x = -speed
		sprite.flip_h = true
		moving = true
	else:
		velocity.x = 0

	# JUMPING
	if Input.is_action_just_pressed("Jump") and on_ground:
		velocity.y = -jump_force * gravity_direction  # Reversing the Jump Force
		sprite.play("Jump")
		in_air = true
		jumping = true

	# FLIPPING GRAVITY
	if Input.is_action_just_pressed("Flip"):
		gravity_direction *= -1  # Inverting gravity
		sprite.flip_v = not sprite.flip_v  # Flipping the sprite upsidedown
		in_air = true
		jumping = false
	
	if not on_ground:
		in_air = true
		if jumping:
			sprite.play("Jump")
		elif (gravity_direction == 1 and velocity.y > 0) or (gravity_direction == -1 and velocity.y < 0):
			sprite.play("Fall")
	elif moving:
		sprite.play("Walk")
	else:
		sprite.play("Idle")


	move_and_slide()
