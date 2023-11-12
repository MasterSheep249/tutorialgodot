extends Area2D

var speed: int = 1000
var direction: Vector2 = Vector2.UP

func _process(delta):
	position += direction * speed * delta
func start_emitting():
	$Shotparticles.emitting = true
	$Otherparticles.emitting = true
	



func _on_despawn_timeout():
	queue_free()


func _on_body_entered(body):
	if "hit" in body:
		body.hit()
	if "is_player" in body:
		return
	queue_free()
