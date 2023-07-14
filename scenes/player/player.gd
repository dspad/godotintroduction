extends Node2D

#gestione input player
const PLAYER_SPEED: int = 500

# le azioni left, right, up, down, primary action e secondary action sono definite
# all'interno del menu Project-> Project Settings -> Input Map

func _process(delta):
	
	#Gets an input vector by specifying four actions for the positive and negative X and Y axes.
	var direction = Input.get_vector("left", "right", "up", "down")
	#print(direction)
	
	#aggiorna posiziione
	position += direction * PLAYER_SPEED * delta
	
	#controllo pressione azione
	if Input.is_action_pressed("primary action"):
		print("Shoot!")
