extends CharacterBody2D

var health = 3
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")

var canTimeFreeze = true
var canDoubleJump = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor():
		canDoubleJump = false

	# Handle jump.
	if Engine.time_scale != 0:
		if Input.is_action_just_pressed("move_jump") and (is_on_floor() or canDoubleJump):
			velocity.y = JUMP_VELOCITY
			canDoubleJump = false

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
		
	if Input.is_action_just_pressed("time_normal"):
		Engine.time_scale = 1
	if Input.is_action_just_pressed("time_freeze"):
		if Engine.time_scale != 0 and canTimeFreeze:
			Engine.time_scale = 0
			canDoubleJump = true
			await get_tree().create_timer(5.0, true, false, true).timeout
			Engine.time_scale = 1
			canTimeFreeze = false
			await get_tree().create_timer(5.0, true, false, true).timeout
			canTimeFreeze = true
		elif Engine.time_scale == 0:
			Engine.time_scale = 1
			canTimeFreeze = false
			await get_tree().create_timer(5.0, true, false, true).timeout
			canTimeFreeze = true
	if Input.is_action_just_pressed("time_slow"):
		if Engine.time_scale == 0.5:
			Engine.time_scale = 1
		else:
			Engine.time_scale = 0.5
	if Input.is_action_just_pressed("time_fast"):
		if Engine.time_scale == 2:
			Engine.time_scale = 1
		else:
			Engine.time_scale = 2
	
	move_and_slide()
	
	if health  <= 0:
		queue_free()
		get_tree().change_scene_to_file("res://Main.tscn")
