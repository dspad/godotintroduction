extends CanvasLayer

#colors
var green_color : Color = Color("6bbfa3")
var red_color : Color = Color(1,0,0,1)

#equivalente a valorizzare la variabile nella funzione ready()
@onready var laser_label : Label = $LaserCounter/Bullets/Label
@onready var grenade_label : Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon : TextureRect = $LaserCounter/Bullets/TextureRect
@onready var grenade_icon : TextureRect = $GrenadeCounter/VBoxContainer/TextureRect
@onready var health_bar : TextureProgressBar = $MarginContainer/TextureProgressBar

func _ready():
	#essempio di connessione a un signal via codice (da fare quando il signal è su una scena o script globale)
	#quando si emette il signal "health_changed" si esegue la funzione update_health_text
	Globals.connect("stat_changed", update_stats)
	update_laser_text()
	update_grenade_text()
	update_health_text()

func update_laser_text():
	#converti in stringa
	laser_label.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, laser_label, laser_icon)

func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_label, grenade_icon)
	
func update_health_text():
	#aggiorna la progress bar
	health_bar.value = Globals.health_amount

func update_stats():	
	update_laser_text()
	update_grenade_text()
	update_health_text()
	
func update_color(amount : int, label : Label,  icon : TextureRect):
	if amount == 0:
		label.modulate = red_color
		icon.modulate = red_color
	else:
		label.modulate = green_color
		icon.modulate = green_color
