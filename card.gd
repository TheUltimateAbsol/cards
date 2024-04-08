@tool

extends Node2D

var data:Dictionary = {}
var card_name:String = ""
var color

const NORMAL_BG_1 = preload("res://Game Assets/MngCardBG_Cmn_00.png")
const NORMAL_BG_2 = preload("res://Game Assets/MngCardBG_Cmn_01.png")
const RARE_BG_1 = preload("res://Game Assets/MngCardBG_Rre_00.png")
const RARE_BG_2 = preload("res://Game Assets/MngCardBG_Rre_01.png")
const FRESH_BG_1 = preload("res://Game Assets/MngCardBG_Frh_00.png")
const FRESH_BG_2 = preload("res://Game Assets/MngCardBG_Frh_01.png")


@export var id: int = 0 :
	set(value):
		var toset = value
		if value >= Data.card_data.data.size() or value < 0:
			toset = 0
		id = toset
		update()
		
func update():
	data = Data.get_card_data(id)
	card_name = Data.get_card_name(data["Name"])
	print(card_name)
	$Character.texture = load("res://minigame/card/" + data["Name"] + ".png")
	$Name.text = card_name
	if data["Rarity"] == "Common":
		$Background.texture = NORMAL_BG_1
		$CommonText.show()
		$RareText.hide()
		$FreshText.hide()
	if data["Rarity"] == "Rare":
		$Background.texture = RARE_BG_1
		$CommonText.hide()
		$RareText.show()
		$FreshText.hide()
	if data["Rarity"] == "Fresh":
		$Background.texture = FRESH_BG_1
		$CommonText.hide()
		$RareText.hide()
		$FreshText.show()
	pass

#const OCTOLING_EDGES = preload("res://ui/VSPlayerIconOcta_00t.png")
#const OCTOLING_GLOW = preload("res://ui/VSPlayerIconOcta_01t.png")
#const OCTOLING_BACKGROUND = preload("res://ui/VSPlayerIconOcta_02t.png")
#const INKLING_EDGES = preload("res://ui/VSPlayerIconIka_00t.png")
#const INKLING_GLOW = preload("res://ui/VSPlayerIconIka_01t.png")
#const INKLING_BACKGROUND = preload("res://ui/VSPlayerIconIka_02t.png")

#@export var weapon: String = Weapons.WEAPONS[0]["name"] :
#	set(value):
#		var _weapon = Weapons.WEAPONS[0]["name"]
#		for w in Weapons.WEAPONS:
#			if w["name"] == value:
#				_weapon = w["name"]
#				break
#		$Weapon/Weapon.texture = Weapons.get_weapon_texture(_weapon)
#		$Weapon/Shadow.texture = Weapons.get_weapon_shadow(_weapon)
#		weapon = value


#@export var race: Races = Races.INKLING :
#	set(value):
#		match value:
#			Races.OCTOLING:
#				$Background/Background.texture = OCTOLING_BACKGROUND
#				$Background/BlackBackground.texture = OCTOLING_BACKGROUND
#				$Background/Rainbow.texture = OCTOLING_BACKGROUND
#				$Background/Glow.texture = OCTOLING_GLOW
#				$Background/Edges.texture = OCTOLING_EDGES
#			Races.INKLING:
#				$Background/Background.texture = INKLING_BACKGROUND
#				$Background/BlackBackground.texture = INKLING_BACKGROUND
#				$Background/Rainbow.texture = INKLING_BACKGROUND
#				$Background/Glow.texture = INKLING_GLOW
#				$Background/Edges.texture = INKLING_EDGES
#		race = value
#
#@export var state: States = States.NORMAL :
#	set(value):
#		match value:
#			States.NORMAL:
#				$Background/BlackBackground.hide()
#				$Background/Background.show()
#				$Background/Rainbow.hide()
#				$Background/Glow.show()
#				$Background/Edges.show()
#				$Weapon/Shadow.show()
#				$Weapon/Weapon.show()
#				$Weapon/Weapon.material.set("shader_parameter/enabled", 0.0)
#				$Death.hide()
#			States.DEAD:
#				$Background/BlackBackground.show()
#				$Background/Background.hide()
#				$Background/Rainbow.hide()
#				$Background/Glow.hide()
#				$Background/Edges.hide()
#				$Weapon/Shadow.hide()
#				$Weapon/Weapon.show()
#				$Weapon/Weapon.material.set("shader_parameter/enabled", 1.0)
#				$Death.show()
#			States.SPECIAL:
#				$Background/BlackBackground.hide()
#				$Background/Background.show()
#				$Background/Rainbow.show()
#				$Background/Glow.show()
#				$Background/Edges.show()
#				$Weapon/Shadow.show()
#				$Weapon/Weapon.show()
#				$Weapon/Weapon.material.set("shader_parameter/enabled", 0.0)				
#				$Death.hide()
#		state = value
		
#@export var color: Color = Color("#d227c0"):
#	set(value):
#		$Background.modulate = value
#		color = value
#
