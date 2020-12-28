extends Control

func _ready():
	GameData.connect("updateScore",self,"updateScore")
	GameData.connect("killplayer",self,"killplayer")
	$gameOver.visible=false
	
func updateScore(NewSore:int):
	$CenterContainer/scoreValue.text = String(NewSore)
	$AnimationPlayer.play("NewScore")

func killplayer():
	$gameOver.visible=true
	
func _on_Button_pressed():
	get_tree().reload_current_scene()
