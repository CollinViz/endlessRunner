extends Node

export var scroll_speed = 5.0

func _ready():
	pass # Replace with function body.

func move():
	self.position.x-=scroll_speed
	
	if self.position.x<-6190:
		queue_free()
