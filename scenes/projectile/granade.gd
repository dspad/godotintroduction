extends RigidBody2D

const GRANADE_SPEED : int = 750

func explode():
	$AnimationPlayer.play("explosion")
