extends Sprite2D

var bullet = load("res://Scenes/bullet.tscn")
@export var pos = Vector2(self.position.x, self.position.y-48)
# Called when the node enters the scene tree for the first time.
func _ready():
	spawnstuffin()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnstuffin():
	var tween = get_tree().create_tween()
	await get_tree().create_timer(4).timeout
	var obj = bullet.instantiate()
	add_child(obj)
	tween.tween_property(bullet, "position", pos, 1)
