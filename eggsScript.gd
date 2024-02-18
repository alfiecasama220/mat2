extends CharacterBody2D

@onready var eggs = $eggs


var player = false

func _ready():
	eggs.play("eggs")

func _on_collect_body_entered(body):
	if body is Otter:
		Global.pickSoundFunc()
		Global.eggs += 1
		eggs.queue_free()
		await get_tree().create_timer(0.1).timeout
		self.queue_free()
	#	print("Sound")
		player = true
		
		
func setTimer():
	await get_tree().create_timer(1).timeout
	queue_free()
