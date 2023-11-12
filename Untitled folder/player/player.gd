extends CharacterBody2D

var can_grenade = true
var can_laser = true
var laserStartingPosition
var grenadeStartingPosition = Vector2(10,-93)
var is_player: bool = true
@export var speed = 500

signal laser_shot(pos, direction)
signal grenade_shot(pos, direction)
#signal laser_direction(direction)

func _ready():
	randomize()
	pass
func _process(delta):	
	velocity = Vector2(0,300)

	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	#rotation
	look_at(get_global_mouse_position())

	if(Input.is_action_pressed("primary action")) and can_laser and Globals.laser_amount > 0:
		var laser_markers = $Laserpoint1
		var dir = (get_global_mouse_position() - position).normalized()
		laser_shot.emit(laser_markers.global_position, dir)
		can_laser = false
		$LaserDelay.start()
		Globals.laser_amount -= 1
		
	if(Input.is_action_pressed("secondary action")) and can_grenade and Globals.grenade_amount > 0:
		var grenade_position = $Laserpoint1
		var dir = (get_global_mouse_position() - position).normalized()
		grenade_shot.emit(grenade_position.global_position, dir)
		can_grenade = false
		$GrenadeDelay.start()
		Globals.grenade_amount -= 1
	
	if(Input.is_action_pressed("zoom_in")):
		$Camera2D.zoom -= Vector2(.01,.01)
	if(Input.is_action_pressed("zoom_out")):
		$Camera2D.zoom -= Vector2(-.01,-.01)

func _on_delay_timeout():
	can_laser = true

func _on_grenade_delay_timeout():
	can_grenade = true


func _on_box_spawn_item(pos):
	pass
func add_item(item):
	if item == 'laser':
		Globals.laser_amount += 5
	elif item == "grenade":
		Globals.grenade_amount += 1
	else:
		Globals.health -= 20
