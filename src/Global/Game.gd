extends Node

var health = 5
var level = 1
var levelAlt = false
var travel = false
var travelX = 0
var travelY = 0

func travelScene():
	if levelAlt == false:
		travel = true
		levelAlt = true
		get_tree().change_scene_to_file("Level" + str(level) + "Alt.tscn")
	else:
		travel = true
		levelAlt = false
		get_tree().change_scene_to_file("Level" + str(level) + ".tscn")

func travelPlayer():
	if travel:
		get_tree().root.get_node("Level/Player/Player").position.x = travelX
		get_tree().root.get_node("Level/Player/Player").position.y = travelY
		travel = false
