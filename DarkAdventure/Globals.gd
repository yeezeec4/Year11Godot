extends Node

var enemies_killed = 0


var player_level = 1
var player_experience = 0
var player_health = 10
var player_max_health = 10
var next_level = 15

signal level_up
signal add_xp


func level_up_player():
	player_level+=1
	next_level = next_level + 10
	player_experience= 0
	emit_signal("level_up")
	
func add_experience(val):
	player_experience += val
	emit_signal("add_xp")
	if player_experience >= next_level:
		level_up_player()
		
func level_up_health():
	player_max_health += 2
	player_health = player_max_health

func take_damage():
	pass
