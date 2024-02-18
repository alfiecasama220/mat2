extends Node2D

@onready var music = $AudioStreamPlayer2D
@onready var timer = $TimerLevel;
@onready var timerLevel = $Timer;
@onready var parallax = $GlobalBackground
@onready var diedSound =  $diedSound
@export var transitioners : transitioner
var eggs = 0;

@onready var camera = $GlobalBackground/CameraBackground
@onready var pickSound = $collected

var player : Otter
var level = null

var activateBackground = false
var jumpSound = null
var PlayerPostionGlobal

var playerHPGlobal = 100;
var playerJump = 0;
var current_checkpoint : Checkpoint
var checkpointText = null
var coins = 0
#var playerOtter = preload("res://otter.tscn").instantiate()

func _ready():
	activateBackground = true
	camera.enabled = true
	
#	music.play()

func respawn_player():
	if current_checkpoint != null:
		player.position = current_checkpoint.global_position
		playerHPGlobal += -40

func _physics_process(_delta):
	if activateBackground == true:
		background()
	else:
		backgroundStop()
		
	
		
func _on_timer_level_timeout():
	print("Timeout")
	
func background():
	activateBackground = true
	parallax.scroll_base_offset -= Vector2(2,0)
	
func backgroundStop():
	activateBackground = false
	parallax.scroll_base_offset = Vector2(0,0)
	

func _on_timer_timeout():
	pass # Replace with function body.
	
func startGame():
	activateBackground = false
	camera.enabled = false
	playerData()
	if music.is_playing():
		music.stop()
	get_tree().change_scene_to_packed(load("res://gameScene.tscn"))
	
func menuScene():
	activateBackground = true
	camera.enabled = true
	if !music.is_playing():
		music.play()
	get_tree().change_scene_to_packed(load("res://menuScene.tscn"))
	
	
func died():
	diedSound.play()
	respawn_player()
	
func playerData():
	playerHPGlobal = 100;
	playerJump = 0;
	checkpointText = null
	coins = 0
	eggs = 0;
	
func pickSoundFunc():
	pickSound.play()
	
