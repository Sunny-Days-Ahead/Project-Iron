extends Node
class_name StateMachine

#defines initialState as a state
@export var initialState : State

#Variables
var currentState : State
var states: Dictionary = {}

func _ready() -> void:
#for every child i have, create a dictionary key named whatever the node is named and connect
#it's signal to the transition function
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(onChildTransition)

#if you set an inital state, run it's enter and set it as the current state
	if initialState:
		initialState.enter()
		currentState = initialState

#process runs every frame, run state.update() for the current state every frame
func _process(delta: float) -> void:
	if currentState:
		currentState.update(delta)

#Same as above but for PHYSX, the if in both is to keep it from crashing if there isn't a state!
func _physics_process(delta: float) -> void:
	if currentState:
		currentState.physicsUpdate(delta)

#
func onChildTransition(state, new_state_name):
	if state != currentState:
		return

	var newState = states.get(new_state_name.to_lower())
	if !newState:
		return

	if currentState:
		currentState.exit()

	newState.enter()
	currentState = newState
