extends Control


const upgrade_tool = [10, 20, 50, 100, 200]
const upgrade_costs = [200, 500, 1000, 5000, 10000]
const n_upgrades = 5

onready var btns = [ \
                    $ShopUIContainer/Upgrades/BtnUpd1, \
                    $ShopUIContainer/Upgrades/BtnUpd2, \
                    $ShopUIContainer/Upgrades/BtnUpd3, \
                    $ShopUIContainer/Upgrades/BtnUpd4, \
                    $ShopUIContainer/Upgrades/BtnUpd5  \
                   ]

onready var current_level = $ShopUIContainer/Level/Value
onready var max_level = $ShopUIContainer/lblMaxlevel
onready var click_sound = $ShopUIContainer/ClickSound

func _ready():
    for i in range(n_upgrades):
        btns[i].text = "Upgrade to level " + String(i+1) + " - " +  \
                        String(upgrade_costs[i]) + " resources"

func _process(_delta):
    current_level.set_text(str(PlayerVariables.tool_level))

    if PlayerVariables.tool_level < n_upgrades:
        max_level.hide()
    else:
        max_level.modulate = Color(256, 256, 256, 1)

    for i in range(n_upgrades):
        if PlayerVariables.tool_level >= i + 1:
            btns[i].modulate = Color(0, 0, 0, 0)
            btns[i].disabled = true
        elif PlayerVariables.resource < upgrade_costs[i]:
            btns[i].disabled = true
            btns[i].modulate = Color(0.5, 0.5, 0.5, 1)
        else:
            btns[i].disabled = false


func _on_BtnUpd1_pressed():
    PlayerVariables.resource -= upgrade_costs[0]
    PlayerVariables.tool_skills += upgrade_tool[0]
    PlayerVariables.tool_level = 1
    click_sound.play()

func _on_BtnUpd2_pressed():
    PlayerVariables.resource -= upgrade_costs[1]
    PlayerVariables.tool_skills += upgrade_tool[1]
    PlayerVariables.tool_level = 2
    click_sound.play()

func _on_BtnUpd3_pressed():
    PlayerVariables.resource -= upgrade_costs[2]
    PlayerVariables.tool_skills += upgrade_tool[2]
    PlayerVariables.tool_level = 3
    click_sound.play()

func _on_BtnUpd4_pressed():
    PlayerVariables.resource -= upgrade_costs[3]
    PlayerVariables.tool_skills += upgrade_tool[3]
    PlayerVariables.tool_level = 4
    click_sound.play()

func _on_BtnUpd5_pressed():
    PlayerVariables.resource -= upgrade_costs[4]
    PlayerVariables.tool_skills += upgrade_tool[4]
    PlayerVariables.tool_level = 5
    click_sound.play()

func _on_BtnExitShop_pressed():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
    hide()
    PlayerVariables.is_popup_open = false
    click_sound.play()
