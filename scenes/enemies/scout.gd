extends CharacterBody2D

#il player è all'interno dell'area di attacco?
var player_nearby : bool = false
var can_laser : bool = true
var right_gun_user : bool = true
var scout_health : int = 30
var scout_hitted : bool = false


signal laser(pos, direction)

func _process(delta):
	if player_nearby:
		#ruota la direzione verso la posizione del player
		look_at(Globals.player_pos)
		if can_laser:
			var pos : Vector2 = $LaserSpawnPositions.get_child(right_gun_user).global_position
			right_gun_user = not right_gun_user
			var direction : Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos,direction)
			can_laser = false
			$Timers/LaserCooldown.start()


func _on_attack_area_body_entered(body):
	player_nearby = true


func _on_attack_area_body_exited(body):
	player_nearby = false


func _on_laser_cooldown_timeout():
	can_laser = true

func hit():
	if not scout_hitted:
		scout_hitted = true
		scout_health -= 10
		$Timers/HitTimer.start()
		#imposta il parametro dello shader a 1
		$Sprite2D.material.set_shader_parameter("progress",1)
		if scout_health <= 0:
			queue_free()

func _on_hit_timer_timeout():
	scout_hitted = false
	$Sprite2D.material.set_shader_parameter("progress",0)
