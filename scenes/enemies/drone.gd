extends CharacterBody2D

var active : bool = false
var speed : int = 400
var vulnerable : bool = true
var health = 50

func _ready():
	$Explosion.hide()
	$Sprite2D.show()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if active:
		look_at(Globals.player_pos)
		var direction = (Globals.player_pos - position).normalized()
		velocity = direction * speed
		var collision = move_and_collide(velocity * delta)
		if collision:
			$AnimationPlayer.play("explosion")

func hit():
	if vulnerable:
		health -= 10
		vulnerable = false
		$Timers/HitTimer.start()
	if health <= 0:
		$AnimationPlayer.play("explosion")

func _on_notice_area_body_entered(body):
	active = true


func _on_notice_area_body_exited(body):
	active = false


func _on_hit_timer_timeout():
	vulnerable = true
