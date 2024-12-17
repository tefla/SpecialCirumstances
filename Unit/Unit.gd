extends Entity
class_name Unit

var selected: bool = false
const SPEED = 300.0
@onready var destination: Vector2 = position
#var bounce: Vector2 = Vector2.ZERO
#
#var is_inside = false
#
## var components: Array[BaseComponent] = []
#
var movement_speed: float = 200.0
var movement_target_position: Vector2
#@export var unit_name = "Unit"
func _ready():
	## Make sure to not await during _ready.
	actor_setup.call_deferred()

func actor_setup():
	## Wait for the first physics frame so the NavigationServer can sync.
	await get_tree().physics_frame
	#generate_panels()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if selected: 
		modulate = Color.RED
	else:
		modulate = Color.WHITE 

func get_panels():
	var panels = []
	for comp in components:
		if comp.features & Component.ComponentFeatures.UI_PROVIDER:
			print("Generate UI for: %s" % [comp.get_class()])
			panels.append(comp.get_ui())
	
	for comp in components:
		comp.initialise()
	return panels
