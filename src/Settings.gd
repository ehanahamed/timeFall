extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Touchscreen").position.x = ((get_viewport().get_visible_rect().size.x / 2) - 200)
	get_node("Back").position.x = ((get_viewport().get_visible_rect().size.x / 2) - 200)

func _on_touchscreen_pressed():
	Game.forceShowTouch = true

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")
