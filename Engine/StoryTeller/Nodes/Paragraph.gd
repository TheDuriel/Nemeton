tool
extends StoryNode
class_name Paragraph

export(bool) var new_line_before: bool = true
export(String, MULTILINE) var text: String = "<NoText>"


func _init() -> void:
	editor_description = "Display a Paragraph. Optionally ensures a new line is started."


func run() -> void:
	.run()
	
	if new_line_before:
		StoryCommandHandler.push_new_line()
	StoryCommandHandler.push_text(text)
	
	_run_child()
	_run_next_sibling()
