extends Area2D

#@export permette di vedere questa variabile nell'inspector della scena
#utile per debug ed evitare di cambiare ogni volta il valore direttamente nel codice
@export var LASER_SPEED : int = 1000
var local_laser_direction : Vector2 = Vector2.UP

func _process(delta):
	position += local_laser_direction * LASER_SPEED * delta