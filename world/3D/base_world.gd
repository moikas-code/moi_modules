extends Node3D
class_name BaseFloor

@onready var floor = $Map/Floor


@export var width =  1000
@export var length = 1000
@export var height = 1

func _ready()->void:
	floor.size.x = width
	floor.size.z = length
	floor.size.y = height
