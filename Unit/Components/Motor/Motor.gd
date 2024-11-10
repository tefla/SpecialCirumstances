# Used to move the unit 
# Contains the MoveCommand

extends BaseComponent
class_name MotorComponent


var _component_actions = [
	preload("res://Unit/Components/Motor/MoveFactory.tres").duplicate(),
]

func _init(unit) -> void:
	super("Motor", "A Motor", Features.component_actions)
	print("Unit: %s" % [unit])
	for c in _component_actions:
		c.parent_component = self

func get_command_factories():
	return _component_actions
