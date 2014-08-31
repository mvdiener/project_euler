# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

# https://projecteuler.net/project/images/p015.gif

# How many such routes are there through a 20×20 grid?

def grid_logic(width, height, path_array=(Array.new(width+1) { Array.new(height+1) }) )
	coord_array = [0,0]
	return 0 if width == 0 || height == 0
	return path_array[width][height] if path_array[width][height]
	if coord_array[0] + 1 == width && coord_array[1] + 1 == height
		path_array[width][height] = 2
	elsif coord_array[0] + 1 == width
		path_array[width][height] = (1 + grid_logic(width, height - 1, path_array))
	elsif coord_array[1] + 1 == height
		path_array[width][height] = (1 + grid_logic(width - 1, height, path_array))
	else
		path_array[width][height] = (grid_logic(width, height - 1, path_array) +  grid_logic(width - 1, height, path_array))
	end
end

p grid_logic(20,20)