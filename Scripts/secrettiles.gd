extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		while modulate.a > 0.4:
			modulate.a -= 0.9 * get_process_delta_time()
			await get_tree().create_timer(get_process_delta_time()).timeout



func _on_area_2d_body_exited(body):
	while modulate.a < 1:
			modulate.a += 0.9 * get_process_delta_time()
			await get_tree().create_timer(get_process_delta_time()).timeout
