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
		children[0].run()
	running()

func child_success():
	if LIMIT > 0:
		count += 1
		if count >= LIMIT:
			count = 0
			repeating = false
			success()
	if repeating:
		children[0].run()

func child_fail():
	repeating = false
	fail()

var current_child = 0

func _init() -> void:
	block = preload("Blocks/BlockStatement.tscn")
	name = "Repeat"
