extends CharacterBody2D

var startPosition
var endPosition

@export var moveSpeed : int= 15
@export var moveLimit : float= 0.1
@export var endPoint= Marker2D

@onready var animations= $AnimatedSprite2D 

func _ready() :
	startPosition= position
	endPosition= endPoint.global_position
	
func changeDirection():
	var tempEnd= endPosition
	endPosition= startPosition
	startPosition= tempEnd
	
func updateVelocity() :
	
	var moveDirection= endPosition- position
	
	if moveDirection.length() <moveLimit :
		position= endPosition
		changeDirection()
		
	velocity= moveDirection.normalized() *moveSpeed
	
func updateAnimation():
	var animationString= "walkUp"
	if velocity.y >0 :
		animationString= "walkDown"
		
	animations.play(animationString)
	
func _physics_process(delta) :
	updateVelocity()
	move_and_slide()
	updateAnimation()
