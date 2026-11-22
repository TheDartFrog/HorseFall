extends Node2D

var lastRow = 0
var rowsAmount = 5

var currentRowPos: int = 0

var platformChancePerSlot = 1
var platformChanceDecay = 0.05

var platformXposes = [-350, -250, -150, -50, 50, 150, 250]


var safeSlotIndex = 2


func _physics_process(delta): 
	
	currentRowPos = ceil(self.global_position.y * -1) / 100
	tryProgressRows()
	
	


func generatePlatformsForRow(row: int):
	
	var chanceForThisPlat = platformChancePerSlot
	var nextSlotIndex = safeSlotIndex + [-2, 2].pick_random()
	
	if nextSlotIndex < 0:
		nextSlotIndex = safeSlotIndex + 2
		
	if nextSlotIndex >= platformXposes.size():
		nextSlotIndex = safeSlotIndex - 2
	
	
	var slots = [0, 1, 2, 3, 4]
	slots.shuffle()
	
	
	for i in slots.size():
		var random_float = randf()
		
		if i == safeSlotIndex:
			continue
		
		
		
		if i == nextSlotIndex or random_float < chanceForThisPlat:
			var newPlatform = preload("res://Scenes/platform.tscn")
			var instancedPlat = newPlatform.instantiate()
			
			instancedPlat.global_position.y = lastRow*-100
			instancedPlat.global_position.x = platformXposes[i]
			
			get_tree().root.add_child(instancedPlat)
		
		chanceForThisPlat = chanceForThisPlat * platformChanceDecay
		print(chanceForThisPlat)
	
	safeSlotIndex = nextSlotIndex
	
	

func generateNextRow():
	lastRow = lastRow+1
	generatePlatformsForRow(lastRow)


func tryProgressRows():
	if currentRowPos + rowsAmount > lastRow:
		generateNextRow()
