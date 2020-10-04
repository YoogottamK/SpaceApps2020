extends Control

func _input(event):
    if Input.is_action_pressed("pause_game"):
        print("p pressed")
        get_tree().paused = !get_tree().paused
        visible = !visible