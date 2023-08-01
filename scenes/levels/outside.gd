extends LevelParent

func _on_gate_player_entered_gate(object_name):
	var tween = get_tree().create_tween()
	#esempio di uso di tween su una proprietà dello script del player
	tween.tween_property($Player, "speed",0,1)
	
	#caricamento della scena inside
	#modalità di caricamento inserendo direttamente il percorso della scena
	#get_tree().change_scene_to_file("res://scenes/levels/inside.tscn")

	#invoco l'animazione di transizione e dico quale scena deve caricare
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")

func _on_button_pressed():
	print("button is pressed")


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
	#tween.tween_property($Player, "modulate:a",0, 2).from(0.5)
	#è possibile indicare una tipologia di transizione (di default l'interpolazione è lineare)
	tween.tween_property($Player/Camera2D,"zoom", Vector2(1,1), 0.5).set_trans(Tween.TRANS_QUAD)
	


func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom", Vector2(0.6,0.6), 0.5)
