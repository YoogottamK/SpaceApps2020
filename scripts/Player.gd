extends KinematicBody

class_name Player

export var speed = 10
export var acceleration = 1
export var mouse_sensitivity = 0.03

onready var camera = $Camera
onready var HUD_score = $Camera/UI/HUDContainer/HUD/Score/Value
onready var HUD_level = $Camera/UI/HUDContainer/HUD/ToolLevel/Value
onready var message = $Camera/UI/Message

var velocity = Vector3()

var near_shop = false
var cam1_active = true

const shop_message = "Press G to open shop"

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

    if Input.is_action_just_pressed("ui_cancel"):
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

    if Input.is_key_pressed(KEY_C):
        cam1_active = !cam1_active
        $Camera.current = cam1_active
        $Camera2.current = !cam1_active

func _process(_delta):
    HUD_score.text = String(PlayerVariables.resource)
    HUD_level.text = String(PlayerVariables.tool_level)

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
    near_shop = false
    if message.text == shop_message:
        message.clear_text()

func _on_Shop_show_shop():
    near_shop = true
    message.set_text(shop_message)
