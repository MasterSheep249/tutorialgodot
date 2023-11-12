extends Label

var green = Color("6bbfa3")
var red = Color("red")
var theImage = "UI/LaserCounter/VBoxContainer/TextureRect"

# Called when the node enters the scene tree for the first time.
func _ready():
	text = " " + str(Globals.laser_amount)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "  " + str(Globals.laser_amount)
	if(len(text) < 4):
		text = "   " + str(Globals.laser_amount)
