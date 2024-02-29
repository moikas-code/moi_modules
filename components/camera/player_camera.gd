class_name PlayerCamera
extends Camera2D
@export_range(0.0, 10.0) var camera_speed:float
@export var camera_offset_vector:Vector2 = Vector2.ZERO
var player: PlayerEntity = null;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.on_player_ready.connect(set_target)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	follow_target(delta)

func set_target(_player:PlayerEntity)->void:
	if _player == null:
		return
	player = _player

func follow_target(delta:float)->void:
	if player == null:
		return
	
	position = lerp(position, player.position + camera_offset_vector, camera_speed * delta)	
