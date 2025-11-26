extends CharacterBody2D


# 使用60的倍数，确保在60FPS下每帧移动整数像素
const SPEED : float = 60.0
const JUMP_VELOCITY : float = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer = $JumpSound

func _physics_process(delta: float) -> void:
	
	# 重力应用
	if not is_on_floor():
		velocity += get_gravity() * delta

	# 跳跃处理
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump_sound.play()
		velocity.y = JUMP_VELOCITY

	# 输入方向
	var direction := Input.get_axis("move_left", "move_right")
	
	# 动画方向
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	# 动画状态
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
		
	# 水平移动
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
