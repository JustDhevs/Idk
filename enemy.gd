extends Area2D

var direction: Vector2 = Vector2.ZERO
@export var speed: int = 10
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	var animation_name = sprite.sprite_frames.get_animation_names()
	sprite.play(animation_name[randi() % animation_name.size()])
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _process(delta):
	global_position += direction * speed
