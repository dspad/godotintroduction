extends CharacterBody2D

#gestione input player
const PLAYER_SPEED: int = 500

#variabiles
var can_laser : bool = true
var can_granade : bool = true

#signals
signal player_use_laser
signal player_use_granade

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
	if Input.is_action_pressed("primary action") and can_laser:
		can_laser = false
		player_use_laser.emit() #emetti il segnale
		$TimerLaser.start()
	
	if Input.is_action_pressed("secondary action") and can_granade:
		can_granade = false
		player_use_granade.emit() #emetti il segnale
		$TimerGranade.start()


func _on_timer_laser_timeout():
	can_laser = true

func _on_timer_granade_timeout():
	can_granade = true
