extends CharacterBody2D

@onready var sound = $AudioStreamPlayer
@onready var coins = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	coins.play("coin")

func _on_area_2d_body_entered(body):
	if body is Otter:
		Global.coins += 1
		sound.play()
		coins.queue_free()
		await get_tree().create_timer(1).timeout
		self.queue_free()
		print("Collected")

func timer():
	await get_tree().create_timer(1).timeout
	queue_free()
