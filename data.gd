@tool
extends Node

const card_data_resource_path = "res://card_data.tres"
const language_data_resource_path = "res://language_data.tres"

const card_data = preload(card_data_resource_path)
const language_data = preload(language_data_resource_path)

const card_data_json_path = "res://data/mush/latest/MiniGameCardInfo.json"
const language_data_json_path = "res://data/language/USen_full_unicode.json"


func update_resource(resource_path, json_path):
	if FileAccess.file_exists(json_path):
		var file = FileAccess.open(json_path, FileAccess.READ)
		var content_as_text = file.get_as_text()
		var json = JSON.new()
		var error = json.parse(content_as_text)
		if error == OK:
			ResourceSaver.save(json, resource_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	update_resource(card_data_resource_path, card_data_json_path)
	update_resource(language_data_resource_path, language_data_json_path)
	
func get_card_name(key):
	if language_data.data["CommonMsg/MiniGame/MiniGameCardName"].has(key):
		return language_data.data["CommonMsg/MiniGame/MiniGameCardName"][key]
	return "Unknown"

func get_card_data(id):
	if id >= card_data.data.size():
		id = 0
	return card_data.data[id]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
