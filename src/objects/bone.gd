extends "ScrollMovement.gd"

func _physics_process(_delta):
	move()


func _on_PickUps_body_entered(body):
	if body.name == "player":
		GameData.AddScore(1)
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
