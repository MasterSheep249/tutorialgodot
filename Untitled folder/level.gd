extends Node2D
class_name LevelParent

var laser_scene = preload("res://laser.tscn")
var grenade_scene = preload("res://grenade.tscn")


func _on_player_laser_shot(pos, dir):
	print("laser from level")
	var laser = laser_scene.instantiate()
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(dir.angle()) + 90
	laser.direction = dir
	laser.start_emitting()
	$Projectiles.add_child(laser)


func _on_player_grenade_shot(pos, dir):
	print("grenade from level")
	var grenade = grenade_scene.instantiate()
	grenade.position = pos
	grenade.linear_velocity = 500 * dir
	$Projectiles.add_child(grenade)



func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1,1),1)


func _on_house_player_exited():
	print('exited')
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(.6,.6),1)
