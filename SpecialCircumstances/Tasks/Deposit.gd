extends Task

@export var manipulator: Manipulator

func run():
	running()
	if manipulator.deposit():
		success()
	else:
		fail()
	
