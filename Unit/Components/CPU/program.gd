extends Resource
class_name Program

var ui = preload("res://Unit/Components/CPU/Program.tscn").instantiate()
var commands = []
var instruction_pointer = 0
enum States {
	INIT,
	RUNNING,
	STOPPED,
	ERROR,
}
var state: States = States.INIT

func step():
	if commands.size() == 0:
		state = States.INIT
		return
	match state:
		States.INIT:
			instruction_pointer = 0
		States.RUNNING:		
			var current_command = commands[instruction_pointer]
			if current_command.state in [Command.States.INIT, Command.States.FINISHED]:
				current_command.run()
				await current_command.finished
				instruction_pointer += 1
				instruction_pointer = instruction_pointer % commands.size()


func append_command(command):
	commands.append(command)
	_redraw()

func _redraw():
	for child in ui.get_children():
		ui.remove_child(child)
	for command in commands:
		ui.add_child(command.editor)
