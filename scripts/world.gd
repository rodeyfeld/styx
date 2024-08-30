extends Node2D

const port_scene: PackedScene = preload("res://scenes/port.tscn")


@onready var map = $Map
@onready var camera = $Player/Camera2D



var port_locations = [
	[Vector2i(41, 5), Vector2i(55, 73)],
	[Vector2i(55, 73), Vector2i(41, 5)]
]
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
	for port_location in port_locations:
		var port = port_scene.instantiate()
		var start_location =  (port_location[0] * 16)
		var end_location = (port_location[1] * 16)
		port.global_position = start_location
		self.add_child(port)
		port.spawn_ship(end_location)
		
	
