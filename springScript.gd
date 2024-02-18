extends CharacterBody2D

var speed = 0;
var player = null
var enter = false

func _physics_process(delta):
	if enter == true:
		velocity.y += -speed
		
	else:
		velocity.y += speed
	move_and_slide()
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("otter"):
		speed = 400
		print("UP")
		player = body
		enter = true
		
	

func _on_area_2d_body_exited(body):
	if body.is_in_group("otter"):
		speed = 30
		player = null
		enter = false
