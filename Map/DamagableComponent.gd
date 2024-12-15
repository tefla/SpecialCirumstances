extends Component
class_name DamagableComponent

@export var area: Area2D

func _ready() -> void:
	await get_tree().process_frame
	var healthComp: HealthComponent = entity.get_component(HealthComponent)
	area.mouse_entered.connect(func (): healthComp.decrease_health(10))
