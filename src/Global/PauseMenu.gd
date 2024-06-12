extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_unpause_pressed():
	Game.unpause()

func _on_reset_pressed():
	Game.unpause()
	get_tree().reload_current_scene()

func _on_exit_pressed():
	Game.unpause()
	get_tree().change_scene_to_file("res://Main.tscn")
