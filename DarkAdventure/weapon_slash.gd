extends Node

var slash_level = 1
var slash_damage = 5
var slash_speed = 200
var slash_projectiles = 1
var slash_time = 0.8
var slash_knockback = 10


func level_up_slash():
	slash_level +=1
	match slash_level:
		1:
			pass
		2:
			slash_damage = 10
			slash_speed = 500 
			slash_projectiles = 2
			slash_time = 0.8
			slash_knockback = 10
			
			
		3:
			slash_damage = 15
			slash_speed = 500
			slash_projectiles = 2 
			slash_time = 0.5
			slash_knockback = 20
