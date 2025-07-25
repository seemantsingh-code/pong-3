extends CharacterBody2D

var speed = 600

func _physics_process(delta):
	# Handle player movement
	var input_direction = 0

	if Input.is_key_label_pressed(KEY_W):
		input_direction -= 1
	if Input.is_key_label_pressed(KEY_S):
		input_direction += 1
	if Input.is_key_label_pressed(KEY_A):
		rotation -= .1
	if Input.is_key_label_pressed(KEY_D):
		rotation += .1
	position.y += input_direction * speed * delta

	var viewport_height = get_viewport_rect().size.y

	var paddle_height = get_node("Paddle").texture.get_height()

	position.y = clamp(position.y, paddle_height / 2, viewport_height - paddle_height / 2)
