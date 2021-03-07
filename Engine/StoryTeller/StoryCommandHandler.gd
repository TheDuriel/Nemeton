extends Node
"""
	StoryCommandHandler Singleton Script
	Recieves Commands by StoryNodes and executes them.
"""
signal text_pushed(text, debug)
signal new_line_pushed


func push_text(text: String) -> void:
	emit_signal("text_pushed", text, false)


func push_text_debug(text: String) -> void:
	emit_signal("text_pushed", text, true)


func push_new_line() -> void:
	emit_signal("new_line_pushed")
