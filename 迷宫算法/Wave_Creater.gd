extends Node
class_name Wave_Creater
var border = Rect2()  #迷宫生成的边界
var position = Vector2() #开始的位置
const DIRECTIONS = [Vector2.UP , Vector2.DOWN , Vector2.RIGHT , Vector2.LEFT] #方向组，代替三元组的1234
var walk_history =[] #走过的地块的记录
var direction = Vector2.UP
var counter = 0
var flag = 0 #用于判别和更改对Direction的偏移
var Directions=[]
var judgement = true
var l = false
var start_and_end=[] #返回开始与结束


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
		for i in 4:
			var check_position = (target_position+DIRECTIONS[i])
			if(walk_history.has(check_position)and not check_position==position):
				l = true
				break	
			else:
				l = false
		if(walk_history.has(target_position)  or  not border.has_point(target_position) or l ):
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
		
		
			
func get_the_start_and_the_end():
	start_and_end.append(walk_history.front())
	start_and_end.append(walk_history.back())
	return start_and_end
