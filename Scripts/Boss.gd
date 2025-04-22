extends CharacterBody2D




func _physics_process(delta):
	pass
func start_fight():
	var bossdialogue = get_parent().get_node("CanvasLayer/BossDialogue")
	get_tree().create_timer(1)
	bossdialogue.show()
