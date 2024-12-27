extends Task

@export var manipulator: Manipulator

func run():
	running()
	if manipulator.pickup("Stick"):
		success()
	else:
		fail()
	
