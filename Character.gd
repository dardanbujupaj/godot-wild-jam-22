extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("rest")
	pass # Replace with function body.


#Jump 
export var fallMultiplier = 2
export var lowJumpMultiplier = 10
export var jumpVelocity = 500 #Jump height
export var speed = 150 #movement left right
#Physics
var velocity = Vector2()
onready var gravity = 9.8

signal collect

func _physics_process(delta):	

	#Applying gravity to player
	velocity.y += gravity
	
	
	# set animation to walk/rest according to velocity
	if abs(velocity.x) > 0.01:
		$AnimationPlayer.play("walk")
	else:
		$AnimationPlayer.play("rest")
	
	#Jump Physics
	if velocity.y > 0: #Player is falling
		velocity += Vector2.UP * (-gravity) * (fallMultiplier) #Falling action is faster than jumping action
	elif velocity.y < 0 && Input.is_action_just_released('ui_up'): #Player is jumping 
		velocity += Vector2.UP * (-gravity) * (lowJumpMultiplier) #Jump Height depends on how long you will hold key

	if is_on_floor():
		if Input.is_action_just_pressed('ui_up'): 
			velocity = Vector2.UP * jumpVelocity #Normal Jump action

	velocity.x = speed * (Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left'))
	
	# flip character when walking left
	if velocity.x != 0:
		$sprite.scale.x = velocity.x / abs(velocity.x)
	
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

func _on_Player_body_entered(body):
	emit_signal("collect")
	body.hide()
