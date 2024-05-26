extends CharacterBody2D

@export var speed = 400  # The speed at which the character moves
@export var rotation_speed = 2.0  # The speed at which the character rotates

var rotation_direction = 0  # Variable to store the direction of rotation

# Function to get input from the player
func get_input():
	# Get the rotation direction based on input
	rotation_direction = Input.get_axis("ui_left", "ui_right")
	# Calculate the velocity based on input and speed
	velocity = transform.x * Input.get_axis("ui_down", "ui_up") * speed
	
# Function called every physics frame to update the character's movement
func _physics_process(delta):
	get_input()  # Get the player input
	# Update the rotation based on the rotation direction and speed
	rotation += rotation_direction * rotation_speed * delta
	# Move the character based on the calculated velocity
	move_and_slide()
