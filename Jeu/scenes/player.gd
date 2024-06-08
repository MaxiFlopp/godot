extends CharacterBody2D

var speed = 500.0
var going_left = false
@onready var sprite_2d = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if Input.is_action_pressed("run"):
		speed = 1300.0
	else:
		speed = 900.0
	pass

func _physics_process(delta):
	# Déterminer la direction du mouvement
	var direction = Input.get_axis("left", "right")

	# Si le personnage se déplace, mettre à jour l'animation et la direction
	if direction != 0:
		velocity.x = direction * speed
		sprite_2d.animation = "running"
		if direction < 0:
			sprite_2d.flip_h = true
			going_left = true
		else:
			sprite_2d.flip_h = false
			going_left = false
	else:
		velocity.x = move_toward(velocity.x, 0, 200)
		sprite_2d.animation = "idle"
		# Conserver la direction quand en idle
		sprite_2d.flip_h = going_left

	# Appliquer la gravité si nécessaire
	#if not is_on_floor():
	#	velocity.y += gravity * delta

	# Gérer le saut
	#if Input.is_action_just_pressed("jump") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	move_and_slide()
		
