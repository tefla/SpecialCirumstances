extends Node2D

var statement_scene = preload("res://NewBlockStatement.tscn")
var function_scene = preload("res://NewBlockFunction.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Create a Statement Block
	var block_root = statement_scene.instantiate()
	var child_statement = statement_scene.instantiate()
	var child_function = function_scene.instantiate()
	var child_function2 = function_scene.instantiate()
	var child_function3 = function_scene.instantiate()
	child_statement.add_child_block(child_function)
	child_statement.add_child_block(child_function2)
	block_root.add_child_block(child_statement)
	block_root.add_child_block(child_function3)
	add_child(block_root)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
