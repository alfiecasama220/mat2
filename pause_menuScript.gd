extends CanvasLayer

@onready var guiLevelResume = $".."


func _on_resume_pressed():
	guiLevelResume.pauseMenu()


func _on_restart_pressed():
	guiLevelResume.pauseMenu()
	Global.startGame()


func _on_quit_pressed():
	guiLevelResume.pauseMenu()
	Global.menuScene()
