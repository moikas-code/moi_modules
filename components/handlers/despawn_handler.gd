extends Node2D
class_name DespawnManager
@onready var timer = $Timer

@export var entity: BaseEntity = null
@export_range(0.0,120.0) var despawn_time:float = 1.0

func _ready()->void:
	timer.wait_time = despawn_time
	timer.timeout.connect(on_despawn)
	timer.start()

func on_despawn()->void:
	if entity == null:
		return
	
	entity.queue_free()
