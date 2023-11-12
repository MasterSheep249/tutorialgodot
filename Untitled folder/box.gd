extends ItemContainer


# Called when the node enters the scene tree for the first time.
signal spawnItem(pos)
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hit():
	print('box was hit')
	spawnItem.emit(position)
	queue_free()
