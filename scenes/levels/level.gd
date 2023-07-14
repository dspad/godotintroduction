extends Node2D

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


#funzione creata in automatico selezionando l'Area2D -> Node -> Signals
func _on_area_2d_body_entered(body):
	print("body has entered " + body.name)

func _on_area_2d_body_exited(body):
	print("body has exited " + body.name)
