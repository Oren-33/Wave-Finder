extends Node2D

var border = Rect2(1,1,30,16)
var start_position = Vector2(1,1)
onready var tileMap =$TileMap
var start_and_end = []
var wave




func _ready() -> void:
	_generate_wave()



func _generate_wave():
	var wavecreater = Wave_Creater.new(start_position,border)
	wavecreater._generate_the_map(250)
	wave = wavecreater.walk_history
	start_and_end = wavecreater.get_the_start_and_the_end()
	wavecreater.queue_free()
	for position in wave:
		tileMap.set_cellv(position,-1) #抹去被走过的地块
	tileMap.set_cellv(start_and_end.back(),1)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_node("KinematicBody2D").start_to_walk(start_and_end,wave,border)   
