extends CharacterBody2D

func _ready():
	get_node("AnimatedSprite2D").play("Fire")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_collision_body_entered(body):
	if body.name == "Player":
		body.health -= 1
