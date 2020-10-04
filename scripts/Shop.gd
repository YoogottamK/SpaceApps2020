extends StaticBody

class_name Shop

signal show_shop
signal close_shop

func _on_Area_body_entered(body):
    if not body is Player:
        return
    print("Sent Show")
    emit_signal("show_shop")

func _on_Area_body_exited(body):
    if not body is Player:
        return
    print("Sent Close")
    emit_signal("close_shop")
