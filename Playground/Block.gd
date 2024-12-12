@tool
extends Control
@export var block_definition: BlockDefinition

@onready var headerRoot = %Header
@onready var childrenRoot = %Children

func _ready():
	# Composition at runtime based on resource
	if block_definition.header_scene:
		var header = block_definition.header_scene.instantiate()
		headerRoot.add_child(header)

		if block_definition.settings_scene:
			var settings = block_definition.settings_scene.instantiate()
			settings.set_settings(block_definition.settings)
			header.add_child(settings)
	if block_definition.child_container_scene:
		var child_container = block_definition.child_container_scene.instantiate()
		childrenRoot.add_child(child_container)
