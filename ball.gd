extends RigidBody2D

var initial_velocity = Vector2(-300, 100)
var speed_dict = {
	"round_1": 800,
	"round_2": 1000,
	"round_3": 1200,
}
var initial_position = Vector2(640, 320)
var should_reset = false
# var ball_on_paddle = true
var _paddle_position


func _ready() -> void:

	_reset_ball()
	apply_central_impulse(initial_velocity.normalized() * speed_dict["round_" + str(Global.round_number)])
	print('ball by: ', Global.ball_by)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if Input.is_action_just_pressed("launch_1") and _paddle_position.name == 'player_1':
		Global.ball_on_paddle = false
	elif Input.is_action_just_pressed("launch_2") and _paddle_position.name == 'player_2':
		Global.ball_on_paddle = false
	if Global.ball_on_paddle:
		var next_transform = state.get_transform()
		if _paddle_position.name == 'player_1':
			next_transform.origin.x = _paddle_position.global_position.x + 25
		else:
			next_transform.origin.x = _paddle_position.global_position.x - 25
		next_transform.origin.y = _paddle_position.global_position.y
		state.set_transform(next_transform)
	else: 
		state.linear_velocity = linear_velocity.normalized() * speed_dict["round_" + str(Global.round_number)]

	if should_reset:
		# var next_transform = state.get_transform()
		# next_transform.origin.x = initial_position.x
		# next_transform.origin.y = initial_position.y
		# state.set_transform(next_transform)
		Global.ball_on_paddle = true
		should_reset = false
	for i in get_colliding_bodies():
		if i is CharacterBody2D:
			Global.ball_by = i.name  # or i, if you want the full reference

func _reset_ball():
	print('reset ball')
	Global.ball_on_paddle = true
	var Player1 = get_node("../player_1")
	var Player2 = get_node("../player_2")
	_paddle_position = Player1 if randi() % 2 == 0 else Player2
	should_reset = true
