extends KinematicBody2D

var velocity = Vector2.ZERO

export var jump_velocity = 1500.0
export var gravity_scale = 20.0

onready var animation = $AnimatedSprite
onready var jump_sound = $jump
onready var reward_sound = $reward
onready var death_sound = $death


var can_jump: bool = true

func _ready():
	GameData.reset()
 
# warning-ignore:return_value_discarded
	GameData.connect("killplayer",self,"kill_player")
	GameData.connect("rewardplayer",self,"rewardplayer")
	animation.play("run")

func rewardplayer(_numPoints):
	reward_sound.play()
	
func _physics_process(delta):
	velocity.y += gravity_scale	
	var _x = move_and_collide(velocity*delta)
		
func _input(event):
	velocity = Vector2.ZERO
	if can_jump && event.is_action_pressed("jump"):
		velocity.y-=jump_velocity
		animation.play("Jump")
		jump_sound.play()


func _on_Area2D_body_entered(body):
	print(body)
	if body is StaticBody2D:
		can_jump = true
		animation.play("run")


func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		print("Left")
		can_jump = false

func kill_player():
	death_sound.play()
	yield(death_sound,"finished")
	#play death animation
	queue_free()
