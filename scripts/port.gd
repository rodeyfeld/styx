extends Node2D


const ship_scene: PackedScene = preload("res://scenes/ship.tscn")
var ship
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ship = ship_scene.instantiate()
	ship.position.x = (ship.position.x) + 8
	ship.position.y = (ship.position.y) + 8
	self.add_child(ship)
	
func set_ship_destination(vector_pos):
	ship.destination = vector_pos
	
