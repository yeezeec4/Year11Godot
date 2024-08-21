extends CanvasLayer

@onready var experience: ProgressBar = $Control/Experience
@onready var health: ProgressBar = $Control/Health

func _ready():
	Globals.level_up.connect(update_xp)
	#Globals.take_damage.connect(update_health)
	Globals.add_xp.connect(update_xp)




func update_xp():
	experience.max_value = Globals.next_level
	experience.value = Globals.player_experience
	
func update_health():
	health.max_value = Globals.player.max_health
	health.value = Globals.player_health
