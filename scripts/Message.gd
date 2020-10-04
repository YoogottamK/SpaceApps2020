extends MarginContainer

onready var label = $Value
onready var color_bg = $ColorRect

var text = ""

func set_text(txt):
    label.text = txt
    text = txt
    color_bg.show()

func clear_text():
    label.text = ""
    text = ""
    color_bg.hide()
