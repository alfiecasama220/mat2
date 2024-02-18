extends Control


func _on_retry_2_pressed():
	self.queue_free()
	Global.startGame()


func _on_mainmenu_pressed():
	self.queue_free()
	Global.menuScene()


func _on_quit_2_pressed():
	self.queue_free()
	get_tree().quit()
