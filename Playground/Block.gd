@tool
extends Control
@export var block_definition: BlockDefinition

@onready var headerRoot = %Header
@onready var footerRoot = %Footer
@onready var childrenRoot = %Children

func _ready():
	# Composition at runtime based on resource
	if block_definition.header_scene:
		var header = block_definition.header_scene.instantiate()
		header.set_definitions(block_definition)
		headerRoot.add_child(header)
		
	if not block_definition.is_leaf_task and block_definition.footer_scene:
		var header = block_definition.footer_scene.instantiate()
		footerRoot.add_child(header)

	if not block_definition.is_leaf_task and block_definition.child_container_scene:
		var child_container = block_definition.child_container_scene.instantiate()
		childrenRoot.add_child(child_container)
