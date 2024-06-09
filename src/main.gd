extends Node2D
		
func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	# Reset values every time the player presses play, like after dying
	Game.level = 1
	Game.health = 5
	Game.travelX = 100
	Game.travelY = 550
	# Go to level 1
	get_tree().change_scene_to_file("res://Level1.tscn")

func _process(delta):
	get_node("Logo").position.x = (get_viewport().get_visible_rect().size.x / 2)
	get_node("Play").position.x = ((get_viewport().get_visible_rect().size.x / 2) - 200)
	get_node("Quit").position.x = ((get_viewport().get_visible_rect().size.x / 2) - 200)
