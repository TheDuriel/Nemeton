extends Node
"""
	StoryInterpreter Autoload Script
	Loads and executes Stories.
"""
signal story_loaded
signal execution_finished

var _story_scene: PackedScene
var _story_instance: StoryNode


# warning-ignore:unused_argument
func set_readonly(new_value) -> void:
	pass


func start_story(story_path: String = "") -> void:
	if not story_path == "":
		_load_story(story_path)
	
	run_node(_story_instance)


func _load_story(story_path: String) -> void:
	if is_instance_valid(_story_instance):
		_story_instance.queue_free()
		yield(_story_instance, "tree_exited")
	
	_story_scene = load(story_path)
	_story_instance = _story_scene.instance()
	add_child(_story_instance)
	emit_signal("story_loaded")



func run_node(story_node: StoryNode) -> void:
	story_node.run()


func _get_node_child_or_sibling() -> StoryNode:
	return StoryNode.new()


func _get_node_child() -> StoryNode:
	return StoryNode.new()


func _get_node_sibling() -> StoryNode:
	return StoryNode.new()
