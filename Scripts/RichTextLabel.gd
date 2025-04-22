extends RichTextLabel

var eedi = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().get_parent().get_parent().get_node("Player").ismoving == true:
		self.text = "Use the arrow keys to move and space to jump! ✓"


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player") and eedi == false:
		hide()
		get_parent().get_node("RichTextLabel2").show()
		eedi = true
