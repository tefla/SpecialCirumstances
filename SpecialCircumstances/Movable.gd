extends Node2D
class_name MovableComponent

@export var agent: NavigationAgent2D
@export var root: CharacterBody2D

@export var movement_speed: float = 200.0
var movement_state = STOPPED
enum {
	MOVING, STOPPED
}

func start():
	if movement_state != MOVING:
		movement_state = MOVING
func stop():
	if movement_state != STOPPED:
		movement_state= STOPPED
func move_to(pos: Vector2):
	stop()
	agent.target_position = pos
	start()	
func _ready() -> void:
	await get_tree().physics_frame
	agent.velocity_computed.connect(_on_velocity_computed)
	#agent.navigation_finished
func _on_velocity_computed(safe_velocity: Vector2):
	if movement_state == MOVING:
		root.velocity = safe_velocity
		root.move_and_slide()
func _physics_process(delta):
	if movement_state != MOVING:
		return
	if agent.is_navigation_finished():
		return

	var next_path_position: Vector2 = agent.get_next_path_position()
	var new_velocity: Vector2 = global_position.direction_to(next_path_position) * movement_speed
	root.look_at(next_path_position)
	if agent.avoidance_enabled:
		agent.set_velocity(new_velocity)
	else:
		_on_velocity_computed(new_velocity)
