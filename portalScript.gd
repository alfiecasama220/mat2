extends Node2D

@onready var animation = $AnimatedSprite2D;

var playerEnter = false


# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("portal")


		
		
