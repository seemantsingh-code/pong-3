extends RigidBody2D

var initial_velocity = Vector2(-300, 100)
var speed_dict = {
	"round_1": 800,
	"round_2": 1000,
	"round_3": 1200,
}
var initial_position = Vector2(640, 320)
var should_reset = false



func _ready() -> void:

	_reset_ball()
	apply_central_impulse(initial_velocity.normalized() * speed_dict["round_" + str(Global.round_number)])
	print('ball by: ', Global.ball_by)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:

	state.linear_velocity = linear_velocity.normalized() * speed_dict["round_" + str(Global.round_number)]

	if should_reset:
		var next_transform = state.get_transform()
		next_transform.origin.x = initial_position.x
		next_transform.origin.y = initial_position.y
		state.set_transform(next_transform)
		should_reset = false
	for i in get_colliding_bodies():
		if i is CharacterBody2D:
			Global.ball_by = i.name  # or i, if you want the full reference
			print("Ball last touched by:", i.name)

func _reset_ball():
	print('reset ball')
	should_reset = true
