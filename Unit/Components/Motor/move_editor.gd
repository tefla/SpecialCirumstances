extends Control

var command
@onready var x = %X
@onready var y = %Y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	y.value_changed.connect(_update_command)
	x.value_changed.connect(_update_command)

func _update_command(val):
	command.target_position = Vector2(%X.value, %Y.value)
