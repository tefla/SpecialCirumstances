extends Node
class_name DamagableComponent

@export var area: DamagableArea
@export var health: HealthComponent
func _ready() -> void:
	area.mouse_entered.connect(func (): health.decrease_health(10))

func damage(d: int):
	health.decrease_health(d)
