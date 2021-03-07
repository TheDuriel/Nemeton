extends Node


func _ready() -> void:
	yield(get_tree(), "idle_frame")
	StoryInterpreter.start_story("res://Game/Stories/Test/MyNewStory.tscn")
