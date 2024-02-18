extends Control

#@onready var parallax = $ParallaxBackground

		
	
func _on_start_pressed():
	Global.startGame()
	


func _on_option_pressed():
	Global.background()
	get_tree().change_scene_to_packed(load("res://option.tscn"))


func _on_back_pressed():
	pass


func _on_quit_pressed():
	get_tree().quit() 
