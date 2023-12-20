extends CharacterBody2D

var speed = 100
var player_state

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state= "idle"

	elif direction.x != 0 or direction.y !=0:
		player_state = "walking"
	
	velocity = direction * speed
	move_and_slide()
	
	play_animation(direction)

func play_animation(direction):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	if player_state == "walking":
		if direction.y == -1:
			$AnimatedSprite2D.play("n-walk")
		if direction.x == 1:
			$AnimatedSprite2D.play("e-walk")
		if direction.y == 1:
			$AnimatedSprite2D.play("s-walk")
		if direction.x == -1:
			$AnimatedSprite2D.play("w-walk")
		
		if direction.x > 0.5 and direction.y < -0.5:
			$AnimatedSprite2D.play("ne-walk")
		if direction.x > 0.5 and direction.y > 0.5:
			$AnimatedSprite2D.play("se-walk")
		if direction.x < -0.5 and direction.y > 0.5:
			$AnimatedSprite2D.play("sw-walk")
		if direction.x < -0.5 and direction.y < -0.5:
			$AnimatedSprite2D.play("nw-walk")

func player():
	pass
