# Used to move the unit 
# Contains the MoveCommand

extends BaseComponent
class_name MotorComponent

var component_actions = [
	preload("res://Unit/Components/Motor/MoveFactory.gd").new(),
]

func _init(unit) -> void:
	super("Motor", "A Motor", Features.component_actions)
