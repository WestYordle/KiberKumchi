extends CharacterBody2D


const SPEED = 250.0

var can_blink = false

@onready var anim = $AnimatedSprite2D
@onready var timer = $Timer
@onready var animator = $AnimationPlayer

func _ready() -> void:
	
	Signals.connect("die", Callable(self, "_on_die"))
	Signals.connect("camera", Callable(self, "_on_camera"))
	Signals.connect("item", Callable(self, "_on_item"))
	
func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("light_up") and timer.is_stopped() and can_blink:
		timer.start()
		can_blink = false
		animator.play("light_blink")
		Signals.emit_signal("light_up",position.x,position.y)
	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if self.is_on_wall():
			anim.play("idle")
		else:
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

func _on_item(name):
	can_blink = true
