extends CharacterBody2D

@export var speed: int= 40
@onready var animations= $AnimationPlayer

var currentHealth: int=3

func handleInput():
	
	var moveDirection= Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity= moveDirection* speed
	
func updateAnimation ():
	if velocity.length() == 0:
	
		animations.stop()
	else: 
		var direction= "Down"
		if velocity.x <0: direction= "Left"
		elif velocity.x >0: direction= "Right"
		elif velocity.y<0: direction= "Up"
		
		animations.play("walk"+direction)
	
	
func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()


func _on_hurt_box_area_entered(area):
	if area.name == "hitBox":
		print_debug(area.get_parent().name)
