extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")



var canTimeFreeze = true
var canExtraJump = false

func _ready():
	var onscreenControls = load("res://Global/Controls.tscn")
	get_node("/root").add_child(onscreenControls.instantiate())
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor():
		canExtraJump = false
		canTimeFreeze = true

	# Handle jump.
	if Engine.time_scale != 0:
		if Input.is_action_just_pressed("move_jump") and (is_on_floor() or canExtraJump):
			canExtraJump = false
			if Engine.time_scale == 0.5:
				velocity.y = JUMP_VELOCITY*1.5
			else:
				velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if Engine.time_scale != 0:
		if direction:
			velocity.x = direction * SPEED
			anim.play("Run")
			if direction < 0:
				get_node("AnimatedSprite2D").flip_h = true
			
			else:
				get_node("AnimatedSprite2D").flip_h = false
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			anim.play("Idle")

	if Input.is_action_just_pressed("time_freeze"):
		if Game.level >= 4:
			if Engine.time_scale != 0 and canTimeFreeze:
				Engine.time_scale = 0
				canExtraJump = true
			elif Engine.time_scale == 0 and (Game.paused == false):
				Engine.time_scale = 1
				canTimeFreeze = false
	if Input.is_action_just_pressed("time_slow"):
		if Game.level >= 2:
			if Engine.time_scale == 0.5:
				Engine.time_scale = 1
			else:
				Engine.time_scale = 0.5
	if Input.is_action_just_pressed("time_travel"):
		if Game.level >= 3:
			Game.travelX = position.x
			Game.travelY = position.y
			get_tree().root.get_node("Controls").queue_free()
			Game.travelScene()
			
	move_and_slide()
	
	if Input.is_action_just_released("pause"):
		Game.pause()
	
	if Game.health  <= 0:
		queue_free()
		get_tree().root.get_node("Controls").queue_free()
		get_tree().change_scene_to_file("res://Main.tscn")
		Engine.time_scale = 1

func _on_level_ready():
	Game.travelPlayer()
