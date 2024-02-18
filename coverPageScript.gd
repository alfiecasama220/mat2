extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("move")
	if !Global.music.is_playing():
		Global.music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("enter"):
		get_tree().change_scene_to_packed(load("res://menuScene.tscn"))
