extends Node
class_name DeathComponent

@export var health: HealthComponent
@export var root_node: Node
#@export var death_drop_scene: PackedScene
#@export var death_drop_count: int = 1
#

func _ready() -> void:
	health.health_depleted.connect(death)
	
func death():
	root_node.queue_free()
