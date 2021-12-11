extends RigidBody2D

export var hp = 1

func die():	
	$AnimatedSprite.play("die")
	$CollisionShape2D.disabled = true
	hp = 0
	
func onHit():
	die()
