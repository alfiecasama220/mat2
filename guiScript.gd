extends Control

@onready var objectives = $objectives
@onready var level = $level
@onready var plus = $plus
@onready var coins = $coins
@onready var pausedMenuScene = $PauseMenu

@onready var playerHP = $playerHP;

var collected = false
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level = "level 1" 
	level.text = str(Global.level)
	level.visible = false
	plus.visible = false
	pausedMenuScene.visible = false
	setTimer()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	objectives.text = "Collected: " + str(Global.eggs)
	playerHP.text = "HP: " + str(Global.playerHPGlobal)
	coins.text = "Coins: " + str(Global.coins)
	
	if Input.is_action_just_pressed("menu"):
		_on_menu_pressed()
	
	if Global.eggs == 3:
		Global.level = "Level 2"
		level.text = str(Global.level)
		Global.eggs += 2
		plus.text = "plus 2 eggs"
		setTimer()

func setTimer():
	await get_tree().create_timer(3).timeout
	setTime()
	
func setTime():
	collected = false
	level.text = "" 
	plus.text = ""


func _on_menu_pressed():
	pauseMenu()
	
func pauseMenu():
	if paused:
		pausedMenuScene.visible = false
		Engine.time_scale = 1
	else:
		pausedMenuScene.visible = true
		Engine.time_scale = 0
		
	paused = !paused
		
		
