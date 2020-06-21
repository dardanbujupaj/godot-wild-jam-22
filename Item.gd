extends Area2D

signal collect

const sounds = [
	preload("res://audio/EAT_Chew_3_Times_mono.wav"),
	preload("res://audio/EAT_Cookie_Bite_mono.wav"),
	preload("res://audio/EAT_Cookie_Chew_3_Times_mono.wav")
]

var direction

var collected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	rotation += randf()
	
	if randf() > 0.5:
		direction = -1
	else:
		direction = 1
	
	$AudioStreamPlayer2D.stream = sounds[rand_range(0, len(sounds))]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(direction * delta)

func _on_Item_body_entered(body):	
	
	if body.get_name() == 'Character' and !collected:
		collected = true
		emit_signal("collect")
		hide()
		$AudioStreamPlayer2D.play()
		
		# wait for sound to end before freeing the node
		yield($AudioStreamPlayer2D, "finished")
		queue_free() # delete

