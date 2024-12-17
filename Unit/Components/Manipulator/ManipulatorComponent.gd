extends Component
class_name ManipulatorComponent
#func _init() -> void:
	#features = ComponentFeatures.TASK_PROVIDER
	#tasks = [PickUpTask.new(), UseTask.new()]
	
func _ready():
	$Chopper/ChopperArea/CollisionShape2D.disabled = true

func sort_nodes_by_distance(reference_point: Vector2, nodes: Array[Node]):
	nodes.sort_custom(func(a, b): 
		var dist_a = a.position.distance_to(reference_point)
		var dist_b = b.position.distance_to(reference_point)
		return dist_a < dist_b
	)
	return nodes

@onready var area = $Area2D
func scan_area():
	var areas = area.get_overlapping_areas()
	print("Found following areas", areas)
	var bodies: Array[Node2D] = area.get_overlapping_bodies()
	print("Found following bodies", bodies)
	var all_bodies =  areas + bodies
	for body in all_bodies:
		if body is Entity:
			var comp: Pickupable = body.get_component(Pickupable)
			if comp:
				comp.handle_pickup(entity)
				return
				
func chop_area():
	$Chopper/ChopperArea/CollisionShape2D.disabled = false
	$AnimationPlayer.play("chop")
	await $AnimationPlayer.animation_finished
	$Chopper/ChopperArea/CollisionShape2D.disabled = true


func _on_chopper_area_area_entered(area: Area2D) -> void:
	if area is DeathZone:
		area.health.decrease_health(10)
