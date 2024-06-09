extends Node


const SAVE_PATH = "res://savefile"

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var jsondata: Dictionary = {
		"level": Game.level
	}
	var jsonstring = JSON.stringify(jsondata)
	file.store_line(jsonstring)
	
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var jsondata = JSON.parse_string(file.get_line())
			if jsondata:
				Game.level = jsondata["level"]

func handleTouchControls():
	if OS.has_feature("android") or OS.has_feature("web_android") or true:
		var touchControls = load("res://Global/Touchscreen/Controls.tscn")
		add_child(touchControls.instantiate())
