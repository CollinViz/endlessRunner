extends KinematicBody2D


export var jump_velocity = 3500.0
export var gravity_scale = 20.0

onready var animation = $AnimatedSprite

var velocity: Vector2 = Vector2.ZERO
const FLOOR_NORMAL = Vector2(0, -1)

func _ready():
	animation.play("run")

func _physics_process(delta):
	velocity.y += gravity_scale	
	move_and_slide(velocity*delta,FLOOR_NORMAL)
	if is_on_floor() && animation.animation !="run":
		animation.play("run")
		
func _input(event):
	velocity = Vector2.ZERO
	if event.is_action_pressed("jump"):
		
		if is_on_floor():
			
			velocity.y-=jump_velocity
			animation.play("Jump")
			animation.frame=0
 
