extends Control

var repeaterTower = preload("res://src/Towers/RepeaterTower.tscn")

func _on_Button_pressed():
	print("Repeater Tower chosed for build target")
	self.get_parent().set_towerBuilder(repeaterTower)
