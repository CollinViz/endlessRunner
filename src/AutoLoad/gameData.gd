extends Node2D
var Score = 0

signal killplayer
signal rewardplayer
signal updateScore
signal reset

func reset():
	Score =0
	emit_signal("updateScore",Score)
	emit_signal("reset")
	

func killPlayer():
	emit_signal("killplayer")

func AddScore(Points:int):
	emit_signal("rewardplayer",Points)
	Score+=Points	
	emit_signal("updateScore",Score)
