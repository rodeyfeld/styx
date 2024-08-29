extends Node2D



@onready var map = $map
@onready var camera = $Player/Camera2D


var width: int = 100
var height: int = 100

func _ready():
	map.generate(width, height)
	
func _input(_event):
	if Input.is_action_just_pressed("zoom_in"):
		camera.zoom *= 2	
	elif Input.is_action_just_pressed("zoom_out"):
		camera.zoom *= .5
	
