extends BoxContainer

@onready var availableCommands = $"HBoxContainer/Available Commands"
@onready var program = $"HBoxContainer/Program"

func _ready() -> void:
	$Controls/Play.pressed.connect(_play)

func _play():
	print(program.commands)
func set_available_commands(commands):

	for child in availableCommands.get_children():
		availableCommands.remove_child(child)
	for commandFactory in commands:
		var button = Button.new()
		button.text = commandFactory.name
		var callback = func():
			var command = commandFactory.create()
			program.append_command(command)
		button.pressed.connect(callback)
		# Clicking the button adds the Command Editor to the Program
		availableCommands.add_child(button)
