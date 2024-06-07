extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_collision_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Level2.tscn")
