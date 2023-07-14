extends CharacterBody2D

#gestione input player
const PLAYER_SPEED: int = 500

# le azioni left, right, up, down, primary action e secondary action sono definite
# all'interno del menu Project-> Project Settings -> Input Map

func _ready():
	#esempip di utilizz di $".." per chiamare il nodo padre
	$"..".printAStringFromAnotherNode()
	

func _process(delta):
	
	#Gets an input vector by specifying four actions for the positive and negative X and Y axes.
	var direction = Input.get_vector("left", "right", "up", "down")
	#print(direction)
	
	#muovi il player in quanto CharacterBody2D. Su velocity si impostano i valori direzionali
	#che vengono poi usati in move_and_slide.
	#Non si aggiunge il delta perchè viene usato direttamente in move_and_slide
	velocity = direction * PLAYER_SPEED
	move_and_slide()
	
	#aggiorna posiziione - vecchio codice
	#position += direction * PLAYER_SPEED * delta
	
	#controllo pressione azione
	if Input.is_action_pressed("primary action"):
		print("Shoot Laser!")
	
	if Input.is_action_pressed("secondary action"):
		print("Shoot Grenade!")
