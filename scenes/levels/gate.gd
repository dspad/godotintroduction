extends StaticBody2D

#esempio custom signal. Questo sarà richiamabile dalla scena più esterna (level)
signal player_entered_gate

func _on_area_2d_body_entered(body):
	print("body has entered " + body.name)
	#trigger del signal che esegue la funzione ad esse collegata
	player_entered_gate.emit() 


func _on_area_2d_body_exited(body):
	print("body has exited " + body.name)
