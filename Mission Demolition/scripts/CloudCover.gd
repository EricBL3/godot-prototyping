extends Node3D

@export_group("Inscribed")
@export var cloud_sprites : Array[Resource] = []
@export var num_clouds : int = 40
@export var min_pos : Vector3 = Vector3(-20, -5, 5)
@export var max_pos : Vector3 = Vector3(300, 40, -5)

## For scale_range, x is the min value, and y is the max value.
@export var scale_range : Vector2 = Vector2(1, 4)

func _ready():
	var parent_trans = transform
	var cloud
	var scale_mult
	
	for i in num_clouds:
		cloud = Sprite3D.new()
		var sprite_num = randi() % cloud_sprites.size()
		cloud.texture = cloud_sprites[sprite_num]
		
		cloud.global_position = random_pos()
		add_child(cloud)
		scale_mult = randf_range(scale_range.x, scale_range.y)
		cloud.scale = Vector3.ONE * scale_mult
		
func random_pos():
	var pos = Vector3()
	pos.x = randf_range(min_pos.x, max_pos.x)
	pos.y = randf_range(min_pos.y, max_pos.y)
	pos.z = randf_range(min_pos.z, max_pos.z)
	
	return pos
	
