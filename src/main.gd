extends Node2D

func _ready():
	Utils.loadGame()
	if Game.level == 0:
		Game.level = 1
		Utils.saveGame()
		
func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Level1.tscn")
