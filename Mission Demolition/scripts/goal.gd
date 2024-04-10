extends Area3D
@onready var mesh = $MeshInstance3D

var goal_met = false


func _on_body_entered(body):
	if body is Projectile:
		goal_met = true
		var c = mesh.get_surface_override_material(0).albedo_color
		c.a = 255 * 0.75
		mesh.get_surface_override_material(0).albedo_color = c
