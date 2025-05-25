extends RigidBody2D

var initial_velocity = Vector2(-300, 100)
var speed = 600
var initial_position = Vector2(640, 320)
var should_reset = false



func _ready() -> void:

    _reset_ball()
    apply_central_impulse(initial_velocity.normalized() * speed)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:

    state.linear_velocity = state.linear_velocity.normalized() * speed

    if should_reset:
        var next_transform = state.get_transform()
        next_transform.origin.x = initial_position.x
        next_transform.origin.y = initial_position.y
        state.set_transform(next_transform)
        should_reset = false
		
func _reset_ball():
    print('reset ball')
    print(speed)
    should_reset = true