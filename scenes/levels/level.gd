extends Node2D
class_name LevelParent #nome riconoscibile della classe


#variabile per creare istanze della scena
var laser_scene : PackedScene = preload("res://scenes/projectile/laser.tscn")
var granade_scene : PackedScene = preload("res://scenes/projectile/granade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

func _ready():
	#recupera i nodi appartenenti al gruppo Container
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)

func _on_container_opened(pos, direction):
	#all'apertura del container, crea un istanza dell'item
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred("add_child", item)
	
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


func _on_player_player_use_granade(granade_start_pos, direction):
	#creo istanza scena granata e la piazzio nella position indicata dal $Player
	#as RigidBody2D permette di accedere alle proprietà legate a RigidBody2D
	var granade = granade_scene.instantiate() as RigidBody2D
	granade.position = granade_start_pos
	
	#setta la direzione verso l'alto
	granade.linear_velocity = direction * granade.GRANADE_SPEED
	
	$Projectiles.add_child(granade)

func _on_player_player_use_laser(laser_start_pos, direction):
	#crea istanza della scena
	var laser = laser_scene.instantiate() as Area2D
	#piazza l'istanza sulla posizione del marker scelto in $Player
	laser.position = laser_start_pos
	laser.local_laser_direction = direction #direzione sparo
	
	#ruota il laser all'angolazione della direzione
	#rad_to_deg converte il valore numero in gradi
	laser.rotation_degrees = rad_to_deg(direction.angle())
	
	#aggiungi l'istanza al node tree apposito
	$Projectiles.add_child(laser)
