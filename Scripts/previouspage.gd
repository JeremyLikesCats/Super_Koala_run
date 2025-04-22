extends TextureButton

@onready var camera = get_parent().get_parent().get_parent().get_node("Camera2D")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var startingpos = camera.position
	var tween = get_tree().create_tween()
	tween.tween_property(camera,"position",Vector2(startingpos.x - 1920,startingpos.y),0.2).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
