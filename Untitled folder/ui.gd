extends CanvasLayer

@onready var vboxlaser = $LaserCounter/VBoxContainer/TextureRect
@onready var vboxlabel = $LaserCounter/VBoxContainer/Label
@onready var vboxgrenade = $GrenadeContainer/TextureRect
@onready var vboxglabel = $GrenadeContainer/VBoxContainer/Label
# Called when the node enters the scene tree for the first time.
func _ready():
	$TextureProgressBar.value = Globals.health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Globals.laser_amount == 0):
		vboxlaser.modulate = Color("red")
		vboxlabel.modulate = Color("red")
	else:
		vboxlaser.modulate = Color("green")
		vboxlabel.modulate = Color("green")
	if(Globals.grenade_amount == 0):
		vboxgrenade.modulate = Color("red")
		vboxglabel.modulate = Color("red")
	else:
		vboxgrenade.modulate = Color("green")
		vboxglabel.modulate = Color("green")
	$TextureProgressBar.value = Globals.health
		
		
	
