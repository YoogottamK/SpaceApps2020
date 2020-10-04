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

    $Env.environment.background_sky.ground_bottom_color = Color( 0.2, 0.2, 0.2, 1 )
    $Env.environment.background_sky.sky_top_color = Color( 0.423529, 0.396078, 0.372549, 1 )
    $Env.environment.background_sky.sky_horizon_color = Color( 0.423529, 0.396078, 0.372549, 1 )
    $Env.environment.background_sky.sun_color = Color( 1, 1, 0, 1 )

    $ShopMenu.hide()
    
    PlayerVariables.resource = 0
    PlayerVariables.tool_level = 1

    var tle_file = File.new()
    tle_file.open("res://tle-debris.json", tle_file.READ)
    var tle_data_t = tle_file.get_as_text()
    tle_data = parse_json(tle_data_t)

    for debris_data in tle_data:
        var new_debris = DebrisScene.instance()
        var init_pos = Vector3(debris_data["initpos"][0], debris_data["initpos"][1], debris_data["initpos"][2])
        new_debris.init(debris_data["inclination"], debris_data["e"], debris_data["anamoly"], debris_data["rot_speed"], debris_data["radius"], debris_data["b"], debris_data["a"], debris_data["apogee"], debris_data["k"], debris_data["theta"], init_pos)
        new_debris.global_transform.origin = init_pos
        debris_container.add_child(new_debris)

func _on_Player_show_shop():
    $ShopMenu.show()

func _on_Timer_timeout():
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    var score = 0
    for i in range(PlayerVariables.tool_level):
        score += $ShopMenu.upgrade_costs[i]
    if score > PlayerVariables.highscore:
        PlayerVariables.highscore = score
    
    get_tree().change_scene("res://scenes/Welcome.tscn")
