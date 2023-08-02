extends RigidBody2D

const GRANADE_SPEED : int = 750

var explosion_active : bool = false
var explosion_radius : int = 400

func explode():
	$AnimationPlayer.play("explosion")
	explosion_active = true


func _process(_delta):
	if explosion_active:
		#se l'esplosione è in esecuzione, recupera i nodi che fanno parte di Container e Entity
		var targets = get_tree().get_nodes_in_group("Container") + get_tree().get_nodes_in_group("Entity")
		for target in targets:
			#per ogni nodo verifica se la sua distanza con la granata sia inferiore con la distanza stabilita
			var in_range = target.global_position.distance_to(global_position) < explosion_radius
			if "hit" in target and in_range:
				target.hit()
