extends CanvasLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var settings_string = "res://src/ui/Menu/Settings.tscn"
var settings = preload("res://src/ui/Menu/Settings.tscn")
var setting_instance
var setting_present: bool = false
onready var arena = self.find_parent("Arena")

#Pause unpause node
func set_pause_node(node : Node, pause : bool) -> void:
	node.set_process(!pause)
	node.set_process_input(!pause)
	node.set_process_internal(!pause)
	node.set_process_unhandled_input(!pause)
	node.set_process_unhandled_key_input(!pause)
	node.set_physics_process(!pause)
	node.set_physics_process_internal(!pause)
	
#(Un)pauses a scene
#Ignored childs is an optional argument, that contains the path of nodes whose state must not be altered by the function
func set_pause_scene(rootNode : Node, pause : bool, ignoredChilds : PoolStringArray = [null]):
	set_pause_node(rootNode, pause)
	for node in rootNode.get_children():
		if not (String(node.get_path()) in ignoredChilds):
			set_pause_scene(node, pause, ignoredChilds)

func _input(event: InputEvent):
	if event is InputEventKey:
		if event.is_pressed() and event.is_action_pressed("Settings"):
			#Shud add a pause for the game here
			if ! setting_present:
				setting_instance = settings.instance()
				setting_instance._toggle_origin()
				self.add_child(setting_instance)
				setting_instance._toggle_reset_exit()
				setting_present = true
				self.set_pause_scene(arena, true)
				self.set_pause_node(setting_instance, false)
			elif setting_present:
				self.queue_free()
				self.set_pause_scene(arena, false)

