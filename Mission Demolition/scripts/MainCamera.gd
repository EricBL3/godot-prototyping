extends Camera3D

class_name MainCamera

@export var easing : float = 0.05
@export var min_x_y : Vector2 = Vector2.ZERO

var point_of_interest : Node3D
var cam_z

func _ready():
	cam_z = global_position.z

func _physics_process(delta):
		
	var destination = Vector3.ZERO
	
	if point_of_interest:
		if point_of_interest.sleeping:
			point_of_interest = null
	
	if point_of_interest:
		destination = point_of_interest.global_position
	
	destination.x = max(min_x_y.x, destination.x)
	destination.y = max(min_x_y.y, destination.y)
	destination = global_position.lerp(destination, easing)
	destination.z = cam_z
	
	global_position = destination
	size = destination.y * 2 + 20
