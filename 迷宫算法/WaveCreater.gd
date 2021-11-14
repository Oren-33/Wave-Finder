extends Node
class_name WaveCreater
var border = Rect2()
var position = Vector2()
const DIRECTIONS = [Vector2.UP , Vector2.DOWN , Vector2.RIGHT , Vector2.LEFT]
var walk_history =[]
var direction = Vector2.UP
var counter = 0
var flag = 0 #用于判别和更改对Direction的偏移
var Directions=[]
var judgement = true


func _init(start_position , new_border) -> void:
	#这里的new_border是Vector2的类型
	assert(new_border.has_point(start_position))
	position = start_position
	border = new_border
	walk_history.append(position)
	
	
	
	 
	
func _generate_the_map(blocks):
	while(judgement):
		_walk()
		if(walk_history.size()>=blocks):
			judgement = false
	print(walk_history.size())
	
	

func _walk():
	randomize()
	Directions=DIRECTIONS
	Directions.shuffle()
	for flag in 4:
		var target_position = (position+Directions[flag])
		if(walk_history.has(target_position) or  not border.has_point(target_position)):
			flag=flag+1
			if(flag==4):
				position = walk_history[walk_history.find_last(position)-1]
				#walk_history.remove(walk_history.size()-1)
			
				flag = 0
				
	
		else:
			flag = 0
			walk_history.append(target_position)	
			position = target_position
			break

	

	


