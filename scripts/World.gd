extends Spatial

signal show_shop

func _ready():
    $Control.hide()

func _on_Player_show_shop():
    $Control.show()
