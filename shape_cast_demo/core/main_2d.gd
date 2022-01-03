extends Node3D


func _physics_process(delta):
	$Debug.text = ""
	
	var s: ShapeCast2D = $ShapeCast2D
	
	$Debug.text += "Colliding: %s\n" % s.is_colliding()
	if s.is_colliding():
		for i in s.get_collision_count():
			$Debug.text += "Collider: %s\n" % s.get_collider(i)
			$Debug.text += "Collision normal: %s\n" % s.get_collision_normal(i)

		$Debug.text += "\n"

		$Debug.text += "Closest Collider: %s\n" % s.get_closest_collider()
		$Debug.text += "Collision Safe fraction: %s\n" % s.get_closest_collision_safe_fraction()
		$Debug.text += "Collision Unsafe fraction: %s\n" % s.get_closest_collision_unsafe_fraction()
		
	update()


func _draw():
	draw_set_transform($ShapeCast2D.global_position)
	draw_line(Vector2(), $ShapeCast2D.target_position, Color.RED, 2)


func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			$ShapeCast2D.global_position = get_global_mouse_position()
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			$ShapeCast2D.target_position = get_global_mouse_position() - $ShapeCast2D.global_position
