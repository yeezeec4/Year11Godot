extends Area2D

@export var speed = 200
@export var damage = 15

var direction

func _ready():
	
	await  get_tree().create_timer(3).timeout
	queue_free()

func set_direction(slashDirection):
	direction = slashDirection
	scale.x = direction
	
func _physics_process(delta):
	global_position.x += direction * WeaponSlash.slash_speed * delta


func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		body.get_damage(WeaponSlash.slash_damage)
		queue_free()
