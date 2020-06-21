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
	$GameOver/GameOverText.text = "Game Over"
	$GameOver/BaguettesText.text = "%s %s found" % [$MarginContainer/BaguetteCount/Value.text, $MarginContainer/BaguetteCount/outOf.text]
	$GameOver.show()
	get_tree().paused = true



func _input(event):
	if Input.is_key_pressed(KEY_SPACE) and $GameOver.is_visible_in_tree():
		restartGame()

func _on_Button_button_down():
	restartGame()


func restartGame():
	get_tree().paused = false
	get_tree().change_scene("res://TestScene.tscn")


func _on_Stair_body_entered(body):
	$GameOver/GameOverText.text = "Game Won"
	$GameOver/BaguettesText.text = "%s %s found" % [$MarginContainer/BaguetteCount/Value.text, $MarginContainer/BaguetteCount/outOf.text]
	$GameOver.show()
	get_tree().paused = true
