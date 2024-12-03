extends Resource
class_name TaskProperty
@export var name: String = "Base Task Property"
@export var editor: PackedScene

enum Type {
	NONE, STRING
}

var _data = {
	"type": Type.NONE,
	"value": null
}

func get_value():
	return _data["value"]
func get_type():
	return _data["type"]
func set_value(val):
	_data["value"] = val
func set_type(type):
	_data["type"] = type
func debug():
	return "Prop: %s = %s" % [name, get_value()]

func create_editor():
	var scene = editor.instantiate()
	scene.value_changed.connect(set_value)
	return scene
	
func update_value(value):
	pass
