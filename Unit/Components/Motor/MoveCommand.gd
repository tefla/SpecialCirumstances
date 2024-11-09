extends Resource
class_name MoveCommand

var editor
var target_position: Vector2 = Vector2.ZERO

func _to_string() -> String:
	return "<MoveCommand: MOVE TO [%s, %s]>" % [target_position.x, target_position.y]
