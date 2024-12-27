extends PanelContainer
class_name Slot


var count: int = 0:
	get: return count
	set (_count): 
		count = _count
		update_count()
var item: Item = null :
	get:
		return item
	set (_item):
		item = _item
		update_texture()

func update_count():
	$Label.text = str(count)
	
func update_texture():
	var sbt =  StyleBoxTexture.new()
	sbt.texture = item.texture
	add_theme_stylebox_override("panel", sbt)
