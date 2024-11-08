extends PanelContainer

@export var target_position: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_position = Vector2(randi() % 800 - 400, randi() % 600 - 300)
	%Coords.text = "[%s, %s]" % [target_position.x, target_position.y]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
