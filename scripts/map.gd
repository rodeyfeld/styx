extends Node2D

class_name WorldMap

@export var noise_height_texture: NoiseTexture2D
@export var tile_data: Dictionary = {}

var noise: Noise
var tile_map_layers: Array[StyxLayer] = []
func _ready() -> void:
	noise = noise_height_texture.noise
	var _tile_map_layers = $tile_map_layers.get_children()
	for _tile_map_layer in _tile_map_layers:
		tile_map_layers.append(_tile_map_layer)
		tile_data[_tile_map_layer.name] = _tile_map_layer

	
func generate(width, height) -> void:
	for x in range(0 , width):
		for y in range(0, height):
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

	
