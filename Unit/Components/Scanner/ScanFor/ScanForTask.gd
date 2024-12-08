extends Task
class_name ScanForTask

var _value: Vector2
var scan_for_type = "Tree"

func _init() -> void:
	name = "Scan For"
	block = preload("ScanForBlock.tscn")
	result_type = ResultType.POSITION

func get_block():
	var _block = await super.get_block()
	# Attach listeners
	return _block

func run():
	running()
	component.scanner.play("scanner")
	await wait()
	var res = component.scan_area(scan_for_type)
	if res:
		_value = res.position
		success()
	else:
		fail()
	component.scanner.stop()
