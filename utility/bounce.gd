extends RigidBody2D
class_name Bounce

signal on_bounce	

func bounce(collision_info,velocity: Vector2, delta):
	if collision_info:
		emit_on_bounce()
		return velocity.bounce(collision_info.get_normal())
	return velocity

func emit_on_bounce():
	on_bounce.emit()
