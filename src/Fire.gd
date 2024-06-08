extends CharacterBody2D

func _ready():
	get_node("AnimatedSprite2D").play("Fire")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var stillColliding = false
func onStillColliding(body):
	if stillColliding:
		body.health -= 1
		await get_tree().create_timer(1.0, true, false, false).timeout
		onStillColliding(body)

func _on_player_collision_body_entered(body):
	if body.name == "Player":
		body.health -= 1
		stillColliding = true
		await get_tree().create_timer(1.0, true, false, false).timeout
		onStillColliding(body)

func _on_player_collision_body_exited(body):
	if body.name == "Player":
		stillColliding = false
