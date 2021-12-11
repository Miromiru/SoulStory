extends KinematicBody2D

export (int) var run_speed = 200
export (int) var jump_speed = -740
export (int) var gravity = 1100

var velocity = Vector2()
var jumping = false
export var hp  = 3 setget hp_set
var soul = false
var soulStatus = false

func hp_set(new_value):
	hp -= new_value

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))


func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')
	var attack = Input.is_action_pressed("ui_attack")
	var take = Input.is_action_just_pressed("ui_take")
	
	if right:
		velocity.x += run_speed
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = false
		$Area2D.set_rotation(0)
	elif left:
		velocity.x -= run_speed
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = true
		$Area2D.set_rotation(-160)
	elif attack:
		$AnimatedSprite.animation = "attack"
		$Area2D/CollisionShape2D2.disabled = false
		return
	else:
		$AnimatedSprite.animation = "iddle"
		$Area2D/CollisionShape2D2.disabled = true
		
	if not is_on_floor():
		$AnimatedSprite.animation = "jump"

	if jump and is_on_floor():
		velocity.y = jump_speed	
		
	if take and soul == true:
		soulStatus = true


func _on_Area2D_body_entered(body):
	if body.is_in_group("bat"):
		body.onHit()


func _on_Area2D2_body_entered(body):
	if body.is_in_group("enemy") and body.hp == 1:
		hp_set(1)


func _on_Area2D2_area_entered(area):
	if area.is_in_group("soul"):
		soul = true

func _on_Area2D2_area_exited(area):
	if area.is_in_group("soul"):
		soul = false
