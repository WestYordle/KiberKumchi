extends CharacterBody2D


const SPEED = 250.0

@onready var anim = $AnimatedSprite2D
 
func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		anim.play("walking")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("idle")
	if direction == -1:
		$AnimatedSprite2D.flip_h = false
		$PointLight2DRight.visible = false
		$PointLight2DLeft.visible = true
	elif direction == 1:
		$AnimatedSprite2D.flip_h = true
		$PointLight2DRight.visible = true
		$PointLight2DLeft.visible = false
	move_and_slide()
