extends Node2D

const port_scene: PackedScene = preload("res://scenes/port.tscn")


@onready var map = $map
@onready var camera = $Player/Camera2D


@export var ports = []



var width: int = 100
var height: int = 100

func _ready():
	map.generate(width, height)
	generate_ports()
	
	
func _input(_event):
	if Input.is_action_just_pressed("zoom_in"):
		camera.zoom *= 2	
	elif Input.is_action_just_pressed("zoom_out"):
		camera.zoom *= .5


func generate_ports():
	var port_coords: Array[Vector2i] = map.tile_data['building_water_0'].tile_positions
	for port_coord in port_coords:
		var port = port_scene.instantiate()
		port_coord.x *= 16
		port_coord.y *= 16
		port.global_position = port_coord
		self.add_child(port)
	
	
	
