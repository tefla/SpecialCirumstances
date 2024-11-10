extends BoxContainer

@onready var availableCommands = $"HBoxContainer/Available Commands"

var unit
var cpu: CPUComponent

func _ready() -> void:
	$Controls/Play.pressed.connect(_play)
	$Controls/Stop.pressed.connect(_stop)
	$Controls/Pause.pressed.connect(_pause)
	$HBoxContainer/Program.add_child(cpu.program.ui)
	

func _play():
	cpu.program.state = cpu.program.States.RUNNING
func _stop():
	cpu.program.state = cpu.program.States.STOPPED
func _pause():
	cpu.program.state = cpu.program.States.INIT	

func set_available_commands(commands):

	for child in availableCommands.get_children():
		availableCommands.remove_child(child)
	for commandFactory in commands:
		var button = Button.new()
		button.text = commandFactory.name
		var callback = func():
			var command = commandFactory.create(unit)
			cpu.program.append_command(command)
		button.pressed.connect(callback)
		# Clicking the button adds the Command Editor to the Program
		availableCommands.add_child(button)
