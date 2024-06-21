extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

# Function to handle what happens when a body enters the area
func _on_body_entered(body):
	if body.name == "Player":  # Replace "Player" with the actual name of your player node
		# Add the logic for what happens when the player enters the line of death
		# For example: restart the level, decrease health, etc.
		print("Player has crossed the line of death!")
		# Example action: Restart the level
		get_tree().reload_current_scene()
