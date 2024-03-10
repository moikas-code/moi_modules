extends BaseEntity3D
class_name PlayerEntity3D


@export var h_mouse_sense:float = 0.5
@export var v_mouse_sense:float = 0.5
@export var camera_container:Node3D
@onready var camera = $CameraContainer/Camera

func _ready()->void:
	entity_type = "PLAYER"
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

