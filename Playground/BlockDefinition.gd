extends Resource
class_name BlockDefinition
@export var name: String
@export var header_scene: PackedScene
@export var footer_scene: PackedScene
@export var settings_scene: PackedScene
@export var child_container_scene: PackedScene
@export var is_leaf_task: bool = true

@export var settings: SettingsDefinition
