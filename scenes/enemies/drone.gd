extends CharacterBody2D

const DRONE_DIRECTION : Vector2 = Vector2.RIGHT
const DRONE_SPEED : int = 200

var is_enemy : bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#applica direzione e velocità
	velocity = DRONE_DIRECTION * DRONE_SPEED
	move_and_slide()

func hit():
	print("damage")
