extends Node

var level = 1
var health = 5
var travelAlt = false
var travelX = 100
var travelY = 550

func travelScene():
	if travelAlt == false:
		get_tree().change_scene_to_file("Level" + str(level) + "Alt.tscn")
	else:
		get_tree().change_scene_to_file("Level" + str(level) + ".tscn")

func travelPlayer():
	get_tree().root.get_node("Level/Player/Player").position.x = travelX
	get_tree().root.get_node("Level/Player/Player").position.y = travelY
