extends RichTextLabel

var eedi = false
# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if eedi == true:
		hide()
	
