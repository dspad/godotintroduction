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

#esempio di utilizzo delle funzioni get e set che vengono richiamaate ogni volta
#che si accede a questa variabile. Molto utile per richiamare funzioni collegate al suo
#valore (esempio: aggiornamento UI)
var health_amount = 60:
		#get:
		#	return health_amount
		set(value):
			health_amount = value
			stat_changed.emit()
