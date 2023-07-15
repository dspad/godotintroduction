extends Node2D

#variabile per creare istanze della scena
var laser_scene : PackedScene = preload("res://scenes/projectile/laser.tscn")
var granade_scene : PackedScene = preload("res://scenes/projectile/granade.tscn")

#func _ready():
#	$Logo.rotation_degrees = 90
	
	#esempio accesso a un nodo usando nome univoco
	#invece che $Player/Node2D/SubNode
	#%SubNode.position = Vector2.ZERO

#func _process(delta):
#	$Logo.rotation_degrees += 60 * delta
	
#	if $Logo.rotation_degrees > 180:
#		$Logo.rotation_degrees = 0
		
#	if $Logo.pos.x > 1000:
#		$Logo.pos = Vector2.ZERO

func printAStringFromAnotherNode():
	print("printAStringFromAnotherNode")


func _on_gate_player_entered_gate():
	print("player has entered gate")


func _on_player_player_use_granade(granade_start_pos, direction):
	#creo istanza scena granata e la piazzio nella position indicata dal $Player
	#as RigidBody2D permette di accedere alle proprietà legate a RigidBody2D
	var granade = granade_scene.instantiate() as RigidBody2D
	granade.position = granade_start_pos
	
	#setta la direzione verso l'alto
	granade.linear_velocity = direction * granade.GRANADE_SPEED
	
	$Projectiles.add_child(granade)


func _on_player_player_use_laser(laser_start_pos):
	#crea istanza della scena
	var laser = laser_scene.instantiate()
	#piazza l'istanza sulla posizione del marker scelto in $Player
	laser.position =  laser_start_pos
	#aggiungi l'istanza al node tree apposito
	$Projectiles.add_child(laser)
