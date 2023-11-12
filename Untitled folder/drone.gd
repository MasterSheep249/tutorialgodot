extends CharacterBody2D

func _process(delta):
	var speed = 500
	var direction = Vector2(1,0)
	velocity = speed * direction
	move_and_slide()

func hit():
	print('hit')
