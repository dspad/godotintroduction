extends CanvasLayer

#colors
var green_color : Color = Color("6bbfa3")
var red_color : Color = Color(1,0,0,1)

#equivalente a valorizzare la variabile nella funzione ready()
@onready var laser_label : Label = $LaserCounter/Bullets/Label
@onready var grenade_label : Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon : TextureRect = $LaserCounter/Bullets/TextureRect
@onready var grenade_icon : TextureRect = $GrenadeCounter/VBoxContainer/TextureRect

func _ready():
	update_laser_text()
	update_grenade_text()

func update_laser_text():
	#converti in stringa
	laser_label.text = str(Globals.laser_amount)
	laser_label.modulate = green_color

func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amont)
	grenade_label.modulate = red_color
