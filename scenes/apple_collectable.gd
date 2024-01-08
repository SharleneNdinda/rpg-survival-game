extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	fall_from_tree()

func fall_from_tree():
	$AnimationPlayer.play("apple_fall")

	await get_tree().create_timer(1.5).timeout # let the apple lay on the ground for a while
	$AnimationPlayer.play("apple_fade")
	print("+1 timer")

	await get_tree().create_timer(0.3).timeout
	queue_free()
	
