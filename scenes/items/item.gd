extends Area2D

var rotation_speed : int = 5

#elenco tipi item
var available_item_types = ["laser","grenade", "health"]

#scegli casualmente un tipo di item usando randi()
var item_type = available_item_types[randi() % len(available_item_types)]

func _ready():
	if item_type == "laser":
		$Sprite2D.modulate = Color(.1,.2,.6)  #se laser, colora di blu
	elif item_type == "grenade":
		$Sprite2D.modulate = Color(.8,0,0)
	elif item_type == "health":
		$Sprite2D.modulate = Color(.1,.6,.1)
	print(item_type)

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body):
	#in collision abbiamo impostato che solo il player può collidere con l'item
	#nel player è presente il metodo add_item()
	body.add_item(item_type) 
	queue_free()
