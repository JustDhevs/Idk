extends Label

@onready var angka : int = 0

func _ready():
	pass

func _process(delta):
	pass



func _on_score_timer_timeout():
	angka += 1
	text = str(angka)
