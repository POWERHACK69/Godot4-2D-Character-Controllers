extends CharacterBody2D

# Exported variable that determines the movement speed with a default value of 200, 
@export var speed := 200 

var target := Vector2.ZERO  # Variable 'target' initialized to Vector2.ZERO

func _ready():
	# Set the initial target position to the character's current global position
	target = global_position  

func _input(event):
	# If the left mouse button is pressed, set the target to the mouse position
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		target = event.position  
		

func _physics_process(delta):
	# Calculate the velocity towards the target position at the specified speed
	velocity = position.direction_to(target) * speed  
	
	# look_at(target)  # (Optional) Rotate the character to face the target position
	
	# If the character is more than 10 units away from the target
	if position.distance_to(target) > 10: 
		move_and_slide()  # Move the character towards the target position
		
