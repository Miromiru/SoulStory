extends Node


func _ready():
	$HUD/GameOver.visible = false
	$HUD/SOULSRETRIEVE/CPUParticles2D.emitting = false
	$cave.play()
	pass # Replace with function body.


func gameover():
	$HUD/HP.visible = false
	$HUD/GameOver.visible = true
	pass

func take_soul():
	if $RigidBody2D.soulStatus == true:
		$HUD/SOULSRETRIEVE.visible = true
		$HUD/SOULSRETRIEVE/CPUParticles2D.emitting = true
		$HUD/Fade.play("fade")
		get_tree().call_group("soul", "queue_free")
		$cave.stop()


func _on_Timer_timeout():
	gameover()


func checkHP():
	if $RigidBody2D.hp == 2:
		$HUD/HP.play("2hearts")
	elif $RigidBody2D.hp == 1:
		$HUD/HP.play("1hearts")
		$Timer.start()
	elif $RigidBody2D.hp == 0:
		$HUD/HP.play("dead")


func _process(delta):
	checkHP()
	take_soul()
	pass
