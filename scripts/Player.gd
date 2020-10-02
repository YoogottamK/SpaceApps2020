extends KinematicBody

export var speed = 10
export var acceleration = 5
export var mouse_sensitivity = 0.3

onready var camera = $Camera

var velocity = Vector3()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		camera.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(delta):
	var camera_basis = camera.get_camera_transform().basis
	var direction = Vector3()
	
	if Input.is_action_pressed("move_forward"):
		direction -= camera_basis.z

	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)
