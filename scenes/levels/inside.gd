extends LevelParent

@export var outside_level_scene : PackedScene = preload("res://scenes/levels/outside.tscn")


func _on_exit_gate_area_body_entered(body):
	#caircamento scena da variabile
	get_tree().change_scene_to_packed(outside_level_scene)
