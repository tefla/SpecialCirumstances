extends Task

@export var crafter: CrafterComponent

func run():
	running()
	if crafter.craft():
		success()
	else:
		fail()
	
