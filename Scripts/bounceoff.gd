extends Area2D
@export var distance_x:int
@export var distance_y:int

@export var duration = 5

func _ready():
	start_tween()

func start_tween():
	var firstpos = Vector2(self.position.x + distance_x, self.position.y + distance_y)
	var secondpos = Vector2(self.position.x, self.position.y)
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property(self, "position", firstpos, duration / 2)
	tween.tween_property(self, "position", secondpos, duration / 2)


func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_parent().get_parent().get_node("Player").bounceoffenemy()
		get_parent().call_deferred("queue_free")
