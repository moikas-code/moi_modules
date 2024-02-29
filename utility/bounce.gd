extends Node2D
class_name Bounce

func bounce(collision_info, velocity:Vector2):
	return velocity.bounce(collision_info.get_normal())
	
