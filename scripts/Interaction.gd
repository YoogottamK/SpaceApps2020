extends RayCast

func _process(delta):
    var collider = get_collider()

    if is_colliding() and collider is Debris:
        var old_h = collider.health
        var reward = collider.reward

        collider.health -= PlayerVariables.tool_level

        if old_h - PlayerVariables.tool_level <= 0:
            PlayerVariables.resource += reward
