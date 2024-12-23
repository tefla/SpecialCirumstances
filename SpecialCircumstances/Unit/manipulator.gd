extends Node2D

# Lengths of the poles
@export var pole1_length: float = 270.0
@export var pole2_length: float = 270.0

# Nodes
@onready var pole1 = $Pole1
@onready var pole2 = $Pole1/Pole2
@onready var grabber = $Pole1/Pole2/Grabber

func _process(delta: float):
	# Get the target position from the mouse or other logic
	var target_position = get_local_mouse_position()
	calculate_ik(target_position)

func calculate_ik(target_position: Vector2):
	var base_position = global_position

	# Calculate distance to the target
	var distance = base_position.distance_to(target_position)
	var clamped_distance = min(distance, pole1_length + pole2_length)

	# Adjust target if out of reach
	if distance > pole1_length + pole2_length:
		var direction = (target_position - base_position).normalized()
		target_position = base_position + direction * clamped_distance

	# Use law of cosines to calculate the angles
	var angle1: float
	var angle2: float

	# Law of cosines for angle2 (elbow angle)
	var cos_angle2 = (pole1_length**2 + pole2_length**2 - clamped_distance**2) / (2 * pole1_length * pole2_length)
	angle2 = acos(clamp(cos_angle2, -1.0, 1.0))

	# Angle between the base and the target
	var alpha = (target_position - base_position).angle()

	# Law of cosines for angle1 (shoulder angle)
	var cos_beta = (pole1_length**2 + clamped_distance**2 - pole2_length**2) / (2 * pole1_length * clamped_distance)
	var beta = acos(clamp(cos_beta, -1.0, 1.0))
	angle1 = alpha - beta

	# Apply rotations
	pole1.rotation = angle1
	pole2.rotation = angle2
	update_grabber_position()

func update_grabber_position():
	# Update grabber position based on the final link angle
	var pole1_end = pole1.global_position + Vector2(cos(pole1.rotation), sin(pole1.rotation)) * pole1_length
	var grabber_position = pole1_end + Vector2(cos(pole1.rotation + pole2.rotation), sin(pole1.rotation + pole2.rotation)) * pole2_length
	grabber.global_position = grabber_position
