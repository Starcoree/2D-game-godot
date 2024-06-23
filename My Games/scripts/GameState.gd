extends Node

var lives = 3

func decrease_lives():
	if lives > 0:
		lives -= 1
	else:
		game_over()

func game_over():
	# Handle game over logic
	print("Game Over")
	get_tree().quit()
