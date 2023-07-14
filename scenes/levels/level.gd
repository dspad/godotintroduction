extends Node2D

func _ready():
	$Logo.rotation_degrees = 90

func _process(delta):
	$Logo.rotation_degrees += 60 * delta
	
	if $Logo.rotation_degrees > 180:
		$Logo.rotation_degrees = 0
		
	if $Logo.pos.x > 1000:
		$Logo.pos = Vector2.ZERO
