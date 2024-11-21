extends TaskProperty
class_name EntityTypeProp

var type = ""

func get_value():
	return type

func set_value(val):
	print("EntityTypeProp set value")
	type = val
