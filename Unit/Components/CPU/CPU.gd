# A CPU is a component that handles running instructions
extends BaseComponent
class_name CPUComponent

var component_ui_scene = preload("res://Unit/Components/CPU/CPU_Interface.tscn")
var component_ui

var commands = []
var program: Program = Program.new()

var clock: Timer = Timer.new()
var _unit
func _init(unit) -> void:
	super("CPU", "A CPU is a component that handles running instructions", Features.component_ui)
	_unit = unit
	_unit.add_child(clock)
	clock.timeout.connect(tick)
	clock.start(1.0)	
	print(clock)
func create():
	component_ui = component_ui_scene.instantiate()
	component_ui.unit = _unit
	component_ui.cpu = self
	component_ui.ready.connect(get_commands)
	
	return component_ui
	
func get_commands():
	commands = []
	for comp in _unit.components:
		if comp.features & BaseComponent.Features.component_actions:
			for comp_command in comp.get_command_factories():
				print("Found Command: %s" % [comp_command.name])
			commands.append_array(comp.get_command_factories())
	component_ui.set_available_commands(commands)

func tick():
	program.step()
