extends CanvasLayer


export var faded = false


func _process(delta):
	if faded == true:
		$Fade.stop()
	else:
		faded = false
