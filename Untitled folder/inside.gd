extends LevelParent

var orb_scene = preload("res://orb.tscn")
func _ready():
	print('ready')

func _on_area_2d_body_entered(body):
	print('entered')
	get_tree().change_scene_to_file("res://outside.tscn")


func spawn_item():
	var orb = orb_scene.instantiate()
	return orb
	
	
func _on_box_spawn_item(pos):
	var item = spawn_item()
	item.position = pos


func _on_box_2_spawn_item(pos):
	randomize()
	print('called')
	var random_orbs = randi_range(1,4)
	for i in range(random_orbs):
		print('ran')
		var offset = randi_range(75,100)
		var offset_vector = Vector2(offset, offset)
		var item = spawn_item()
		#item.connect("call", inside.gd, "_on_area_2d_body_entered")
		item.position = pos + Vector2(offset,offset)
		add_child(item)


func _on_box_3_spawn_item(pos):
	var item = spawn_item()
	item.position = pos
