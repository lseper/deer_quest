extends Actor

class_name Player

# moving right initially
var _moving_direction := 1.0
var _player_class := 1

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		_velocity.y += gravity * delta
	perform_action()
	_velocity = move_and_slide(get_move_velocity(_velocity), FLOOR_NORMAL)

func get_move_velocity(
	curr_velocity: Vector2
) -> Vector2:
	var out := curr_velocity
	set_direction()
	out.x = speed * _moving_direction
	return out
	
func set_direction() -> void:
	if Input.is_action_just_pressed("move_left"):
		_moving_direction = -1.0
	elif Input.is_action_just_pressed("move_right"):
		_moving_direction = 1.0
		
func perform_action() -> void:
	if _player_class == 1:
		# jump
		if Input.is_action_just_pressed("action") and is_on_floor():
			_velocity.y = -100
			
