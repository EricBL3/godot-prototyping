extends Node3D

const DIM_MULT = 0.75

@onready var line = $LineRenderer

var drawing = true
var projectile : Projectile

func _ready():
	line.points.clear()
	line.points.append(global_position)
	projectile = get_parent()

func _physics_process(delta):
	if drawing:
		line.points.append(global_position)
		print("points: " + str(line.points.size()))
		if projectile:
			if projectile.sleeping:
				drawing = false
				projectile = null
