extends Control


func set_settings(settings: SettingsDefinition):
	get_children().all(queue_free)
	
	for setting in settings.settings:
		var l = Label.new()
		l.text = setting
		add_child(l)	
