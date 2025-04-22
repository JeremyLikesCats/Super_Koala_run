extends RichTextLabel

var eedi = false
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_2_body_entered(body):
	if body.is_in_group("Player") and eedi == false:
		hide()
		get_parent().get_node("RichTextLabel3").show()
		eedi = true
