extends Node2D
		
func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Level1.tscn")

func _process(delta):
	get_node("Play").position.x = ((get_viewport().get_visible_rect().size.x / 2) - 200)
	get_node("Quit").position.x = ((get_viewport().get_visible_rect().size.x / 2) - 200)
