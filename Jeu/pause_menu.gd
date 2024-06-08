extends Control




func _ready():
	$AnimationPlayer.play("RESET")
	#$PanelContainer/VBoxContainer/Resume.pressed.connect(resume)

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")
	
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
		$PanelContainer/VBoxContainer/Resume.disabled = false
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()

func _on_resume_pressed():
	resume()


func _on_main_menu_pressed():
	pass # Replace with function body.


func _on_settings_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()

func _process(delta):
	testEsc()
