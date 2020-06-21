extends Label


signal all_found

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var value = 0
var outOf = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_Coin_collect():
	value = value + 1;
	print("update score to %d" % value)
	$Value.text = ("%d" % value)
	if value == outOf:
		emit_signal("all_found")
