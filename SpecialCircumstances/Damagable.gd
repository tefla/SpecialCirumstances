extends Node
class_name DamagableComponent

@export var area: Area2D
@export var health: HealthComponent
func _ready() -> void:
	area.mouse_entered.connect(func (): health.decrease_health(10))
