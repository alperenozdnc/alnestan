extends CharacterBody3D

var can_move : bool = true
var has_gravity : bool = true
var can_jump : bool = true
var can_sprint : bool = false

var look_speed : float = 0.002
var base_speed : float = 7.0
var jump_velocity : float = 4.5
var sprint_speed : float = 10.0

var keys = {
	"left": "move_left",
	"right": "move_right",
	"forward": "move_forward",
	"back": "move_back",
	"jump": "ui_accept",
	"sprint": "sprint",
};

var mouse_captured: bool = false;
var look_rotation: Vector2;
var move_speed: float = 0.0;

@onready var head: Node3D = $Head
@onready var collider: CollisionShape3D = $Collider

func _ready() -> void:
	look_rotation.y = rotation.y
	look_rotation.x = head.rotation.x

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		capture_mouse()
	if Input.is_key_pressed(KEY_ESCAPE):
		release_mouse()
	
	if mouse_captured and event is InputEventMouseMotion:
		rotate_look(event.relative)
	
func _physics_process(delta: float) -> void:
	if has_gravity:
		if not is_on_floor():
			velocity += get_gravity() * delta

	if can_jump:
		if Input.is_action_just_pressed(keys["jump"]) and is_on_floor():
			velocity.y = jump_velocity

	if can_sprint and Input.is_action_pressed(keys["sprint"]):
			move_speed = sprint_speed
	else:
		move_speed = base_speed

	if can_move:
		var input_dir := Input.get_vector(
			keys["left"],
			keys["right"],
			keys["forward"],
			keys["back"])

		var move_dir := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

		if move_dir:
			velocity.x = move_dir.x * move_speed
			velocity.z = move_dir.z * move_speed
		else:
			velocity.x = move_toward(velocity.x, 0, move_speed)
			velocity.z = move_toward(velocity.z, 0, move_speed)
	else:
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func rotate_look(rot_input : Vector2):
	look_rotation.x -= rot_input.y * look_speed
	look_rotation.x = clamp(look_rotation.x, deg_to_rad(-85), deg_to_rad(85))
	look_rotation.y -= rot_input.x * look_speed

	transform.basis = Basis()
	rotate_y(look_rotation.y)

	head.transform.basis = Basis()
	head.rotate_x(look_rotation.x)

func capture_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	mouse_captured = true

func release_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	mouse_captured = false

