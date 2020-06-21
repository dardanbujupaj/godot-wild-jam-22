extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	for child in $Collectibles.get_children():
		child.connect("collect", $GUI/MarginContainer/BaguetteCount, "_on_Coin_collect")
	
	$GUI/MarginContainer/BaguetteCount/outOf.text = ("/ %d" % $Collectibles.get_child_count())
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
