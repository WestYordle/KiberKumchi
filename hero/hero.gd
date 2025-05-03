extends CharacterBody2D


const SPEED = 250.0

@onready var anim = $AnimatedSprite2D
 
func _ready() -> void:
	Signals.connect("die", Callable(self, "_on_die"))
	Signals.connect("camera", Callable(self, "_on_camera"))
	
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
	elif direction == 1:
		$AnimatedSprite2D.flip_h = true
	move_and_slide()

func _on_camera(left, right):
	$Camera2D.limit_left = left
	$Camera2D.limit_right = right
