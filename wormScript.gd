extends CharacterBody2D

@onready var moveAnimation = $move;

func _physics_process(_delta):
	moveAnimation.play("move")
	
	move_and_slide()
	


func _on_collide_body_entered(body):
	if body is Otter:
		Global.playerHPGlobal -= 10
		setTimer()
		
func setTimer():
	await get_tree().create_timer(1).timeout
	queue_free()
