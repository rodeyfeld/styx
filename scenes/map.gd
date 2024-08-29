extends Node2D

class_name WorldMap

@export var noise_height_texture: NoiseTexture2D

var noise: Noise
var tile_map_layers: Array[StyxLayer] = []

func _ready() -> void:
	noise = noise_height_texture.noise
	var _tile_map_layers = $tile_map_layers.get_children()
	for _tile_map_layer in _tile_map_layers:
		tile_map_layers.append(_tile_map_layer)
	
func generate(width, height) -> void:
	for x in range(-width/ 2 , width/2):
		for y in range(-height/ 2 , height/2):
			var noise_val: float = noise.get_noise_2d(x, y)
			var vector_pos = Vector2i(x, y)
			for tile_map_layer in tile_map_layers:
				if (noise_val <= tile_map_layer.max_threshold 
				and  noise_val >= tile_map_layer.min_threshold
				and tile_map_layer.active):
					tile_map_layer.tile_positions.append(vector_pos)


	for tile_map_layer in tile_map_layers:
		if tile_map_layer.terrain_set_id > -1:
			tile_map_layer.set_cells_terrain_connect(
				tile_map_layer.tile_positions,
				tile_map_layer.terrain_set_id,
				0
			 )
		else:
			for vector_pos in tile_map_layer.tile_positions:
				tile_map_layer.set_cell(vector_pos, 0, tile_map_layer.atlas_coords.pick_random())
	#
	#for vector_pos in water_0_tiles:
		#water_0_layer.set_cell(vector_pos, source_id, water_atlas_coords)
	#beach_0_layer.set_cells_terrain_connect(beach_0_tiles, 3, 0)
	#ground_0_layer.set_cells_terrain_connect(ground_0_tiles, 2, 0)
	#ground_1_layer.set_cells_terrain_connect(ground_1_tiles, 1, 0)
	#for vector_pos in ground_2_tiles:
		#ground_2_layer.set_cell(vector_pos, source_id, grass_atlas.pick_random())
	#cliff_0_layer.set_cells_terrain_connect(cliff_0_tiles, 4, 0)
	#for vector_pos in building_0_tiles:
		#ground_2_layer.set_cell(vector_pos, source_id, building_atlas_coords)
	#
		
