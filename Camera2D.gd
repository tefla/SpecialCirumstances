extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("UpKey"):
		position.y -= 10
	if Input.is_action_pressed("DownKey"):
		position.y += 10
	if Input.is_action_pressed("LeftKey"):
		position.x -= 10
	if Input.is_action_pressed("RightKey"):
		position.x += 10
	if Input.is_action_just_released("ZoomIn"):
		zoom.x += 0.1
		zoom.y += 0.1
	if Input.is_action_just_released("ZoomOut"):
		zoom.x -= 0.1
		zoom.y -= 0.1
