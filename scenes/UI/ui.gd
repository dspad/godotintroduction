extends CanvasLayer

#equivalente a valorizzare la variabile nella funzione ready()
@onready var laser_label : Label = $LaserCounter/Bullets/Label
@onready var grenade_label : Label = $GrenadeCounter/VBoxContainer/Label

func _ready():
	update_laser_text()
	update_grenade_text()

func update_laser_text():
	#converti in stringa
	laser_label.text = str(Globals.laser_amount)

func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amont)
