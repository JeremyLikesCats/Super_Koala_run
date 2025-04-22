extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_goal_body_entered(body):
	if body.is_in_group("Player"):
		show()
