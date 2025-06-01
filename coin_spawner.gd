extends Node2D

# Preload your Coin scene
var CoinScene = preload("res://coin.tscn")

# Timer for spawning coins
var spawn_timer := 0.0
var next_spawn_time := 1.0

func _ready():
	randomize()
	set_process(true)

func _process(delta):
	spawn_timer += delta
	if spawn_timer >= next_spawn_time:
		spawn_timer = 0.0
		next_spawn_time = randf_range(5.0, 10.0)  # Random interval between 1-3 seconds
		spawn_coin()

func spawn_coin():
	var coin = CoinScene.instantiate()
	
	# Set a random position inside the screen bounds
	var screen_size = get_viewport().size
	coin.position = Vector2(
		randf_range(400, 1500),
		randf_range(0, screen_size.y)
	)
	print("Spawning coin at: ", coin.position)
	get_parent().add_child(coin)
