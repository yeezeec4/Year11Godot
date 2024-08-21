extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@onready var experience = $UI/Control/Experience
#@onready var player_health = $UI/Control/Health
var facing = 1
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var attacking = false
@onready var level_up_notice: PanelContainer = $UI/Control/LevelUpNotice

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SLASH = preload("res://slash.tscn")
func create_slash():
	var new_slash = SLASH.instantiate()
	add_sibling(new_slash)
	new_slash.global_position = global_position
	new_slash.set_direction(facing)

func _physics_process(delta):
	# Add the gravity.
	
		
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("attack"):
		
		sprite.play("attack")
		attacking = true
		await sprite.animation_finished
		#create bullet here
		create_slash()
		attacking = false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction = Input.get_axis("left", "right",)
	if direction:
		velocity.x = direction * SPEED
		if not attacking: sprite.play("running")
	elif direction == 0:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if not attacking:sprite.play("idle")
		
	if velocity.y !=0:
		if not attacking:sprite.play("jump")
		
	if velocity.x < 0:
		sprite.flip_h = true
		facing = -1
	if velocity.x > 0:
		sprite.flip_h = false
		facing = 1
	move_and_slide()

func take_damage(damage_amount):
	print("ouch")
	Globals.player_health -= damage_amount
	$ProgressBar.value = Globals.player_health
	if Globals.player_health <= 0:
		queue_free()
	velocity.x = -100
	print(Globals.player_health)
	#set the progress bar value to the health value
	#if health <= 0
		#load the main menu


func _on_pickup_zone_area_entered(area: Area2D) -> void:
	if area.is_in_group("PickUp"):
		if area.has_method("collect"):
			area.collect()
			if Globals.player_experience > Globals.next_level:
				Globals.level_up()
	


func _on_btn_slash_level_pressed() -> void:
	WeaponSlash.level_up_slash() # Replace with function body.
	$UI/Control/LevelUpNotice.hide()


func _on_btn_health_level_pressed() -> void:
	Globals.level_up_health() # Replace with function body.
	$ProgressBar.max_value = Globals.player_max_health
	$ProgressBar.value = Globals.player_max_health
	$UI/Control/LevelUpNotice.hide()
	

func _on_btn_speed_level_pressed() -> void:
	pass # Replace with function body.
	$UI/Control/LevelUpNotice.hide()
	
