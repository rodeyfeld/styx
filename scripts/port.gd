extends Node2D


const ship_scene: PackedScene = preload("res://scenes/ship.tscn")

func spawn_ship(destination: Vector2):
	var ship = ship_scene.instantiate()
	self.add_child(ship)
	ship.sail(destination)
