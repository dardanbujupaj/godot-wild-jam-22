extends KinematicBody2D

#Jump 
var fallMultiplier = 2
var lowJumpMultiplier = 10
var jumpVelocity = 500 #Jump height
var speed = 400 #movement left right
#Physics
var velocity = Vector2()
onready var gravity = 9.8

const DEATHTIME = 2.0
var deathcnt = DEATHTIME
signal gameover
var isGameover = false

var spriteScale

# Called when the node enters the scene tree for the first time.
func _ready():
	spriteScale = $sprite.scale.x



func _physics_process(delta):	

	#Applying gravity to player
	velocity.y += gravity
	
	
	# set animation to walk/rest according to velocity
	if abs(velocity.x) > 0.01:
		$sprite.play("walk")
	else:
		$sprite.play("default")
	
	#Jump Physics
	if velocity.y > 0: #Player is falling
		deathcnt -= delta
		velocity += Vector2.UP * (-gravity) * (fallMultiplier) #Falling action is faster than jumping action
	elif velocity.y < 0 && Input.is_action_just_released('ui_up'): #Player is jumping 
		velocity += Vector2.UP * (-gravity) * (lowJumpMultiplier) #Jump Height depends on how long you will hold key

	if is_on_floor():
		deathcnt = DEATHTIME
		if Input.is_action_just_pressed('ui_up'): 
			velocity = Vector2.UP * jumpVelocity #Normal Jump action

	velocity.x = speed * (Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left'))
	
	# flip character when walking left
	if velocity.x != 0:
		$sprite.scale.x = spriteScale * velocity.x / abs(velocity.x)
	
	if deathcnt <= 0 and !isGameover:
		isGameover = true
		print("gameOver")
		emit_signal("gameover")
		
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

