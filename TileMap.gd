extends Node2D

var is_t: bool = false

func _physics_process(delta):
	var cur_tile_map
	var pas_tile_map
	
	if is_t:
		cur_tile_map = $TileMap
		pas_tile_map = $TileMap2
	else:
		cur_tile_map = $TileMap2
		pas_tile_map = $TileMap
	
	for x in range(0, 1000):
		for y in range(0, 1000):
			var cell = pas_tile_map.get_cell(x, y)
			
			if cell == 0: # Sand
				var lower_cell = pas_tile_map.get_cell(x, y + 1)
				
				if lower_cell == -1:
					cur_tile_map.set_cell(x, y + 1, 0)
				else:
					cur_tile_map.set_cell(x, y, 0)
			elif cell != -1: # Not sand
				cur_tile_map.set_cell(x, y, cell)
	
	is_t = !is_t
	pas_tile_map.clear()
