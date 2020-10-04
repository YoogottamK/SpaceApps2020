extends TextureRect

func _ready():
    $HS.set_text("Highscore - " + str(PlayerVariables.highscore))
    pass # Replace with function body.
