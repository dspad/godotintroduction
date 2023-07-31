extends ItemParent


var isOpen : bool

func hit():
	if not isOpen:
		isOpen = true
		$LidSprite.hide()
		
		var pos = $SpawnPositions/Marker2D.global_position
		open.emit(pos, current_direction)
