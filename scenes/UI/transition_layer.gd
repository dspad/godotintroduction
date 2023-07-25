extends CanvasLayer

func change_scene(target : String) -> void:
	$AnimationPlayer.play("fade_to_black")
	#attendi la fine dell'animazione
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)

	#esegui l'animazione al contrario
	$AnimationPlayer.play_backwards("fade_to_black")
