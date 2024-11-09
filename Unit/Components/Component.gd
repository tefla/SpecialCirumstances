extends Resource
class_name BaseComponent

var description = "Base Component that can be added to units"
var name = "BaseComponent"
enum Features {
	component_ui = 1 << 0,
	component_actions = 1 << 1
}

var features:int = 0
	
func _init(_name, _description, _features) -> void:
	name = _name
	description = _description
	features = _features
