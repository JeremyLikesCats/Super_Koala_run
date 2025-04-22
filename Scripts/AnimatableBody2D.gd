extends AnimatableBody2D
@export var distance_x:int
@export var distance_y:int

@export var duration = 5.0

func _ready():
	start_tween()

func start_tween():
	var firstpos = Vector2(self.position.x + distance_x, self.position.y + distance_y)
	var secondpos = Vector2(self.position.x, self.position.y)
	var tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property(self, "position", firstpos, duration / 2)
	tween.tween_property(self, "position", secondpos, duration / 2)
