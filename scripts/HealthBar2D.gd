extends TextureProgress

var bar_red = preload("res://assets/HealthBar/red.png")
var bar_green = preload("res://assets/HealthBar/green.png")
var bar_yellow = preload("res://assets/HealthBar/yellow.png")

func update_bar(amount, full):
    max_value = full
    texture_progress = bar_green
    value = amount

    if amount < 0.75 * full:
        texture_progress = bar_yellow
    if value < 0.25 * full:
        texture_progress = bar_red
