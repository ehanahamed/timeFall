extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Logo").position.x = (get_viewport().get_visible_rect().size.x / 2)
	get_node("Names").position.x = ((get_viewport().get_visible_rect().size.x / 2) - 234)
	get_node("Text").position.x = ((get_viewport().get_visible_rect().size.x / 2) - 260)
