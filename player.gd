extends Area2D

@export var speed: int = 10

var direction: Vector2 = Vector2.ZERO

func _unhandled_input(event):
	if event.is_action_pressed("DOWN"):
		direction.y = 1
	if event.is_action_released("DOWN"):
		direction.y = 0
	if event.is_action_pressed("UP"):
		direction.y = -1
	if event.is_action_released("UP"):
		direction.y = 0
	if event.is_action_pressed("RIGHT"):
		direction.x = 1
	if event.is_action_released("RIGHT"):
		direction.x = 0
	if event.is_action_pressed("LEFT"):
		direction.x = -1
	if event.is_action_released("LEFT"):
		direction.x = 0

func _process(delta):

		global_position += direction * speed
		
		if direction.length() > 0:
			$AnimatedSprite2D.play()
		else:
			$AnimatedSprite2D.stop()
			
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = false
		elif direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		if direction.y < 0:
			$AnimatedSprite2D.flip_v = false
		elif direction.y > 0:
			$AnimatedSprite2D.flip_v = true
			
		if direction.x !=0:
			$AnimatedSprite2D.animation = "Walk"
		elif direction.y !=0:
			$AnimatedSprite2D.animation = "Up"
	


func _on_area_entered(Enemy):
	queue_free()
	$"../AudioStreamPlayer".stop()
	$"../AudioStreamPlayer2".play()
	$"../Label".hide()
	$"../Timer".stop()
	
	
	
