extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const upgrade_tool = [10, 20, 50, 100, 200]
const upgrade_costs = [200, 500, 1000, 5000, 10000]
onready var btns = [$BtnUpd1, $BtnUpd2, $BtnUpd3, $BtnUpd4, $BtnUpd5]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$lblCurrentLevelValue.set_text(str(PlayerVariables.tool_level))
	if PlayerVariables.tool_level < 5:
		$lblMaxlevel.hide()
	else:
		$lblMaxlevel.modulate = Color(256, 256, 256, 1)
		
	for i in range(len(upgrade_costs)):
		if PlayerVariables.tool_level >= (i + 1):
			btns[i].modulate = Color(0, 0, 0, 0)
			btns[i].disabled = true
		elif PlayerVariables.resource < upgrade_costs[i]:
			btns[i].disabled = true
			btns[i].modulate = Color(0.5, 0.5, 0.5, 1)
#	pass


func _on_BtnUpd1_pressed():
	PlayerVariables.resource -= upgrade_costs[0]
	PlayerVariables.tool_skills += upgrade_tool[0]
	PlayerVariables.tool_level = 1

func _on_BtnUpd2_pressed():
	PlayerVariables.resource -= upgrade_costs[1]
	PlayerVariables.tool_skills += upgrade_tool[1]
	PlayerVariables.tool_level = 2
	
func _on_BtnUpd3_pressed():
	PlayerVariables.resource -= upgrade_costs[2]
	PlayerVariables.tool_skills += upgrade_tool[2]
	PlayerVariables.tool_level = 3
	
func _on_BtnUpd4_pressed():
	PlayerVariables.resource -= upgrade_costs[2]
	PlayerVariables.tool_skills += upgrade_tool[2]
	PlayerVariables.tool_level = 4

func _on_BtnUpd5_pressed():
	PlayerVariables.resource -= upgrade_costs[3]
	PlayerVariables.tool_skills += upgrade_tool[3]
	PlayerVariables.tool_level = 5

func _on_BtnExitShop_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$".".hide()
	PlayerVariables.is_popup_open = false
