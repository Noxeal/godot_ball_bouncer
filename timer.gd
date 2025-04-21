extends Timer

@onready var label: Label = $"../Label"
signal timer_ended()

func _process(delta: float) -> void:
	label.text = "Time left : " + str(time_left)

func _on_timeout() -> void:
	print("Fin du timer")
	emit_signal("timer_ended")
	
