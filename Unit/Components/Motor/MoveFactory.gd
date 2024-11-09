extends Resource
class_name MotorMoveFactory

var move_editor_scene = preload("res://Unit/Components/Motor/MoveEditor.tscn")
var move_command_resource = preload("res://Unit/Components/Motor/MoveCommand.gd")

var name = "Move"

func create():
	var editor = move_editor_scene.instantiate()
	var instance = move_command_resource.new()
	instance.editor = editor
	editor.command = instance
	return instance
