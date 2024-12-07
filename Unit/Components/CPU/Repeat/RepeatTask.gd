class_name Repeat
extends Task

# All children must run successfully


# Number of times to run or zero for infinite
@export var LIMIT = 5

var count = 0
var repeating = false

func run():
	if not repeating:
		repeating = true
		children[current_child].run()
	running()

func child_success():
	current_child += 1
	if current_child >= children.size():
		current_child = 0
		if LIMIT > 0:
			count += 1
			if count >= LIMIT:
				count = 0
				repeating = false
				success()
	if repeating:
		await wait()
		children[current_child].run()

func child_fail():
	repeating = false
	fail()

var current_child = 0
	
func set_repeat_option(idx):
	print(idx)

func _init() -> void:
	block = preload("RepeatBlock.tscn")
	name = "Repeat"

func get_block():
	var _block = super.get_block()
	# Attach listeners
	return _block
