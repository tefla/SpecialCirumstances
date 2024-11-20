extends CharacterBody2D
class_name Unit

var selected: bool = false
const SPEED = 300.0
@onready var destination: Vector2 = position
var bounce: Vector2 = Vector2.ZERO

var is_inside = false

@export var components_resources: Array[Resource] = []
var components: Array[BaseComponent] = []

var panels = []

var movement_speed: float = 200.0
var movement_target_position: Vector2
@export var unit_name = "Unit"
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
func _ready():
	movement_target_position = position
	# These values need to be adjusted for the actor's speed
	# and the navigation layout.
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	navigation_agent.velocity_computed.connect(Callable(_on_velocity_computed))

	for comp in components_resources:
		if comp is GDScript:
			var _comp = comp.new(self)
			components.append(_comp)
			print("Loading Unit Component: %s" % [_comp.name])
	# Make sure to not await during _ready.
	actor_setup.call_deferred()
	generate_panel()
	
func deselect():
	$Polygon2D.visible = false;
func select():
	$Polygon2D.visible = true;
func actor_setup():
	# Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame


func _physics_process(delta):
	if navigation_agent.is_navigation_finished():
		return

	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	var new_velocity: Vector2 = global_position.direction_to(next_path_position) * movement_speed
	if navigation_agent.avoidance_enabled:
		navigation_agent.set_velocity(new_velocity)
	else:
		_on_velocity_computed(new_velocity)

func _on_velocity_computed(safe_velocity: Vector2):
	velocity = safe_velocity
	move_and_slide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if selected: 
		modulate = Color.RED
	else:
		modulate = Color.WHITE 
	
	# Apply any process methods to components
	#
#func _input(event: InputEvent) -> void:
	##print(event)
	#if event.is_action_released("Click"):
		#if is_inside:
			#selected = true
			#GameManager.set_selected(self)
		#else:
			#selected = false
			#GameManager.deselect()
		#get_viewport().set_input_as_handled()

		
func _on_mouse_entered() -> void:
	print("Is Inside")
	is_inside = true


func _on_mouse_exited() -> void:
	print("Is Outside")
	is_inside = false # Replace with function body.

func generate_panel():
	for comp in components:
		if comp.features & BaseComponent.Features.component_ui:
			print("Generate UI for: %s [%s]" % [comp.name, comp.description])
			panels.append(comp.create())
