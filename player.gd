extends CharacterBody2D


const SPEED = 300.0
const ACCEL = 20

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	var direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	velocity.x = move_toward(velocity.x, SPEED * direction.x, ACCEL)
	velocity.y = move_toward(velocity.y, SPEED * direction.y, ACCEL)
	
	move_and_slide()
