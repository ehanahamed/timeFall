extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Game.forceShowTouch:
		get_node("Left").visibility_mode = 0
		get_node("Right").visibility_mode = 0
		get_node("Jump").visibility_mode = 0
		get_node("Freeze").visibility_mode = 0
		get_node("Timetravel").visibility_mode = 0
		get_node("Slow").visibility_mode = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Jump").position.x = (get_viewport().get_visible_rect().size.x - 120)
	get_node("Freeze").position.x = (get_viewport().get_visible_rect().size.x - 240)
	get_node("Timetravel").position.x = (get_viewport().get_visible_rect().size.x - 120)
	get_node("Slow").position.x = (get_viewport().get_visible_rect().size.x - 240)
	get_node("Pause").position.x = (get_viewport().get_visible_rect().size.x - 80)


func _on_pause_button_up():
	Game.pause()
