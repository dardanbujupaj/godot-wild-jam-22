extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("hide gameover")
	$GameOver.hide()	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Character_gameover():
	print("show gameover")
	$GameOver.show()


func _on_Button_button_down():
	get_tree().change_scene("res://TestScene.tscn")
