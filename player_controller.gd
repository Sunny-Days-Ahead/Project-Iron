extends CharacterBody2D
#export Vars
@export var speed : float
@export var health = 3

#movement handler
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("moveLeft","moveRight","moveUp","moveDown")
	velocity = direction * speed 
	move_and_slide()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
