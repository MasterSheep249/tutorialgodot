extends LevelParent

func _on_maingate_player_entered_gate():
	$Player.speed = 0
	get_tree().change_scene_to_file("res://inside.tscn")
