tool
extends StoryNode
class_name NewLine


func _init() -> void:
	editor_description = "Forces a new line to be present after the previous text."


func run() -> void:
	.run()
	StoryCommandHandler.push_new_line()
	
	_run_child()
	_run_next_sibling()
