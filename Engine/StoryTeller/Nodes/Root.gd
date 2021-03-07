tool
extends StoryNode
class_name Root

export(String) var author: String = ""


func run() -> void:
	.run()
	
	_run_child()


func is_root() -> void:
	pass # Dumb Script Caching hack.
