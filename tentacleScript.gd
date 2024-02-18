extends CharacterBody2D

@onready var animation = $AnimatedSprite2D

func _ready():
	animation.play("move")
	

func _on_area_2d_body_entered(body):
	if body is Otter:
		Global.playerHPGlobal -= 10
