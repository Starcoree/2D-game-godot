@export var speed = 300
@export var gravity = 30
@export var jump_force = 300

var velocity = Vector2()  # Assuming you have a velocity variable
var lives: int = 3  # Initial number of lives
onready var life_label: Label = get_node("/root/YourRootNode/PathToLabel")  # Update the path to your label

func _ready():
	update_life_label()

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	var horizontal_direction = Input.get_axis("move_left", "move_right")
	velocity.x = speed * horizontal_direction
	velocity = move_and_slide(velocity)
	print(velocity)

# Function to decrease life
func lose_life():
	lives -= 1
	print("Lives remaining: %d" % lives)
	update_life_label()
	if lives <= 0:
		# Handle game over
		game_over()
	else:
		# Reset player position or take other actions
		reset_player_position()

func update_life_label():
	life_label.text = "Lives: %d" % lives

func reset_player_position():
	# Code to reset the player's position
	global_position = Vector2(0, 0)  # Example: reset to origin
	velocity = Vector2()

func game_over():
	# Code to handle game over, such as restarting the level or showing a game over screen
	print("Game Over!")
	get_tree().reload_current_scene()  # Example action: restart the level
