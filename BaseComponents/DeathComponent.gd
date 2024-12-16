extends Component
class_name DeathComponent

@export var health: HealthComponent
@export var root_node: Node
@export var death_drop_scene: PackedScene
@export var death_drop_count: int = 1


func _ready() -> void:
	await get_tree().process_frame
	health.health_depleted.connect(death)
	
func death():
	root_node.queue_free()
	# Spawn item drop
	
	# For now, just drop 3 sticks
	for n in range(death_drop_count):
		var inst: Node2D = death_drop_scene.instantiate()
		inst.position = entity.position
		var root = get_node("/root/Game")
		if root:
			root.add_child(inst)
