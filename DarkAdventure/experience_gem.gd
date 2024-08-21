extends Area2D

@export var experience_value = 5
var collected = false
@onready var player = get_tree().get_first_node_in_group("Player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if collected:
		if player:
			global_position = global_position.move_toward(player.global_position, 300 *delta)
			
			
func collect():
	collected = true
	Globals.add_experience(experience_value)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		queue_free()
