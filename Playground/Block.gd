@tool
extends Control
@export var block_definition: BlockDefinition

@onready var headerRoot = %Header
@onready var footerRoot = %Footer
@onready var childrenRoot = %Children

func _ready():
	if not Engine.is_editor_hint():
		# Composition at runtime based on resource
		if block_definition.header_scene:
			var header = block_definition.header_scene.instantiate()
			header.set_definitions(block_definition)
			headerRoot.add_child(header)
			
		if not block_definition.is_leaf_task and block_definition.footer_scene:
			var header = block_definition.footer_scene.instantiate()
			footerRoot.add_child(header)

		if not block_definition.is_leaf_task and block_definition.child_container_scene:
			for n in block_definition.num_children:
				if block_definition.child_container_spacer_scene and n > 0:
					var spacer = block_definition.child_container_spacer_scene.instantiate()
					childrenRoot.add_child(spacer)
					
				var child_container = block_definition.child_container_scene.instantiate()
				child_container.set_definitions(block_definition)
				childrenRoot.add_child(child_container)
