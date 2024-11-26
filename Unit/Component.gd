extends Resource
class_name Component

enum ComponentFeatures {
	NONE = 0,
	UI_PROVIDER = 1 << 0,
	BLOCK_PROVIDER = 1 << 1
}
var features: ComponentFeatures = ComponentFeatures.NONE


func get_ui():
	pass
func get_blocks():
	pass
