extends Node2D

const port_scene: PackedScene = preload("res://scenes/port.tscn")


@onready var map = $map
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
		print(port_location)
		var port = port_scene.instantiate()
		print(port_location)
		var start_location = port_location[0]
		var end_location = port_location[1]
		start_location.x = (start_location.x * 16) + 8
		start_location.y = (start_location.y * 16) + 8
		end_location.x = (end_location.x * 16) + 8
		end_location.y = (end_location.y * 16) + 8
		port.global_position = start_location
		self.add_child(port)
		await port.ship.ready
		port.set_ship_destination(end_location)
		
	
