extends Line2D

@export var radius = 300
@export var point_count = 600

func _ready():
	clear_points()
	for i in point_count:
		var angle = TAU * i / point_count
		var point = Vector2(cos(angle), sin(angle)) * radius
		add_point(point)
	
	# On ferme le cercle en ajoutant le premier point à la fin
	add_point(points[0])
