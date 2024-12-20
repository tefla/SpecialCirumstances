extends Task

func run():
	running()
	await get_tree().create_timer(2).timeout
	success()
