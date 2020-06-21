extends Node2D

const sounds = [
	preload("res://audio/BATTLE_Medieval_Reinact_Footsoldiers_Knights_01_loop_stereo.wav"),
	preload("res://audio/BATTLE_Medieval_Reinact_Footsoldiers_Knights_02_loop_stereo.wav"),
	preload("res://audio/BATTLE_Medieval_Reinact_Footsoldiers_Knights_03_loop_stereo.wav"),
	preload("res://audio/BATTLE_Medieval_Reinact_Footsoldiers_Knights_04_loop_stereo.wav")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for child in $Collectibles.get_children():
		child.connect("collect" ,$GUI/MarginContainer/BaguetteCount, "_on_Coin_collect")
	
	$AudioStreamPlayer.connect("finished", self, "_on_audio_finished")

func _on_audio_finished():
	$AudioStreamPlayer.stream = sounds[rand_range(0, len(sounds))]
	$AudioStreamPlayer.play(0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
