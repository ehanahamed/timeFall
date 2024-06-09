extends Node

var level = 1
var health = 5
var travelAlt = false
var travelX = 100
var travelY = 550

func timeTravel():
	if travelAlt == false:
		get_tree().change_scene_to_file("Level" + str(level) + "Alt.tscn")
		get_node("/root/Level" + str(level) + "Alt/Player").position.x = travelX
		get_node("/root/Level" + str(level) + "Alt/Player").position.y = travelY
	else:
		get_tree().change_scene_to_file("Level" + str(level) + ".tscn")
		get_node("/root/Level" + str(level) + "/Player").position.x = travelX
		get_node("/root/Level" + str(level) + "/Player").position.y = travelY
