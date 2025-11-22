extends CharacterBody2D

#export Vars
@export var speed : float = 600.0
@export var dash_speed : float = 1200.0
@export var ship : AnimatedSprite2D

signal PlayerDeath

var current_speed : float = 0
var direction : Vector2 = Vector2.ZERO

# _ready runs when the node is first spawned into the scene/added to the tree.
# Good for making sure our intial values make sense and other setup stuff
func _ready() -> void:
	current_speed = speed
	ship.animation = "Full"
	# If we forgot to set the dash speed export, this is the fallback
	if (dash_speed == 0):
		dash_speed = speed * 2
		
	# initialize the HealthComponent

	%HealthComponent.fullHeal()
	global_position = Vector2(161,479)
# _physics_process is where we put stuff that uses godot's physics system (it runs many times per frame).
func _physics_process(_delta: float) -> void:
	velocity = direction * current_speed
	move_and_slide()
	
# _process is where we put stuff that only needs to update once per frame.
# Held inputs are good here, enemy logic, spawning things, etc.
func _process(_delta: float) -> void:
	direction = Input.get_vector("moveLeft", "moveRight", "moveUp", "moveDown")
	
	if Input.is_action_pressed("shoot") == true:
		%BulletSpawn.try_spawn()
		%LaserSFX.playJitter()
	
#This is essentially check the current value of health if it's x match x with the corrosponding animation
	match %HealthComponent.currentHealth:
		4:
			ship.animation = "Full"
		3:
			ship.animation = "1DMG" 
		2:
			ship.animation = "2DMG"
		1:
			ship.animation = "3DMG"
			
			
# _input is run whenever we press or release a button.
# Good for rising and falling edge stuff, not so good for held buttons or joysticks (that's why I put that in process)
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("speedUpHold") == true:
		current_speed = dash_speed
		
	if event.is_action_released("speedUpHold") == true:
		current_speed = speed

func _on_health_component_died() -> void:
	PlayerDeath.emit()
	#print("Oh no i emitted a signal")
