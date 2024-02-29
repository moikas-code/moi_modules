extends Node2D
class_name SpawnManager


@export var game_manager:GameManager = null
@export var spawn_delay: int = 0
var spawn_delay_counter: int = 0

func spawn_entity(contianer:Node2D, scene:PackedScene, _type:String, position:Vector2, options):
	if contianer ==  null or scene == null:
		return
	#instantiate entity
	var new_entity = scene.instantiate()
	#add entity to container
	contianer.add_child(new_entity)
	#set type and position
	new_entity.entity_type = _type
	new_entity.position = position
	if options != null:
		for i in options:
			new_entity[i] = options[i]
			
	#print(new_entity.size)

func on_entity_destroy(entity:CharacterBody2D,type:String):
	pass
