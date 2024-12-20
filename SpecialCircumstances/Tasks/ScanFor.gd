extends Task
class_name ScanForTask

@export var scanner: Scanner
var scan_for_type: String

func run():
	running()
	result = scanner.scan(scan_for_type)
	if result:
		success()
	else:
		fail()
