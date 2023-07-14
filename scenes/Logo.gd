extends Sprite2D

var pos: Vector2 = Vector2.ZERO
const SPEED: int = 100
var test_scale: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	#print('ready')
	pos = Vector2(100,100)
	position = pos
	
	#test rotation
	var test_rotation = 45
	rotation_degrees = test_rotation
	
	#test scale
	test_scale = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#pass
	#print('process')
	pos.x += SPEED*delta
	position = pos 
	
	#test scale
	#test_scale += 1
	#scale = Vector2(test_scale, test_scale)
	
