extends StaticBody

class_name Debris

export var initial_health = 256
export var reward = 100

var health = initial_health

func _process(delta):

    $HealthBar3D.update(health, initial_health)
    if health <= 0:
        health = initial_health
        # queue_free()
