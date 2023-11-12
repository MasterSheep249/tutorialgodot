extends StaticBody2D

signal player_entered_gate

func _on_maingatearea_body_entered(body):
	player_entered_gate.emit()
	
