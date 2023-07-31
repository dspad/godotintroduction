extends ItemParent

var isOpen : bool

func hit():
	if not isOpen:
		isOpen = true
		$LidSprite.hide()
		
		#crea 5 item quando si apre la cassa
		for i in range(5):
			var pos = $SpawnPositions.get_child(randi() % $SpawnPositions.get_child_count()).global_position
			open.emit(pos, current_direction)
