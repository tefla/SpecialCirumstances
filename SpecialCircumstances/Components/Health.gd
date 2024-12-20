extends Node
class_name HealthComponent

@export var health_bar: ProgressBar
@export var health = 100
@export var root_node: Node

signal health_depleted

func _ready() -> void:
	health_bar.value = health

func decrease_health(damage: int):
	health = clamp(health - damage, 0, 2^100)
	health_bar.value = health
	if health == 0:
		health_depleted.emit()
func increase_health(heal: int):
	health = clamp(health + heal, 0, 2^100)
	health_bar.value = health
	if health == 0:
		health_depleted.emit()
