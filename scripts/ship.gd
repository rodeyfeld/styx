extends CharacterBody2D


const SPEED = 1.0
@export var direction: Vector2 = Vector2.ZERO
@export var destination: Vector2 = Vector2.ZERO

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

func _physics_process(delta: float) -> void:


	if destination:
		navigation_agent.target_position = destination
		direction = navigation_agent.get_next_path_position().normalized()
		velocity = direction * SPEED
		
	move_and_slide()
