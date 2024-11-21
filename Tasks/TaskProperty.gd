extends Resource
class_name TaskProperty
@export var name: String = "Base Task Property"
@export var editor: PackedScene

func get_value():
	pass
func set_value(val):
	print("Abstract set value")
	pass
func debug():
	return "Prop: %s = %s" % [name, get_value()]

func create_editor():
	var scene = editor.instantiate()
	scene.value_changed.connect(set_value)
	return scene
	
func update_value(value):
	pass
