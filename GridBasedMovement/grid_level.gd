extends Node2D


@export var cell_size = Vector2i(64, 64)  # Size of each cell in the grid

var astar_grid = AStarGrid2D.new()  # Create a new AStarGrid2D instance
var grid_size  # Variable to store the size of the grid

func _ready():
	# Initialize the grid when the node is ready
	initialize_grid()
	
func initialize_grid():
	# Calculate the grid size based on the viewport size and cell size
	grid_size = Vector2i(get_viewport_rect().size) / cell_size
	astar_grid.size = grid_size  # Set the size of the AStar grid
	astar_grid.cell_size = cell_size  # Set the cell size of the AStar grid
	astar_grid.offset = cell_size / 2  # Offset the grid cells for centering
	astar_grid.update()  # Update the AStar grid to apply the changes
	
func _draw():
	# Draw the grid on the screen
	draw_grid()


func draw_grid():
	# Draw vertical lines for the grid
	for x in grid_size.x + 1:
		draw_line(
			Vector2(x * cell_size.x, 0),  # Start point of the line
			Vector2(x * cell_size.x, grid_size.y * cell_size.y),  # End point of the line
			Color.DARK_GRAY,  # Color of the line
			2.0  # Thickness of the line
		)
	# Draw horizontal lines for the grid
	for y in grid_size.y + 1:
		draw_line(
			Vector2(0, y * cell_size.y),  # Start point of the line
			Vector2(grid_size.x * cell_size.x, y * cell_size.y),  # End point of the line
			Color.DARK_GRAY,  # Color of the line
			2.0  # Thickness of the line
		)

