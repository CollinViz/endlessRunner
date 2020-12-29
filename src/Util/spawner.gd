extends Node2D

export var TimeOutFloor:float = 1.0
export var TimeOutTop:float = 2.0
export (Array, PackedScene) var scenes
var random_scene = RandomNumberGenerator.new()
var selected_scene_index = 0

func _ready():
	$Timer.wait_time = TimeOutFloor
	$Timer.one_shot = true
	$Timer.start(TimeOutFloor)
	GameData.connect("killplayer",self,"player_deied")

func player_deied():
	$Timer.stop()
	

func _on_Timer_timeout():
	random_scene.randomize()
	selected_scene_index = random_scene.randi_range(0,scenes.size()-1)
	var tmp = scenes[selected_scene_index].instance()
	add_child_below_node(self,tmp)
	$Timer.start(random_scene.randf_range(TimeOutFloor,TimeOutTop))
