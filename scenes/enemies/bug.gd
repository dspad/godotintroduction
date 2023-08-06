extends CharacterBody2D

var active: bool = false
var speed: int = 300
var vulnerable : bool = true
var player_near : bool = false
var health : int = 20

func hit():
	if vulnerable:
		vulnerable = false
		$Timers/HitTimer.start()
		health -= 10
		$AnimatedSprite2D.material.set_shader_parameter("progress", 1)
		$Particles/HitParticles.emitting = true
	if(health <= 0):
		await get_tree().create_timer($Timers/HitTimer.wait_time).timeout
		queue_free()

func _process(delta):
	var direction : Vector2 = (Globals.player_pos - position).normalized()
	velocity = direction * speed
	if active:
		move_and_slide()
		look_at(Globals.player_pos)

func _on_attack_area_2d_body_entered(_body):
	player_near = true
	attackPlayer()


func _on_attack_area_2d_body_exited(_body):
	player_near = false
	$AnimatedSprite2D.stop()


func _on_notice_area_2d_body_entered(_body):
	active = true
	$AnimatedSprite2D.play("walk")

func _on_notice_area_2d_body_exited(_body):
	active = false
	$AnimatedSprite2D.stop()

func _on_animated_sprite_2d_animation_finished():
	if player_near:
		Globals.health_amount -= 10
		$Timers/AttackTimer.start()

func _on_attack_timer_timeout():
	attackPlayer()


func _on_hit_timer_timeout():
	vulnerable = true
	$AnimatedSprite2D.material.set_shader_parameter("progress", 0)

func attackPlayer():
	$AnimatedSprite2D.play("attack")
