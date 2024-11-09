# A CPU is a component that handles running instructions
extends BaseComponent
class_name CPUComponent

var component_ui_scene = preload("res://Unit/Components/CPU/CPU_Interface.tscn")
var component_ui

var commands = []
var _unit
func _init(unit) -> void:
	super("CPU", "A CPU is a component that handles running instructions", Features.component_ui)
	_unit = unit

func create():
	component_ui = component_ui_scene.instantiate()
	component_ui.ready.connect(get_commands)
	
	return component_ui
	
func get_commands():
	commands = []
	for comp in _unit.components:
		if comp.features & BaseComponent.Features.component_actions:
			for comp_command in comp.component_actions:
				print("Found Command: %s" % [comp_command.name])
			commands.append_array(comp.component_actions)
	component_ui.set_available_commands(commands)
