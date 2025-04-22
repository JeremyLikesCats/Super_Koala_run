extends Area2D
@export var firstpos = Vector2(self.position.x + 125, self.position.y)
@export var secondpos = Vector2(self.position.x, self.position.y)
@export var duration = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	start_tween()
	

func start_tween():
	var tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)

	tween.tween_property(self, "position", secondpos, duration / 2)
	

	tween.tween_property(self, "position", firstpos, duration / 2)
	
