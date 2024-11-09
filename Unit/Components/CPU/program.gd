extends VBoxContainer
class_name Program


var commands = []


func append_command(command):
	commands.append(command)
	_redraw()

func _redraw():
	for child in get_children():
		remove_child(child)
	for command in commands:
		add_child(command.editor)
