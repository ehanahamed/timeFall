extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Jump").position.x = (get_viewport().get_visible_rect().size.x - 120)
	get_node("Freeze").position.x = (get_viewport().get_visible_rect().size.x - 240)
	get_node("Timetravel").position.x = (get_viewport().get_visible_rect().size.x - 120)
	get_node("Slow").position.x = (get_viewport().get_visible_rect().size.x - 240)
