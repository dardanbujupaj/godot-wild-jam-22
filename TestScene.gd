extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	for child in $Collectibles.get_children():
		child.connect("collect" ,$Character/Camera2D/BaguetteCount, "_on_Coin_collect")
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
