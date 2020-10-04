extends Button

onready var click_sound = $"../../ClickSound"

func _on_Button_pressed():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
    click_sound.play()
    get_tree().change_scene("res://scenes/World.tscn")

func _on_FullscreenToggle_pressed():
    OS.window_fullscreen = !OS.window_fullscreen
    click_sound.play()

func _on_Help_pressed():
    click_sound.play()
    get_tree().change_scene("res://scenes/Help.tscn")
