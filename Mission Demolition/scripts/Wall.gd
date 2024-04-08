extends RigidBody3D

var sleep_countdown = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	axis_lock_linear_z = true
	axis_lock_angular_x = true
	axis_lock_angular_y = true


func _physics_process(delta):
	if sleep_countdown > 0:
		sleeping = true
		sleep_countdown -= 1
	else:
		sleeping = false
