extends Sprite2D

var pos: Vector2 = Vector2.ZERO
const speed: int = 100
#var test_scale: int = 1

func _ready():
	pos = Vector2(100,200)
	position = pos
#	test_scale = 2



func _process(delta):
	pos.x += speed * delta
	position = pos
	rotation_degrees += 5
#	scale.x += test_scale
#	scale.y += test_scale
