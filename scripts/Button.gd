extends Button

func _on_Button_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().change_scene("res://scenes/World.tscn")

func _on_FullscreenToggle_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
