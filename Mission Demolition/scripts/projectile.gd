extends RigidBody3D
class_name Projectile

const LOOKBACK_COUNT = 100

var awake : bool = true : 
	get:
		return awake
	set(value):
		awake = value

var prev_pos : Vector3
var deltas : Array[float] = []

func _ready():
	awake = true
	prev_pos = Vector3(1000, 1000, 0)
	deltas.append(1000.0)
	axis_lock_linear_z = true
	
func _physics_process(delta):
	if sleeping:
		awake = false
	#if !awake || freeze:
		#return
		#
	#var delta_v3 = global_position - prev_pos
	#deltas.append(delta_v3.length())
	#prev_pos = global_position
	#
	#while deltas.size() > LOOKBACK_COUNT:
		#deltas.remove_at(0)
		#
	#var max_delta = 0
	#for f in deltas:
		#if f > max_delta:
			#max_delta = f
			#
	#if max_delta <= PhysicsServer3D.SPACE_PARAM_BODY_LINEAR_VELOCITY_SLEEP_THRESHOLD:
		#awake = false
		#sleeping = true
