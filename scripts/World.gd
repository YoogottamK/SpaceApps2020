extends Spatial

signal show_shop

const DebrisScene = preload("res://scenes/Debris.tscn")
onready var debris_container = $DebrisContainer

func _ready():
    var tle_data = {}
    $Player.connect("show_shop", self, "_on_Player_show_shop")
    $Shop.connect("show_shop", $Player, "_on_Shop_show_shop")
    $Shop.connect("close_shop", $Player, "_on_Shop_close_shop")
    $Timer.connect("timeout", self, "_on_Timer_timeout")

    $ShopMenu.hide()

    var tle_file = File.new()
    tle_file.open("res://tle-debris.json", tle_file.READ)
    var tle_data_t = tle_file.get_as_text()
    tle_data = parse_json(tle_data_t)

    for debris_data in tle_data:
        var new_debris = DebrisScene.instance()
        new_debris.init(debris_data["inclination"], debris_data["e"], debris_data["anamoly"], debris_data["rot_speed"], debris_data["radius"], debris_data["b"], debris_data["a"], debris_data["apogee"], debris_data["k"], debris_data["theta"])
        new_debris.global_transform.origin = Vector3(debris_data["initpos"][0], debris_data["initpos"][1], debris_data["initpos"][2])
        debris_container.add_child(new_debris)

func _on_Player_show_shop():
    $ShopMenu.show()

func _on_Timer_timeout():
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    get_tree().change_scene("res://scenes/Welcome.tscn")
