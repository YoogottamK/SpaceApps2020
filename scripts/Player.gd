extends KinematicBody

export var speed = 5
export var acceleration = 1
export var mouse_sensitivity = 0.3

onready var camera = $Camera
onready var player = $"."

var velocity = Vector3()

func _input(event):
	if event is InputEventMouseMotion:
		player.rotate_y(deg2rad(-event.relative.x * mouse_sensitivity))

func _process(delta):
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

		direction = direction.normalized()

	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)
