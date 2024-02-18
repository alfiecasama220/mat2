extends CharacterBody2D

@onready var left = $left
@onready var right = $right
@onready var animation = $AnimatedSprite2D

func _ready():
	velocity.x += 20
	animation.play("walk_right")
	
func _physics_process(delta):
	
	if right.is_colliding():
		velocity.x -= delta * 300
		animation.play("walk_left")

	elif left.is_colliding():
		velocity.x += delta * 300
		animation.play("walk_right")

	move_and_slide()



func _on_enemy_collide_body_entered(body):
	if body is Otter:
		Global.playerHPGlobal += -15
