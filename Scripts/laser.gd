extends RayCast2D
var laser_on = true
var player_in = false
@export var wait:int
@export var duration:int
@onready var beam_mesh = $Line2D

@onready var player = get_parent().get_parent().get_node("Player")
@onready var respawnlocation = get_parent().get_node("respawnlocation/location")
func _process(delta):
	var cast_point
	force_raycast_update()
	if is_colliding():
		cast_point = to_local(get_collision_point())
		beam_mesh.points[1] = cast_point
	if get_collider() == player:
		if laser_on == true:
			player.position.x = respawnlocation.position.x
			player.health -= 1
			await get_tree().create_timer(0.1).timeout

func _ready():
	await get_tree().create_timer(wait).timeout
	
	while true:
		laser_on = false
		set_visible(false)
		await get_tree().create_timer(duration).timeout
		laser_on = true
		set_visible(true)
		await get_tree().create_timer(duration).timeout

	
			

	

		
  # Replace with function body.
