extends Node3D


func _physics_process(delta):
	$Debug.text = ""
	
	var s: ShapeCast3D = $ShapeCast3D
	
	$Debug.text += "Colliding: %s\n" % s.is_colliding()
	if s.is_colliding():
		for i in s.get_collision_count():
			$Debug.text += "Collider: %s\n" % s.get_collider(i)
			$Debug.text += "Collision normal: %s\n" % s.get_collision_normal(i)

		$Debug.text += "\n"

		$Debug.text += "Closest Collider: %s\n" % s.get_closest_collider()
		$Debug.text += "Collision Safe fraction: %s\n" % s.get_closest_collision_safe_fraction()
		$Debug.text += "Collision Unsafe fraction: %s\n" % s.get_closest_collision_unsafe_fraction()
	force_update_transform()


func _draw():
	set_transform($ShapeCast3D.global_position)
#	draw_line(Vector2(), $ShapeCast3D.target_position, Color.RED, 2)


func _input(event):
	pass
#	if event is InputEventMouseButton and event.pressed:
#		if event.button_index == MOUSE_BUTTON_LEFT:
#			$ShapeCast3D.global_position = get_global_mouse_position()
#		elif event.button_index == MOUSE_BUTTON_RIGHT:
#			$ShapeCast3D.target_position = get_global_mouse_position() - $ShapeCast3D.global_position
