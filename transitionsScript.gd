extends Control
class_name transitioner

@onready var animation_tex = $TextureRect;
@onready var animationPlayer = $AnimationPlayer;

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_tex.visible = false
	
func set_next_animation(fading_out):
	if fading_out == true:
		animationPlayer.queue("fade_out")
		await get_tree().create_timer(1).timeout
		self.queue_free()
		get_tree().change_scene_to_file("res://undergroundScene.tscn")
	else:
		animationPlayer.queue("fade_in")
