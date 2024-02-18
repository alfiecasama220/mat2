extends Node2D
class_name Checkpoint

@onready var animation = $AnimatedSprite2D
@onready var checkpoint = $checkpoint
@onready var sound = $checkSound

var activated = false


func activate():
	Global.current_checkpoint = self
	activated = true
	sound.play()
	animation.stop()
	Global.checkpointText = "Checkpoint"
	checkpoint.text = Global.checkpointText
	setTimer()
	
func notActivated():
	activated = false
	animation.play("flag")
	Global.checkpointText = ""
	setTimer()

func _on_area_2d_body_entered(body):
	if body is Otter && !activated:
		activate()	
	else:
		notActivated()
		
		
func setTimer():
	await get_tree().create_timer(3).timeout
	setTime()

func setTime():
	activated = false
	checkpoint.text = ""
