extends Node2D

var current_wave: int = 1
var enemies_to_spawn: int
var enemies_killed: int = 0
var wave_increment: int = 5



@onready var spawn1 = $Player/Camera2D/Marker2D
@onready var spawn2 = $Player/Camera2D/Marker2D2
@export var EnemyScene : PackedScene
@export var Enemy2 : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	#start_wave()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	spawn_enemy()


func spawn_enemy():
	var enemy_instance
	#if enemies_killed > 20:
		#enemy_instance = HardEnemy.instantiate()
	if Globals.enemies_killed> 10:
		enemy_instance = Enemy2.instantiate()
	else:
		enemy_instance = EnemyScene.instantiate()
	var spawn = [spawn1,spawn2].pick_random()
	# Set the enemy's position (you can customize this as needed)
	enemy_instance.global_position = spawn.global_position  # Example position
	
	# Add the enemy instance to the current scene
	add_child(enemy_instance)
	
