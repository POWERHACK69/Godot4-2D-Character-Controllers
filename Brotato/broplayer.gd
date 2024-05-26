extends CharacterBody2D


# Cache references to the weapon pivot and weapon sprite for easy access
@onready var weapon_pivot = $WeaponPivot
@onready var weapon_sprite = $WeaponPivot/GunSprite2D

# Exported variables for movement speed and direction speed
@export var movement_speed = 300.0
@export var direction_speed = 1.2

# Function called every physics frame to update the character's movement
func _physics_process(delta):
	# Calculate the direction to the mouse cursor
	var mouse_direction: Vector2 = (get_global_mouse_position() - global_position).normalized()
	
	# Get the input direction from the player
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		# If there is an input direction, set the velocity based on it and movement speed
		velocity = direction * movement_speed
	else:
		# If no input direction, gradually reduce the velocity to zero
		velocity.x = move_toward(velocity.x, 0, movement_speed)
		velocity.y = move_toward(velocity.y, 0, movement_speed)
		
	# Flip the character and weapon sprite based on the mouse position
	if mouse_direction.x > 0 and $Sprite2D.flip_h:
		$Sprite2D.flip_h = false
		weapon_sprite.flip_v = false
	elif mouse_direction.x < 0 and !$Sprite2D.flip_h:
		$Sprite2D.flip_h = true
		weapon_sprite.flip_v = true
		
	# Move the character and handle collisions
	move_and_slide()
	
	# Make the weapon pivot point look at the mouse cursor
	weapon_pivot.look_at(get_global_mouse_position())
