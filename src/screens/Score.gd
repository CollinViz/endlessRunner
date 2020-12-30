extends Control
var err = 0
var http = HTTPClient.new() # Create the Client.
onready var httpLable = $gameOver/httpObj

func _ready():
	GameData.connect("updateScore",self,"updateScore")
	GameData.connect("killplayer",self,"killplayer")
	$gameOver.visible=false
	err = http.connect_to_host("www.gogogames.co.za", 443,true)
	while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
		http.poll()
		print("Connecting...")
		OS.delay_msec(500)
	
func updateScore(NewSore:int):
	$CenterContainer/scoreValue.text = String(NewSore)
	$AnimationPlayer.play("NewScore")

func killplayer():
	$gameOver.visible=true
	httpLable.text = "HTTP Status " + String(http.get_status())
	
func _on_Button_pressed():
	get_tree().reload_current_scene()


func _on_SendFeedback_pressed():
	
	var fields = {"gamename" : "EndlessRunner", "userid" : "1234567","info":"This is hello from godot with HTTPS"}
	var query_string = http.query_string_from_dict(fields)
	var headers = ["Accept: */*","User-Agent: Pirulo/1.0 (Godot)","Content-Type: application/x-www-form-urlencoded", "Content-Length: " + str(query_string.length())]	 
	 
	 
	print("HTTP Status ",http.get_status())
	err = http.request(HTTPClient.METHOD_POST, "/feedback.php", headers,query_string)  
	httpLable.text = "HTTP Status " + String(http.get_status() )+ " ERR " + String(err)
	
