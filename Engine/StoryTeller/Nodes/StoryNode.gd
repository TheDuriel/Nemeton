tool
extends Node
class_name StoryNode
"""
	StoryNode Class Script
"""


func run() -> void:
	StoryCommandHandler.push_text_debug(">>> Node: " + name)


func _run_child() -> void:
	if get_child_count() > 0:
		var child: Node = get_child(0) #StoryNode = get_child(0)
		if is_instance_valid(child):
			if child.has_method("run"):
				child.run()


func _run_next_sibling() -> void:
	var parent = get_parent()
	if parent.has_method("is_root"):
		return
	
	var siblings: Array = parent.get_children()
	var idx: int = siblings.find(self)
	# If we are not the last entry.
	if siblings[-1] != self:
		siblings[idx + 1].run()
