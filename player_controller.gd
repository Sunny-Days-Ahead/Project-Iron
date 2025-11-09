extends CharacterBody2D
#export Vars
@export var speed : float
@export var health = 3

#movement handler and dash
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("moveLeft","moveRight","moveUp","moveDown")
	velocity = direction * speed  
	move_and_slide()
	
	if Input.is_action_pressed("speedUpHold") == true:
		speed = 1200
	if Input.is_action_just_released("speedUpHold") == true:
		speed = 600

#
