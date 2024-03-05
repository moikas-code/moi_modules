extends Node2D
class_name GameCore

signal on_time_add

var time:int = 0

func _ready()->void:
	pass
	
func get_time()->int:
	return time

func add_time(value:int)->void:
	time += value

func on_game_over()->void:
	pass
