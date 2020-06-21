extends Area2D

signal collect

var direction
# Called when the node enters the scene tree for the first time.
func _ready():
	rotation += randf()
	if randf() > 0.5:
		direction = -1
	else:
		direction = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate(direction * delta)

func _on_Item_body_entered(body):	
	
	if body.get_name() == 'Character':
		print('emit signal')		
		emit_signal("collect")		
		hide()
		$AudioStreamPlayer2D.play()
		yield($AudioStreamPlayer2D, "finished")
		queue_free() # delete
		print('free')

