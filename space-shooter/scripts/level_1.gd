extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var ui = $HUD/UI

func _ready():
	ui.set_score(score)

func _on_death_zone_area_entered(area):
	area.queue_free()


func _on_player_took_damage():
	lives -= 1
	if lives <= 0:
		player.die()
		
	
func _on_enemy_spawner_enemy_spawned(enemy_instance):
	enemy_instance.connect("died", on_enemy_died)
	add_child(enemy_instance)

func on_enemy_died():
	score += 50
	ui.set_score(score)
