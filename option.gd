extends Control


func _on_back_pressed():
	get_tree().change_scene_to_packed(load("res://menuScene.tscn"))


func _on_check_button_pressed():
	if Global.music.is_playing():
		Global.music.stop()
	elif !Global.music.is_playing():
			Global.music.play()
