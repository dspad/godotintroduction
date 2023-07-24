extends Node2D
class_name LevelParent #nome riconoscibile della classe


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
	
	#aggiorna counter UI laer
	$UI.update_laser_text()


func _on_house_player_entered():
	#esempio di utilizzo di un tween
	var tween = get_tree().create_tween()
	#un tween esegue una interpolazione del valore di una proprietà verso un altro valore
	#in un arco di tempo specifico. E' utile per fare animazioni basilari senza dover usare un
	#AnimationPlayer
	#parametri: nodo da elaborare, proprietà da aggiornare, il nuovo valore, il tempo impiegato
	#tween.tween_property($Player/Camera2D,"zoom", Vector2(1,1), 0.5)
	
	#se con uno stesso tween si eseguono più animazioni, queste avvengono in sequenza e non in parallelo
	#cambiando la proprietà parallel a true, le animazioni avvengono in contemporanea
	tween.set_parallel(true)
	
	#è possibile anche indicare un valore di partenza della proprietà elaborata dal tween
	tween.tween_property($Player, "modulate:a",0, 2).from(0.5)
	#è possibile indicare una tipologia di transizione (di default l'interpolazione è lineare)
	tween.tween_property($Player/Camera2D,"zoom", Vector2(1,1), 0.5).set_trans(Tween.TRANS_QUAD)
	

func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom", Vector2(0.6,0.6), 0.5)
