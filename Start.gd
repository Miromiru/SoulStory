extends Node2D

signal Startuj

func _ready():
	$StartScreen.play()
	$startMusic.play()
	preload("res://Main.tscn")

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			print(event)
			emit_signal("Startuj")

func start():
		get_tree().change_scene("res://Main.tscn")


func _on_Node2D_Startuj():
	if $StartScreen.frame == 4:
		start()
