extends CharacterBody2D

#gestione input player
@export var max_speed : int = 1000
var speed : int = max_speed

#variabiles
var can_laser : bool = true
var can_granade : bool = true

#signals
signal player_use_laser(laser_start_pos, player_direction)
signal player_use_granade(granade_start_pos, player_direction)
#signal update_stats


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
	velocity = direction * speed
	move_and_slide()
	
	#aggiorna posiziione - vecchio codice
	#position += direction * PLAYER_SPEED * delta
	
	#ruota il player verso la posizione del mouse
	look_at(get_global_mouse_position())
	
	#controllo pressione azione
	#lettura variabile da Globals
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		
		#recuperiamo i marker2d e stabilire da dove apparirà il laser
		var laser_markers = $LaserSpawner.get_children()
		#scegli a caso uno dei marker2d
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		
		can_laser = false
		
		#verifica dove sta guardando il player
		var player_direction = (get_global_mouse_position() - position).normalized()
		
		#emetti il segnale inviando la posizione del marker2D da cui partirà il laser
		#inviamo la global_position in quanto la position è relativa al suo parent
		player_use_laser.emit(selected_marker.global_position, player_direction)
		
		#particle effect
		$GPUParticles2D.set_emitting(true) 
		
		$TimerLaser.start()
	
	if Input.is_action_pressed("secondary action") and can_granade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		can_granade = false
		#verifica dove sta guardando il player
		var player_direction = (get_global_mouse_position() - position).normalized()
		
		#emetti il segnale inviando la posizione di partenza della granata
		player_use_granade.emit($GranadeSpawner.global_position, player_direction) 
		$TimerGranade.start()


func _on_timer_laser_timeout():
	can_laser = true

func _on_timer_granade_timeout():
	can_granade = true
