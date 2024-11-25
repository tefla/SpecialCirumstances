extends Resource
class_name Task


@export var name = "Base Task"
@export var default_properties: Array[TaskProperty] = []

#region Children
@export var canHaveChildren: bool = false
@export var children: Array[Task] = []
#endregion

var properties: Array[TaskProperty] = []

func create():
	var new_self = duplicate()
	
	for prop in new_self.default_properties:
		new_self.properties.append(prop.duplicate())
	return new_self
func _exec():
	pass


func _debug(depth = 0):
	var props = ""
	for prop in properties:
		props += prop.debug()
	print("=> %s Name: %s [%s]" % [" ".repeat(depth), name, props])
	
	for child in children:
		child._debug(depth+1)
