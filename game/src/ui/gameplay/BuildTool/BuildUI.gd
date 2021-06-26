extends CanvasLayer
class_name BuildUI

#Have yet to add angel tower
enum TOWERTYPES {
	OBELISK = 0,
	FLYINGOBELISK = 1, 
	LIGHTNINGTOTEM = 2, 
	DEMONSTATUE = 3,
	MOONTOWER = 4,
	EYETOWER = 5
}

#Red Sprites
var redSprites : Array = [
	preload("res://assets/img/towers/pixelTowers/Obelisk_Full_version/Obelisk(Red Level 1).png"),
	preload("res://assets/img/towers/pixelTowers/FlyingObelisk_Full_v2/FlyingObelisk_no_lightnings_no_letter(Red).png"),
	preload("res://assets/img/towers/pixelTowers/LightningTotemFull/Totem_full-Sheet(Red).png"),
	preload("res://assets/img/towers/pixelTowers/Demon_Statue/Demon_Statue_red_sheet.png"),
	preload("res://assets/img/towers/pixelTowers/BloodMoonTower_full_version/RedMoonTower_free_idle_animation..png"),
	preload("res://assets/img/towers/pixelTowers/LoRTower_Full/EyeTower(Red Level 1).png")
]

var blueSprites : Array = [
	preload("res://assets/img/towers/pixelTowers/Obelisk_Full_version/Obelisk(Blue Level 1).png"),
	preload("res://assets/img/towers/pixelTowers/FlyingObelisk_Full_v2/FlyingObelisk_no_lightnings_no_letter.png"),
	preload("res://assets/img/towers/pixelTowers/LightningTotemFull/Totem_full-Sheet.png"),
	preload("res://assets/img/towers/pixelTowers/Demon_Statue/Demon_Statue_blue_sheet.png"),
	preload("res://assets/img/towers/pixelTowers/BloodMoonTower_full_version/RedMoonTower_free_idle_animation(Blue).png"),
	preload("res://assets/img/towers/pixelTowers/LoRTower_Full/EyeTower(Blue Level 1).png")
]


#Preload all the tower scenes to build
const RESOURCE : Array = ["res://src/environment/towers/pixelTowers/obelisk/Obelisk.tscn",
"res://src/environment/towers/pixelTowers/flyingObelisk/flyingObelisk.tscn",
"res://src/environment/towers/pixelTowers/lightningTotem/LightningTotem.tscn",
"res://src/environment/towers/pixelTowers/demonStatue/DemonStatue.tscn",
"res://src/environment/towers/pixelTowers/moonTower/MoonTower.tscn",
"res://src/environment/towers/pixelTowers/eyeTower/EyeTower.tscn"]

var bag_item = preload("res://src/items/otherItems/Axe.tscn").instance()
var emerald_staff = preload("res://src/items/otherItems/EmeraldStaff.tscn").instance()
onready var all_inventories_slots = get_node("VBoxContainer/PanelContainer/PanelContainer/HBoxContainer/GridContainer")


var isRed = true
var redTile = preload("res://assets/img/UI/Cartoon GUI/PNG/Item Slot/Cartoon RPG UI_Slot - Grade S.png")
var blueTile = preload("res://assets/img/UI/Cartoon GUI/PNG/Item Slot/Cartoon RPG UI_Slot - Grade C.png")


#if buildMode is not true, then it is in normal mode
var buildMode : bool = false
var build_UI_items_held : Dictionary = {
	"Slot1" : null,
	"Slot2" : null,
	"Slot3" : bag_item,
	"Slot4" : null,
	"Slot5" : null,
	"Slot6" : null,
	"Slot7" : emerald_staff,
	"Slot8" : null,
	"Slot9" : null,
	"Slot10" : bag_item
}



onready var tileSelector: TileSelector = find_parent("Map").get_node("Selector")
onready var currentMap = self.get_parent()



func _ready() -> void:
	get_tree().call_group("tower_builds", "change_visibility", false)
	print("ready being called")
	# for slot in inventorySlots.get_children():
		# slot.connect("gui_input", self, "slot_gui_input", [slot])

	
func _on_BuildMode_pressed():
	get_tree().call_group("tower_builds", "change_visibility", true)
	
	var tower_inventory = get_parent().get_node("TowerInventory")
	if (tower_inventory.is_visible == true):
		tower_inventory.toggle_tower_inventory_visible()
	buildMode = true

func _on_InspectMode_pressed():
	buildMode = false
	tileSelector.set_action(TileSelector.ACTION.INSPECTING, "smth")
	var tower_inventory = get_parent().get_node("TowerInventory")
	get_tree().call_group("tower_builds", "change_visibility", false)


func _on_ObeliskTower_pressed():
	if (buildMode):
		tileSelector.set_action(TileSelector.ACTION.BUILDING, RESOURCE[TOWERTYPES.OBELISK])
	pass


func _on_FlyingObelisk_pressed():
	if (buildMode):
		tileSelector.set_action(TileSelector.ACTION.BUILDING, RESOURCE[TOWERTYPES.FLYINGOBELISK])
	pass # Replace with function body.


func _on_LightningTotem_pressed():
	if (buildMode):
		tileSelector.set_action(TileSelector.ACTION.BUILDING, RESOURCE[TOWERTYPES.LIGHTNINGTOTEM])
	pass # Replace with function body.


func _on_DemonStatue_pressed():
	if (buildMode):
		tileSelector.set_action(TileSelector.ACTION.BUILDING, RESOURCE[TOWERTYPES.DEMONSTATUE])
	pass # Replace with function body.


func _on_MoonTower_pressed():
	if (buildMode):
		tileSelector.set_action(TileSelector.ACTION.BUILDING, RESOURCE[TOWERTYPES.MOONTOWER])
	pass # Replace with function body.


func _on_EyeTower_pressed():
	if (buildMode):
		tileSelector.set_action(TileSelector.ACTION.BUILDING, RESOURCE[TOWERTYPES.EYETOWER])
	pass # Replace with function body.

func _pick_up_item(item: Item) -> void:
	#Equip the item
	var slot
	for slots in build_UI_items_held:
		if (build_UI_items_held[slots] == null):
			slot = slots
			build_UI_items_held[slots] = item
			break

	#Get reference to the slot that an item was eqipped to update texture
	var current_slot = all_inventories_slots.get_node(slot).get_node("TextureRect")
	current_slot.texture = item.get_node("TextureRect").texture


func _on_TextureButton_pressed():
	isRed = not isRed
	_toggle_build_sprites_colors()


func _toggle_build_sprites_colors():
	print("toggle being called")
	var sceneTree = get_tree()
	var towers: Array = sceneTree.get_nodes_in_group("tower_builds")
	var temp = 0
	var sprite_used: Array = redSprites if isRed else blueSprites

	for towerIndex in range(towers.size()):
		var picture = sprite_used[towerIndex]
		towers[towerIndex].get_node("Sprite").texture = picture
