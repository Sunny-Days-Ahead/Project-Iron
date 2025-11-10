extends Node

# Common retro resolutions
const RES_ATARI 	: Vector2 = Vector2(160, 192)
const RES_PAL 		: Vector2 = Vector2(256, 240)		# 8/16 bit era common
const RES_NTSC 		: Vector2 = Vector2(256, 224)		# 8/16 bit era common
const RES_240P 		: Vector2 = Vector2(320, 240)
const RES_GAMEBOY 	: Vector2 = Vector2(160, 144)
const RES_480P 		: Vector2 = Vector2(640, 480)

# Game specific settings
const GAME_RES : Vector2 = Vector2(320,576)	## Change this to your game resolution
const HALF_RES : Vector2 = GAME_RES * 0.5

# Save/config paths
const SAVE_DIR : String = "user://saves/"
const CONFIG_FILE : String = "user://settings.cfg"

# Common objects/references to retain between scenes.
var rng : RandomNumberGenerator = RandomNumberGenerator.new()
var main_node : Node
var stage_node : Node
var player_node : CharacterBody2D
var ui_node : Node

# Window variables
var scale_mult : int = 2			# How much the window should scale up @ runtime
var window_size : Vector2i = Vector2i(GAME_RES * scale_mult)
var screen_size : Vector2i = DisplayServer.screen_get_size()
var window_pos : Vector2i = (screen_size - window_size) / 2

func _ready() -> void:
	process_mode  = PROCESS_MODE_ALWAYS
	rng.randomize()
	_ensure_save_directory()
	setup_window()
	
func setup_window() -> void:
	get_window().size = window_size
	get_window().position = window_pos
	
func _ensure_save_directory() -> void:
	if not DirAccess.dir_exists_absolute(SAVE_DIR):
		DirAccess.make_dir_absolute(SAVE_DIR)
