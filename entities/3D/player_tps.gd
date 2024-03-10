extends PlayerEntity3D
class_name PlayerTPS

@onready var animation_player = $visuals/player_root/AnimationPlayer
@onready var visuals = $visuals
@onready var smooth_dir : Vector3 = position
var rotation_smoothing = 0.0
@export_range(0,1) var rotation_stiffness : float = 0.1

const WALK_SPEED = 3.0
const RUN_SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _input(event)->void:
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * h_mouse_sense))
		visuals.rotate_y(deg_to_rad(event.relative.x * h_mouse_sense))
		if camera_container == null:
			return
		camera_container.rotate_x(deg_to_rad(-event.relative.y * v_mouse_sense))
		camera_container.rotation.x = clamp(camera_container.rotation.x, deg_to_rad(-30.0), deg_to_rad(90.0))

func _physics_process(delta):
	rotation_smoothing += delta + 0.4
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		if animation_player.current_animation != "Jump":
			animation_player.play("Jump")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("right", "left", "down", "up")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		smooth_dir = lerp(smooth_dir, position - direction, rotation_smoothing)
		visuals.look_at(direction + position)
		if Input.is_action_pressed("run") and is_on_floor():
			if animation_player.current_animation != "Run":
				animation_player.play("Run")	
			velocity.x = direction.x * RUN_SPEED
			velocity.z = direction.z * RUN_SPEED
		else:
			if animation_player.current_animation != "Walk":
				animation_player.play("Walk")	
			velocity.x = direction.x * WALK_SPEED
			velocity.z = direction.z * WALK_SPEED
	else:
		if animation_player.current_animation != "Idle":
			animation_player.play("Idle")
		velocity.x = move_toward(velocity.x, 0, WALK_SPEED)
		velocity.z = move_toward(velocity.z, 0, WALK_SPEED)

	move_and_slide()
