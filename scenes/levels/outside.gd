extends LevelParent

func _on_gate_player_entered_gate(object_name):
	var tween = get_tree().create_tween()
	#esempio di uso di tween su una proprietà dello script del player
	tween.tween_property($Player, "speed",0,1)
	
	#caricamento della scena inside
	#modalità di caricamento inserendo direttamente il percorso della scena
	get_tree().change_scene_to_file("res://scenes/levels/inside.tscn")
