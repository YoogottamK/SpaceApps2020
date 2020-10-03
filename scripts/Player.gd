extends KinematicBody

export var speed = 5
export var acceleration = 1
export var mouse_sensitivity = 0.03

onready var camera = $Camera
onready var player = $"."

var velocity = Vector3()

var tool_level = 1
var resource = 0

func _input(event):
    if event is InputEventMouseMotion:
        player.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))

func _process(_delta):
    if Input.is_action_just_pressed("ui_cancel"):
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

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
