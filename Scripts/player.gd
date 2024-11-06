extends CharacterBody2D
class_name Player

var selected: bool = false
const SPEED = 300.0
@onready var destination: Vector2 = position
var bounce: Vector2 = Vector2.ZERO

var is_inside = false

@export var Actions: Array[Resource] = []


func _physics_process(delta: float) -> void:
	if position.distance_to(destination) > 5 :
		var dir = position.direction_to(destination)
		velocity = dir * SPEED + bounce
		
		var colls = move_and_collide(velocity * delta)
		if colls:
			print(colls)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if selected: 
		modulate = Color.RED
	else:
		modulate = Color.WHITE 

func _input(event: InputEvent) -> void:
	#print(event)
	if event.is_action_released("Click"):
		if is_inside:
			selected = true
			GameManager.set_selected(self)
		else:
			selected = false
			GameManager.deselect()
			

		
func _on_mouse_entered() -> void:
	print("Is Inside")
	is_inside = true


func _on_mouse_exited() -> void:
	print("Is Outside")
	is_inside = false # Replace with function body.
