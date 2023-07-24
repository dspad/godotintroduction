extends CanvasLayer

#equivalente a valorizzare la variabile nella funzione ready()
@onready var laser_label : Label = $LaserCounter/Bullets/Label

func update_laser_text():
	#converti in stringa
	laser_label.text = str(Globals.laser_amount)
