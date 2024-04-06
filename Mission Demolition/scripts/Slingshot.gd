extends Node3D
class_name Slingshot

@onready var launch_point = $LaunchPoint

func _ready():
	launch_point.visible = false

func _on_sphere_area_mouse_entered():
	launch_point.visible = true


func _on_sphere_area_mouse_exited():
	launch_point.visible = false
