extends CharacterBody2D
class_name Unit
@export var movable: MovableComponent
@export var root: Task


func _on_button_pressed() -> void:
	root.start()
	root.run()
