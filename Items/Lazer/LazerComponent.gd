extends Component
class_name LazerComponent


func chop_area():
	$Chopper/ChopperArea/CollisionShape2D.disabled = false
	$AnimationPlayer.play("chop")
	await $AnimationPlayer.animation_finished
	$Chopper/ChopperArea/CollisionShape2D.disabled = true

func use():
	await chop_area()

func _enter_tree() -> void:
	$Chopper/ChopperArea.area_entered.connect(_on_chopper_area_area_entered)
	
func _on_chopper_area_area_entered(area: Area2D) -> void:
	if area is DeathZone:
		area.health.decrease_health(10)
