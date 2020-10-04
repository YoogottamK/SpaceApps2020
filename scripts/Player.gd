extends KinematicBody

class_name Player

export var speed = 5
export var acceleration = 1
export var mouse_sensitivity = 0.03

onready var camera = $Camera
onready var HUD_score = $Camera/UI/HUDContainer/HUD/Score/Value
onready var HUD_level = $Camera/UI/HUDContainer/HUD/ToolLevel/Value

var velocity = Vector3()

var near_shop = false

signal show_shop

func _input(event):
    if event is InputEventMouseMotion:
        if PlayerVariables.is_popup_open == false:
            rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))

    if Input.is_key_pressed(KEY_G):
        if near_shop == true:
            Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
            PlayerVariables.is_popup_open = true
            emit_signal("show_shop")

func _process(_delta):
    if Input.is_action_just_pressed("ui_cancel"):
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    
    HUD_score.text = String(resource)
    HUD_level.text = String(tool_level)


func _physics_process(delta):
    var camera_basis = camera.get_camera_transform().basis
    var direction = Vector3()

    if Input.is_action_pressed("move_forward"):
        direction -= camera_basis.z
    elif Input.is_action_pressed("move_backward"):
        direction += camera_basis.z

    if Input.is_action_pressed("move_left"):
        direction -= camera_basis.x
    elif Input.is_action_pressed("move_right"):
        direction += camera_basis.x

    if Input.is_action_pressed("move_up"):
        direction += camera_basis.y
    elif Input.is_action_pressed("move_down"):
        direction -= camera_basis.y

        direction = direction.normalized()

    velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
    velocity = move_and_slide(velocity)

func _on_Shop_close_shop():
    print("Caught close")
    near_shop = false

func _on_Shop_show_shop():
    print("Caught show")
    near_shop = true
