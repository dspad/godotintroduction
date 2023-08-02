extends Node


signal stat_changed

#le informazioni di questo script sono rese globali andando su
#Project->Project Settings->Autoload e aggiungendo lo script
#Questo script viene automaticamente reso disponibile in tutte le scene

var laser_amount = 20:
	set(value):
		laser_amount = value
		stat_changed.emit()
	
var grenade_amount = 5:
		set(value):
			grenade_amount = value
			stat_changed.emit()

var player_hitted : bool = false

#esempio di utilizzo delle funzioni get e set che vengono richiamaate ogni volta
#che si accede a questa variabile. Molto utile per richiamare funzioni collegate al suo
#valore (esempio: aggiornamento UI)
var health_amount = 60:
		#get:
		#	return health_amount
		set(value):
			#se il nuovo valore supera il precedente, aggiorna subito
			if value > health_amount:
				health_amount = min(value,100) #istruzione inserita nel caso in cui la salute sia al massimo
			elif not player_hitted: #istruzioni in caso di danno subito
				health_amount = value
				player_hitted = true
				player_hitted_timer()
			stat_changed.emit()

#variabile messa a disposizione per fare in modo che i nemici puntino verso il player
var player_pos : Vector2


#esempio di creazione di un timer direttamente via codice
func player_hitted_timer():
	#attendi la fine del timer per reimpostare la variabile a false
	await get_tree().create_timer(3).timeout
	player_hitted = false
