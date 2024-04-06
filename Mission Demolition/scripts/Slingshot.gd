extends Node3D
class_name Slingshot

@onready var launch_point = $LaunchPoint
@export var velocity_mult = 10.0
@onready var main_camera = $"../MainCamera"


var projectile_scene = preload("res://scenes/projectile.tscn")

var aiming_mode : bool
var launch_pos : Vector3

var projectile

func _ready():
	launch_point.visible = false
	launch_pos = launch_point.global_position

func _process(delta):
	if !aiming_mode:
		return
	
	# Get mouse position in 3D world 
	var mouse_pos_2d = get_viewport().get_mouse_position()
	var main_camera = get_viewport().get_camera_3d()
	var mouse_pos_3d = main_camera.project_position(mouse_pos_2d, main_camera.global_position.z)
	
	var mouse_delta = mouse_pos_3d - launch_pos
	var sphere_collider = get_node("SphereArea/SphereCollider")
	var max_magnitude = sphere_collider.shape.radius
	if mouse_delta.length() > max_magnitude:
		mouse_delta = mouse_delta.normalized()
		mouse_delta *= max_magnitude
		
	print("Mouse delta: " + str(mouse_delta))
		
	var proj_pos = launch_pos + mouse_delta
	if projectile:
		projectile.global_position = proj_pos
		
		if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			on_mouse_released(mouse_delta)
		
func _on_sphere_area_mouse_entered():
	launch_point.visible = true


func _on_sphere_area_mouse_exited():
	launch_point.visible = false


func _on_sphere_area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			on_mouse_down()

func on_mouse_down():
	aiming_mode = true;
	projectile = projectile_scene.instantiate()
	projectile.global_position = launch_pos
	projectile.freeze = true
	get_node("/root/_Scene_0/Projectiles").add_child(projectile)

func on_mouse_released(mouse_delta):
	aiming_mode = false
	projectile.freeze = false
	projectile.linear_velocity = - mouse_delta * velocity_mult
	main_camera.point_of_interest = projectile
	projectile = null
