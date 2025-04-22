extends TileMap

const CoinScene := preload("res://Scenes/Coins.tscn")


func _ready():
	generate_objects_from_tiles()

func generate_objects_from_tiles():
	var coin = CoinScene.instance()
	coin.position = map_to_local(get_cell_atlas_coords(1,Vector2i(6,6))) 
	get_parent().call_deferred("add_child", coin)
	queue_free()
