extends Node2D
class_name LaserComponent

@export var area: Area2D
@export var colShape: CollisionShape2D
@export var anim: AnimationPlayer

func area_entered(other_area):
	print("You got Phewed!", other_area)
	if other_area is DamagableArea:
		other_area.damagable.damage(10)
		
func _ready() -> void:
	area.area_entered.connect(area_entered)
	visible = false
func activate():
	colShape.set_deferred("disabled", false)
	visible = true
	anim.play("phew_phew")
	await anim.animation_finished
	
func deactivate():
	colShape.set_deferred("disabled", true)
	visible = false
