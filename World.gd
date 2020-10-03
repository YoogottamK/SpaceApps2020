extends Spatial

signal show_shop

# Called when the node enters the scene tree for the first time.
func _ready():
	$Control.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Player_show_shop():
	$Control.show()
	pass # Replace with function body.

