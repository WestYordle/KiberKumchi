extends CharacterBody2D

var start
var end
var player 
var direction = 1
var SPEED = 200

func _ready() -> void:
	Signals.connect("wall", Callable(self, "_on_wall"))
	Signals.connect("light_up",Callable(self,"_on_light_up"))
	
func _physics_process(_delta: float) -> void:
	velocity.x = direction * SPEED
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
		#$PointLight2DRight.visible = false
		#$PointLight2DLeft.visible = true
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false
		#$PointLight2DRight.visible = true
		#$PointLight2DLeft.visible = false
	move_and_slide()

func _on_player_position_update(player_pos):
	player = player_pos
	
func move_state_left():
	direction = (self.position * -1).normalized()
	velocity.x = direction.x * 160

func attack_state_left():
	direction = (self.position * -1).normalized()
	velocity.x = direction.x * 320


func _on_wall():
	if direction == 1:
		$Area2D.rotation_degrees = 180
	else:
		$Area2D.rotation_degrees = 0
	direction *= -1
	SPEED = 200

func _on_light_up(posX, _posY):
	if position.x > posX:
		direction = 1
	else:
		direction = -1

func _on_area_2d_body_entered(_body: Node2D) -> void:
	SPEED = 400

func _on_area_2d_2_body_entered(_body: Node2D) -> void:
	Signals.emit_signal("die")
	print("FFFFFFFF")
	SPEED = 0
