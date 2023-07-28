extends Node

signal health_changed

#le informazioni di questo script sono rese globali andando su
#Project->Project Settings->Autoload e aggiungendo lo script
#Questo script viene automaticamente reso disponibile in tutte le scene

var laser_amount = 20
var grenade_amont = 5

#esempio di utilizzo delle funzioni get e set che vengono richiamaate ogni volta
#che si accede a questa variabile. Molto utile per richiamare funzioni collegate al suo
#valore (esempio: aggiornamento UI)
var health_amout = 60:
		get:
			return health_amout
		set(value):
			health_amout = value
			health_changed.emit()
