@tool
extends Container
class_name TaskEditor

@export var task: Task
func _ready() -> void:
	$Header/Name.text = task.name
	for prop in task.properties:
		#var prop = default_prop.duplicate()
		var newPropEditor = prop.create_editor()
		
		%Parameters.add_child(newPropEditor)
	if task.canHaveChildren:
		%Children.visible = true
	else:
		%Children.visible = false
	%Children.child_added.connect(_child_added_to_task)
		
	# Connect Dropping in the head of foot zoon
	#$DropZoneHead.on_drop.connect(on_drop)
	#$DropZoneFoot.on_drop.connect(on_drop)

func on_drop(data: Variant):
	# Add as a sibling
	
	print("Dropping in DropZone")
	
func _child_added_to_task(_task: Task):
	task.children.append(_task)

func on_mouse_entered():
	# if Input.	if Input.is_action_pressed("LeftMouseButton"):
	$DropZoneHead.visible = true
	$DropZoneFoot.visible = true	
func on_mouse_exited():
	# if Input.is_action_pressed("LeftMouseButton"):
	$DropZoneHead.visible = false
	$DropZoneFoot.visible = false	
