
extends  KinematicBody2D
const DIRECTIONS = [Vector2.DOWN , Vector2.UP , Vector2.RIGHT , Vector2.LEFT]
var v =[]
var direction = Vector2.UP
var counter = 0
var flag = 0 #用于判别和更改对Direction的偏移
var Directions=[]
var judgement = true
var walk_history =[]
var wave=[]
var border
var start_and_end=[]
var start = false
var walk_history_for_check=[]

	
	 
	
func start_to_walk(start_and_end,wave,boder):
	start = true
	self.start_and_end=start_and_end
	self.border=Rect2(32,32,30*32,16*32)
	for i  in wave.size():
		self.wave.append(wave[i]*32)
		

	
		
		

	
	

func _walk():
	randomize()
	for flag in 4:
		var target_position = (position+DIRECTIONS[flag]*32)
		if(walk_history_for_check.has(target_position) or not wave.has(target_position) or not border.has_point(target_position)):
			flag=flag+1
			if(flag==4):
				position = walk_history[walk_history.find_last(position)-1]
				walk_history.pop_back()
				
				flag = 0
				
	
		else:
			flag = 0
			walk_history.append(target_position)	
			walk_history_for_check.append(target_position)
			position = target_position
			break

func _check():
	print(position)
	
#func _process(delta: float) -> void:
#	if(position/32 == start_and_end.back()):
#		print("You success to escape from the wave")
#
		
	
	


func _on_Timer_timeout() -> void:
	if(start):
		_walk()
		if(position/32 == start_and_end.back()):
			print("You success to escape from the wave")
			get_node("Timer").queue_free()
			
		
	
#
	
