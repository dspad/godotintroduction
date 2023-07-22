extends LevelParent

func _on_gate_player_entered_gate(object_name):
	var tween = get_tree().create_tween()
	#esempio di uso di tween su una proprietà dello script del player
	tween.tween_property($Player, "speed",0,1)
