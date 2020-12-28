extends "ScrollMovement.gd"

func _physics_process(_delta):
	move()


func _on_PickUps_body_entered(body):
	if body.name == "player":
		GameData.AddScore(1)
		queue_free()
