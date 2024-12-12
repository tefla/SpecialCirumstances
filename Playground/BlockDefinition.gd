extends Resource
class_name BlockDefinition
@export var name: String
@export var header_scene: PackedScene
@export var footer_scene: PackedScene
@export var settings_scene: PackedScene
@export var child_container_scene: PackedScene
@export var is_leaf_task: bool = true

@export var settings: SettingsDefinition

@export var num_children: int = 0
@export var child_container_spacer_scene: PackedScene
@export var show_child_spacer: bool = true
