extends PanelContainer
"""
	Reader Scene Script
"""
const NEW_LINE_LITERAL: String = """\n"""
const BLANK_LINE_LITERAL: String = NEW_LINE_LITERAL + NEW_LINE_LITERAL

onready var _rtl: RichTextLabel = $"M/RichTextLabel"

var _page: String = ""


func _ready() -> void:
	# warning-ignore:return_value_discarded
	# warning-ignore:return_value_discarded
	StoryCommandHandler.connect("text_pushed", self, "_on_text_pushed")
	StoryCommandHandler.connect("new_line_pushed", self, "_on_new_line_pushed")


func _append_text(text: String) -> void:
	_page += text
	_rtl.bbcode_text = _page


func _append_new_line() -> void:
	_page += NEW_LINE_LITERAL


func _ensure_new_line() -> void:
	if not _page.ends_with(NEW_LINE_LITERAL):
		_page += NEW_LINE_LITERAL


func _ensure_blank_line() -> void:
	if not _page.ends_with(BLANK_LINE_LITERAL):
		if _page.ends_with(NEW_LINE_LITERAL):
			_page += NEW_LINE_LITERAL
		else:
			_page += BLANK_LINE_LITERAL


func _on_text_pushed(text: String, debug: bool) -> void:
	if debug and not StoryTellerConfig.DEBUG_PRINT:
		return
	_ensure_blank_line()
	_append_text(text)


func _on_new_line_pushed():
	_append_new_line()
