extends CharacterBody2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("fly")
	

func _physics_process(_delta):
	velocity.x += 2
	move_and_slide()


func _on_visible_on_screen_enabler_2d_screen_entered():
	print("Enabled")


func _on_visible_on_screen_enabler_2d_screen_exited():
	self.queue_free()
