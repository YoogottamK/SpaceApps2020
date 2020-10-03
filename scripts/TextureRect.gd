extends TextureRect

func _ready():
    var screen_size = get_viewport_rect().size
    
    var _w = (screen_size[0] - rect_size[0]) / 2
    var _h = (screen_size[1] - rect_size[1]) / 2
    
    rect_position = Vector2(_w, _h)