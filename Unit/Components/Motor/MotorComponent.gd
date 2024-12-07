class_name MotorComponent
extends Component

enum {
	MOVING, STOPPED
}
var movement_speed: float = 200.0
var movement_target_position: Vector2
var movement_state = STOPPED
signal nav_finished(target_reached: bool)

func _init() -> void:
	features = ComponentFeatures.TASK_PROVIDER
	tasks = [MoveToTask.new()]


#@export var unit_name = "Unit"
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

func set_target(t: Vector2):
	movement_target_position = t
	navigation_agent.target_position = movement_target_position
	
func start():
	if movement_state != MOVING:
		movement_state = MOVING
func stop():
	if movement_state != STOPPED:
		movement_state= STOPPED
	
func _ready() -> void:
	## These values need to be adjusted for the actor's speed
	## and the navigation layout.
	#navigation_agent.path_desired_distance = 4.0
	#navigation_agent.target_desired_distance = 4.0
	navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))
	
	#get_parent().entity.print_tree()
func _on_velocity_computed(safe_velocity: Vector2):
	if entity and movement_state == MOVING:
		entity.velocity = safe_velocity
		entity.move_and_slide()
func _physics_process(delta):
	if movement_state == STOPPED:
		return
	if navigation_agent.is_navigation_finished():
		movement_state = STOPPED
		return
		

	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	var new_velocity: Vector2 = global_position.direction_to(next_path_position) * movement_speed
	if navigation_agent.avoidance_enabled:
		navigation_agent.set_velocity(new_velocity)
	else:
		_on_velocity_computed(new_velocity)
