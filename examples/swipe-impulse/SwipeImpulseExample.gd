extends Node2D

var sliding_object

func get_object(point):
	var selected
	for o in get_node('Points').get_children():
		if o.has(point):
			selected = o
	return selected

func _on_SwipeDetector_swipe_started( point ):
	sliding_object = get_object(point)
	if sliding_object:
		print('We have a sliding object on: ', sliding_object.get_pos())


func _on_SwipeDetector_swipe_ended( gesture ):
	if sliding_object:
		var angle = gesture.first_point().angle_to_point(gesture.last_point())
		sliding_object.impulse(gesture.get_speed(), angle) 
		sliding_object = null
