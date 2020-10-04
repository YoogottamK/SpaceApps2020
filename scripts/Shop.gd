extends StaticBody

class_name Shop

signal show_shop
signal close_shop

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


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
