extends Spatial

signal show_shop

const DebrisScene = preload("res://scenes/Debris.tscn")

func _ready():
	$Player.connect("show_shop", self, "_on_Player_show_shop")
	$Shop.connect("show_shop", $Player, "_on_Shop_show_shop")
	$Shop.connect("close_shop", $Player, "_on_Shop_close_shop")
	$Timer.connect("timeout", self, "_on_Timer_timeout")

	$ShopMenu.hide()

	var new_debris = DebrisScene.instance()
	new_debris.init(4, 3, 1.7, 1.5, 0.1)
	new_debris.global_transform.origin = Vector3(0, 0, 0)
	$DebrisContainer.add_child(new_debris)

func _on_Player_show_shop():
	$ShopMenu.show()

func _on_Timer_timeout():
	$Player.queue_free()
