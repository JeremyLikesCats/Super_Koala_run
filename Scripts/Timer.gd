extends Label
var bonus_time = 0
var time = 60
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Timer").start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time_left = time + bonus_time
	self.text = str(time_left)
	if time_left <= 0:
		Global.deathreason = "Ran out of time!"
		get_tree().change_scene_to_file("res://Scenes/die.tscn")
	Global.score = time_left


func _on_timer_timeout():
	time -=1
