extends "ScrollMovement.gd"

func _physics_process(_delta):
	move()


func _on_obstacle_body_entered(body):	 
	if body.name == "player":
		queue_free()
		GameData.killPlayer()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
