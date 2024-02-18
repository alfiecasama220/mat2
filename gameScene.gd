extends Node2D

#var otter = Otter.new()
@export var transitioners : transitioner
var playerEnter : bool =  false

@onready var gui = $CanvasLayer/GUI

func _ready():
	transitioners.set_next_animation(false)
	gui.visible = false

func _physics_process(_delta):
	
	await get_tree().create_timer(3).timeout
	gui.visible = true
	
	
		
	if playerEnter == true:
		transitioners.set_next_animation(playerEnter)

func _on_ground_limit_body_entered(body):
	if body is Otter:
#		get_tree().change_scene_to_file("res://gameOver.tscn")
		Global.died()
		print("Collide")


		

func _on_check_button_toggled(button_pressed):
	transitioners.set_next_animation(button_pressed)


func _on_area_2d_body_entered_gameScene(body):
	if body is Otter:
		playerEnter = true
