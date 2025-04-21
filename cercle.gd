extends Node2D

@export var radius = 300.0
@export var wall_count = 30
@export var wall_width = 500.0
@export var wall_length = 1.0

func _ready():
	for i in wall_count:
		var angle = TAU * i / wall_count
		var pos = Vector2(cos(angle), sin(angle)) * radius

		var wall = StaticBody2D.new()
		wall.position = pos
		wall.rotation = angle

		var collision = CollisionShape2D.new()
		var shape = RectangleShape2D.new()
		shape.extents = Vector2(wall_length * 0.5, wall_width * 0.5)
		collision.shape = shape

		wall.add_child(collision)
		add_child(wall)
