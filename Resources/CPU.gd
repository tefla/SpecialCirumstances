extends Resource
class_name CPU

var instructions = []
signal instruction_updated

var ip = 0
var timer: Timer
var unit
func _init(_unit) -> void:
	unit = _unit
	print("INIT!")
	_setup_timer()
	
func _setup_timer():
	timer = Timer.new()
	timer.autostart = false
	timer.one_shot = false
	timer.timeout.connect(_on_tick)
	unit.add_child(timer)	
func append_instruction(_instruction):
	
	print("Added Instruction")
	instructions.append(_instruction)
	instruction_updated.emit()

func _on_tick():
	print("TICK!")
	ip = ip % instructions.size()
	for i in instructions.size():
		if i == ip:
			instructions[i].instance_ui.modulate = Color.GREEN
		else:
			instructions[i].instance_ui.modulate = Color.WHITE
	instructions[ip].instance_script.say_hi()
	ip += 1

func play():
	timer.start(1.0)
func reset():
	timer.stop()
