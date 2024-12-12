extends PanelContainer

func set_definitions(defs: BlockDefinition):
	%Label.text = defs.name
	if defs.settings_scene:
		var settings = defs.settings_scene.instantiate()
		settings.set_settings(defs.settings)
		%Settings.add_child(settings)
