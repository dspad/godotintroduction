extends StaticBody2D
class_name ItemParent

@onready var current_direction : Vector2 = Vector2.DOWN.rotated(rotation)
signal open(pos, direction)
