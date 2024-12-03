extends InputBlockBase

var _pos = Vector2.ZERO

func _ready() -> void:
	$PosX.value_changed.connect(_update_input)
	$PosY.value_changed.connect(_update_input)
func _update_input(_v):
	var x = $PosX.value
	var y = $PosY.value
	_input["value"] = Vector2(x, y)
	$Value.text = "[%s, %s]" % [_input["value"].x, _input["value"].y]
	
