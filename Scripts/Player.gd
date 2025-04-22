extends CharacterBody2D

@export var friction = 400
@export var SPEED = 125.0
const KNOCKBACK = 200.0
const JUMP_VELOCITY = -350.0
var candie = true
var bounce = false
var health = 5
var cankill = true
var canmove = true
var ismoving = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 1000
var originalpos = Vector2(0,0)
func jump(delta):
	if not is_on_floor() and bounce == false:
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	



func movement(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if is_on_floor():
		if direction and canmove==true:
			velocity.x = direction * SPEED
			ismoving = true
		else:
			velocity.x = move_toward(velocity.x, 0, friction*delta)
			ismoving = false
	else:
		
		if direction and canmove==true:
			velocity.x = direction * SPEED*0.9
			ismoving = true
		else:
			velocity.x = move_toward(velocity.x, 0,friction*delta)
			ismoving = false
func _ready():
	originalpos = Vector2(position.x, position.y)
	Global.checkpoint_x = originalpos.x
	Global.checkpoint_y = originalpos.y
func _physics_process(delta):
	# Add the gravity.
	jump(delta)
	movement(delta)
	move_and_slide()
	update_health()
	
	if health < 1:
		die()

func update_health():
	get_parent().get_node("CanvasLayer/Hearts/TextureRect").size.x = health * 16
func die():
	Global.deathreason = "Ran out of health!"
	get_tree().change_scene_to_file("res://Scenes/die.tscn")
func teleport_but_lost_health_die():
	self.position = originalpos
	bounce = false
	velocity.y = 0
	health -= 1
	position.x = Global.checkpoint_x
	position.y = Global.checkpoint_y



func bounceoffenemy():
	bounce = true
	velocity.y = JUMP_VELOCITY
	bounce = false
	candie = false
	await get_tree().create_timer(0.1).timeout
	candie = true 
		
		





func knockback(enemy):
	canmove=false
	if enemy.position.x > position.x:
		velocity.x = KNOCKBACK * -1
	elif enemy.position.x < position.x:
		velocity.x = KNOCKBACK
	velocity.y = JUMP_VELOCITY
	# time until jump force and gravity force balances
	# multiply by to to count for falling
	var waittime = (JUMP_VELOCITY*-1)/gravity * 2
	await get_tree().create_timer(waittime).timeout
	canmove=true


func _on_void_body_entered(body):
	if body.is_in_group("Player"):
		teleport_but_lost_health_die()
