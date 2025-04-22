extends Area2D
@export var distance_x:int
@export var distance_y:int

@export var duration = 5
var left:bool
func _ready():
	flip()
	start_tween()

func start_tween():
	var firstpos = Vector2(self.position.x + distance_x, self.position.y + distance_y)
	var secondpos = Vector2(self.position.x, self.position.y)
	var tween = create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops().set_parallel(false)
	tween.tween_property(self, "position", firstpos, duration / 2)
	tween.tween_property(self, "position", secondpos, duration / 2)

	
func flip():
	while true:
		if distance_x > 0:
			var sprite = get_node("Sprite2D")
			sprite.flip_h = true
			left = false
			await get_tree().create_timer(duration/2).timeout
			sprite.flip_h = false
			left = true
			await get_tree().create_timer(duration/2).timeout
		else:
			var sprite = get_node("Sprite2D")
			sprite.flip_h = false
			left = false
			await get_tree().create_timer(duration/2).timeout
			sprite.flip_h = true
			left = true
			await get_tree().create_timer(duration/2).timeout

func _on_body_entered(body):
	if body.is_in_group("Player"):
		var player = get_parent().get_parent().get_node("Player")
		if player.candie == true:
			player.health -= 1
			player.knockback(self)
			player.cankill = false
			await get_tree().create_timer(0.1).timeout
			player.cankill = true
