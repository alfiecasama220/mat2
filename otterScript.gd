extends CharacterBody2D
class_name Otter

const SPEED = 200.0
const JUMP_VELOCITY = -350.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animation = $AnimatedSprite2D;
@onready var runSound = $run;
@onready var animationTree = $AnimationTree;
@onready var camera = $Camera2D

var sound = preload("res://sound effects/running-in-grass-6237.mp3")
var jumpSound = preload("res://sound effects/whoosh-6316.mp3")

func _ready():
	animationTree.active = true
	Global.player = self


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor(): 
		velocity.y += gravity * delta
		
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY + Global.playerJump
		
	Global.jumpSound = jumpSound
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("run_left", "run_right")
	if direction:
		if !$run.is_playing():
			$run.stream = sound
			$run.play()
			$run.volume_db = 2
			
		if velocity.x > 0:
			velocity.x = direction * SPEED
			animationTree["parameters/conditions/idle"] = false
			animationTree["parameters/conditions/run_right"] = true
			animationTree["parameters/conditions/run_left"] = false
			animationTree["parameters/conditions/jump"] = false

					
		else:
			velocity.x = direction * SPEED
			animationTree["parameters/conditions/idle"] = false
			animationTree["parameters/conditions/run_left"] = true
			animationTree["parameters/conditions/run_right"] = false
			animationTree["parameters/conditions/jump"] = false
		
			
		if velocity.y < 0:
			animationTree["parameters/conditions/jump"] = true
			animationTree["parameters/conditions/run_left"] = false
			animationTree["parameters/conditions/run_right"] = false
			animationTree["parameters/conditions/idle"] = false
		
			if !$jump.is_playing():
				$jump.stream = jumpSound
				$jump.play()
				$jump.volume_db = -4.685
				
				

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animationTree["parameters/conditions/idle"] = true
		animationTree["parameters/conditions/run_left"] = false
		animationTree["parameters/conditions/run_right"] = false
		animationTree["parameters/conditions/jump"] = false
		$run.stop()
		
		if direction == 0:
			if velocity.y < 0:
				animationTree["parameters/conditions/jump"] = true
				animationTree["parameters/conditions/run_left"] = false
				animationTree["parameters/conditions/run_right"] = false
				animationTree["parameters/conditions/idle"] = false
				if !$jump.is_playing():
					$jump.stream = jumpSound
					$jump.play()
					$jump.volume_db = -4.685
		
	
	if Global.eggs == 3:
		velocity = Vector2.ZERO
		
	if Global.playerHPGlobal <= 0:
		Global.camera.enabled = true
		Global.activateBackground = true
		get_tree().change_scene_to_packed(load("res://gameOver.tscn"))
	
	
	Global.PlayerPostionGlobal = self.position
	move_and_slide()
	

