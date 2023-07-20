extends Area2D

#@export permette di vedere questa variabile nell'inspector della scena
#utile per debug ed evitare di cambiare ogni volta il valore direttamente nel codice
@export var LASER_SPEED : int = 1000
var local_laser_direction : Vector2 = Vector2.UP

func _process(delta):
	position += local_laser_direction * LASER_SPEED * delta


func _on_body_entered(body):
	#verifica se il parametro presenta un metodo specifico
	#if body.has_method("hit"): #questa istruzione fa la stessa cosa
	if "hit" in body:
		body.hit()
	
	#è possibile anche verificare che in body esista una proprietà
	#in questo caso verifica se esiste is_enemy
	#if "is_enemy" in body:
	#	print("body is an enemy")
	
	#distruggi il laser appena entra in collisione con un altro elemento
	queue_free()


func _on_timer_timeout():
	queue_free()
