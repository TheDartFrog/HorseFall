extends Node2D

var lastRow = 0
var rowsAmount = 5

var currentRowPos: int = 0

var platformChancePerSlot = 1
var platformChanceDecay = 0.4

var platformXposes = [-350, -250, -150, -50, 50, 150, 250]


func _physics_process(delta): 
	
	currentRowPos = ceil(self.global_position.y * -1) / 100
	tryProgressRows()
	
	
	
	pass


func generatePlatformsForRow(row: int):
	
	var chanceForThisPlat = platformChancePerSlot
	platformXposes.shuffle()
	
	for i in platformXposes.size():
		var random_float = randf()
		
		if random_float < chanceForThisPlat:
			var newPlatform = preload("res://Scenes/platform.tscn")
			var instancedPlat = newPlatform.instantiate()
			
			instancedPlat.global_position.y = lastRow*-100
			instancedPlat.global_position.x = platformXposes[i]
			
			get_tree().root.add_child(instancedPlat)
		
		chanceForThisPlat = chanceForThisPlat * platformChanceDecay
		print(chanceForThisPlat)
	
	
	
	

func generateNextRow():
	lastRow = lastRow+1
	generatePlatformsForRow(lastRow)


func tryProgressRows():
	if currentRowPos + rowsAmount > lastRow:
		generateNextRow()
