extends Node2D

var wave_number: int = 1
var enemies_to_kill: int = 10
var enemies_killed: int = 0
var enemy_speed: float = 100.0
var spawn_interval: float = 1.0

# Export a packed scene of the enemy
@export var enemy_scene: PackedScene

func _ready():
	start_wave()

func start_wave():
	print("Wave ", wave_number, " starting!")
	enemies_killed = 0
	for i in range(enemies_to_kill):
		await get_tree().create_timer(spawn_interval).timeout
		spawn_enemy()

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.speed = enemy_speed  # Assuming the enemy script has a 'speed' variable

func on_enemy_killed():
	enemies_killed += 1
	if enemies_killed >= enemies_to_kill:
		start_next_wave()

func start_next_wave():
	wave_number += 1
	enemies_to_kill += 5  # Increase the number of enemies per wave
	enemy_speed += 20.0  # Increase the enemy speed per wave
	spawn_interval *= 0.9  # Decrease the spawn interval
	start_wave()
