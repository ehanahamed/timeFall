extends Node

var paused = false
var health = 5
var level = 1
var levelAlt = false
var travel = false
var travelX = 0
var travelY = 0

func pause():
	if paused == false:
		Engine.time_scale = 0
		paused = true
		var pauseMenu = load("res://Global/PauseMenu.tscn")
		get_node("/root").add_child(pauseMenu.instantiate())
	else:
		unpause()

func unpause():
	get_tree().root.get_node("PauseMenu").queue_free()
	paused = false
	Engine.time_scale = 1

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

func _process(delta):
	if Input.is_action_just_released("pause"):
		pause()
