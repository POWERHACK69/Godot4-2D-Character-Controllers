extends CharacterBody2D

# Royal attributes
@export var speed = 300  # The speed of travelling to the next tile
@export var grid_size = 64  # The dimensions of each square in your land
var target_position = Vector2.ZERO  # Where our hero is headed
var moving = false  # A flag to check if the hero is engaged in motion

func _ready():
	# Start the target at the current location
	target_position = position  
	
func _physics_process(delta):
	if not moving:
		var direction = Vector2.ZERO
		# The calls of the cardinal directions
		if Input.is_action_just_pressed('ui_right'):
			direction = Vector2.RIGHT
		elif Input.is_action_just_pressed('ui_left'):
			direction = Vector2.LEFT
		elif Input.is_action_just_pressed('ui_down'):
			direction = Vector2.DOWN
		elif Input.is_action_just_pressed('ui_up'):
			direction = Vector2.UP
			
		if direction != Vector2.ZERO:
			# Update the target position based on the direction and grid size
			target_position += direction * grid_size
			moving = true
			
	if moving:
		# Move the character towards the target position
		position = position.move_toward(target_position, speed * delta)
		# Check if we are close enough to our target to snap and stop
		if position.distance_to(target_position) < speed * delta:
			position = target_position
			moving = false
