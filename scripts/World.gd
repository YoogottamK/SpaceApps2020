extends Spatial

signal show_shop

func _ready():
    $Player.connect("show_shop", self, "_on_Player_show_shop")
    $Shop.connect("show_shop", $Player, "_on_Shop_show_shop")
    $Shop.connect("close_shop", $Player, "_on_Shop_close_shop")

    $ShopMenu.hide()

func _on_Player_show_shop():
    $ShopMenu.show()
