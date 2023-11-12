extends Area2D

var rotation_speed = 5
var type = ['laser', 'grenade', 'health']
var actual = type[randi()%len(type)]
func _ready():
	if actual == 'laser':
		$Sprite2D.modulate = Color("green")
	if actual == 'grenade':
		$Sprite2D.modulate = Color("red")
	if actual == 'health':
		$Sprite2D.modulate = Color("blue")

func _start():
	rotation += rotation_speed





func _on_body_entered(body):
	body.add_item(actual)
	queue_free()
