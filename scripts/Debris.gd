extends KinematicBody

class_name Debris

onready var collection_sound = $CollectionSound

export var initial_health = 256
export var reward = 100

var health = initial_health

var A
var B
var anomaly
var angle
var apogee
var inc

var rotate_speed
var radius
var e
var k
var theta

func init(p_inc, p_e, p_anomaly, p_rot_speed, p_radius, p_b, p_a, p_apogee, p_k, p_theta):
    inc = p_inc
    e = p_e
    anomaly = p_anomaly
    rotate_speed = p_rot_speed
    radius = p_radius
    B = p_b
    A = p_a
    apogee = p_apogee
    k = p_k
    theta = p_theta
    angle = theta

func _process(_delta):
    $HealthBar3D.update(health, initial_health)
    if health <= 0:
        collection_sound.play()
        health = initial_health
        # queue_free()

func _physics_process(delta):
    angle = fmod(angle + (rotate_speed * delta), 2 * PI)
    var offset = Vector3(A*sin(angle)*cos(inc), apogee*sin(inc)*sin(angle), B*cos(angle)*sin(inc)) * radius
    move_and_slide(offset)
    rotate_y(deg2rad(30 * delta))
    rotate_x(deg2rad(10 * delta))
