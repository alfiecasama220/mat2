extends Node2D

@export var transitioners : transitioner
@onready var gui = $CanvasLayer/GUI

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.activateBackground = false
	Global.camera.enabled = false
	transitioners.set_next_animation(false)
	gui.visible = false
	$CanvasLayer3.visible = false
	$CanvasLayer3/finish.play("move")
	$backgroundMusic.play()	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	await get_tree().create_timer(2).timeout
	gui.visible = true


func _on_lava_collide_body_entered(body):
	if body is Otter:
		Global.died()


func _on_flags_body_entered(body):
	if body is Otter:
		$CanvasLayer3.visible = true 
		playFireworks()

func playFireworks():
	$CanvasLayer3/move_blue.play("move_blue")
	$CanvasLayer3/move_green.play("move_green")
	$CanvasLayer3/move_orange.play("move_orange")
	$CanvasLayer3/move_orange2.play("move_blue")
	$CanvasLayer3/move_orange3.play("move_green")
	$backgroundMusic.stop()	
	$CanvasLayer3/effect.play()
	await get_tree().create_timer(1).timeout
	$CanvasLayer3/music.play()


func _on_texture_button_pressed_retry():
	Global.startGame()


func _on_texture_button_2_pressed_menu():
	Global.menuScene()
