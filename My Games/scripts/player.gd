extends CharacterBody2D

@export var speed = 620
@export var gravity = 50
@export var jump_force = 900

var lives = GameState.lives
@onready var lives_label = $LivesLabel  # Adjust the path if needed
@onready var sprite : Sprite2D = $sprite

func _ready():
	update_lives_label()

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = speed * horizontal_direction
	move_and_slide()

	if horizontal_direction < 0:
		sprite.flip_h = true
	elif horizontal_direction > 0:
		sprite.flip_h = false

	# For testing purposes, decrease lives when the player presses a key
	if Input.is_action_just_pressed("ui_select"):  # Replace with your desired action
		decrease_lives()
		
	

func decrease_lives():
	if lives > 0:
		lives -= 1
		update_lives_label()
	else:
		game_over()

func game_over():
	# Handle game over logic
	print("Game Over")
	get_tree().quit()

func update_lives_label():
	lives_label.text = "Lives: " + str(lives)
