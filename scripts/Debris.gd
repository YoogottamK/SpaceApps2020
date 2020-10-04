extends KinematicBody

class_name Debris

export var initial_health = 256
export var reward = 100

var health = initial_health

export(float) var rotate_speed = 0.1
export(float) var radius = 10*rotate_speed

var A = 4
var B = 3
var anomaly = 1.7
var angle = anomaly
var apogee = 1.5 # furthest point
var e = sqrt(1 - (B*B/(A*A)))
var inc = PI/3 # radians

var k = sqrt(1/( (cos(anomaly)*cos(anomaly)/(A*A)) + (sin(anomaly)*sin(anomaly)/(B*B)) ))
var theta = atan(k*sin(anomaly)/(e + k*cos(anomaly)))

func _process(delta):
    $HealthBar3D.update(health, initial_health)
    if health <= 0:
        health = initial_health
        # queue_free()

func _physics_process(delta):
    angle = fmod(angle + (rotate_speed * delta), 2 * PI)
    var offset = Vector3(A*sin(angle)*cos(inc), apogee*sin(inc)*sin(angle), B*cos(angle)*sin(inc)) * radius
    move_and_slide(offset)
    rotate_y(deg2rad(30 * delta))
    rotate_x(deg2rad(10 * delta))