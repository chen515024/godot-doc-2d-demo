extends CanvasLayer

signal start_game

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_message(msg) -> void:
	$Message.text = msg;
	$Message.show()
	$MessageTimer.start()

func show_gameover() -> void:
	show_message("Game Over!")
	await $MessageTimer.timeout
	
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	
	await get_tree().create_time(1.0).timeout
	$StartButton.show()

func update_score(score) -> void:
	$ScoreLabel.text = str(score);


func _on_start_button_pressed() -> void:
	$StartButton.hide()
	start_game.emit()
	pass # Replace with function body.


func _on_message_timer_timeout() -> void:
	$Message.hide()
	pass # Replace with function body.
