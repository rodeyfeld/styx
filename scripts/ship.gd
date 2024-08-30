extends CharacterBody2D


const SPEED = 100
@export var destination: Vector2 = Vector2.ZERO
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@export var active: bool = false

var traversible_content


func _physics_process(delta):
	# Do not query when the map has never synchronized and is empty.
	
	if self.active:
		if NavigationServer2D.map_get_iteration_id(navigation_agent.get_navigation_map()) == 0:
			return
		if navigation_agent.is_navigation_finished():
			return

		var next_path_position: Vector2 = navigation_agent.get_next_path_position()
		velocity = global_position.direction_to(next_path_position) * SPEED
	move_and_slide()
	

	
func sail(destination): 
	self.destination = destination
	self.navigation_agent.target_position = destination
	self.active = true
