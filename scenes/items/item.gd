extends Area2D

var rotation_speed : int = 5

#elenco tipi item
var available_item_types = ["laser","grenade", "health"]

#scegli casualmente un tipo di item usando randi()
var item_type = available_item_types[randi() % len(available_item_types)]

var direction : Vector2
var distance : int = randi_range(150, 250)


func _ready():
	if item_type == "laser":
		$Sprite2D.modulate = Color(.1,.2,.6)  #se laser, colora di blu
	elif item_type == "grenade":
		$Sprite2D.modulate = Color(.8,0,0)
	elif item_type == "health":
		$Sprite2D.modulate = Color(.1,.6,.1)
	
	#tween
	var target_pos = position + direction * distance
	var movement_tween = create_tween()
	movement_tween.tween_property(self, "position", target_pos, 0.5)

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body):
	if item_type == "laser":
		Globals.laser_amount += 5
	elif item_type == "grenade":
		Globals.grenade_amount += 1
	elif item_type == "health":
		Globals.health_amount += 10
	queue_free()
