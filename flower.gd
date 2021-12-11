extends RigidBody2D

export var hp = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("attackRay")
