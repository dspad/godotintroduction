extends Area2D

#@export permette di vedere questa variabile nell'inspector della scena
#utile per debug ed evitare di cambiare ogni volta il valore direttamente nel codice
@export var LASER_SPEED : int = 1000
const LASER_DIRECTION : Vector2 = Vector2.UP

func _process(delta):
	position += LASER_DIRECTION * LASER_SPEED * delta
