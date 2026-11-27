extends Node2D

var playerRef

var currentCameraSpeed = 0.0
var cameraSpeedMult = 0.0 ## later divided by cam speed mag
var cameraSpeedMagnitude = 10.0

var highestCameraHeight = self.global_position.y * -1 ## mult by -1 because why the hell is up decreasing in godot????

var highestPlayerHeight = 0

func _ready():
	playerRef = %PlayerScene

func _physics_process(delta): 
	updateHighestHeight()
	moveCam()
	updateCameraSpeed()
	updateScore()
	

func updateHighestHeight():
	highestCameraHeight = self.global_position.y*-1

func moveCam():
	if playerRef.global_position.y*-1> highestCameraHeight+100:
		#print("pos ", playerRef.global_position.y*-1)
		#print("camheigh ", highestCameraHeight)
		self.global_position.y = playerRef.global_position.y+00
		
	else:
		self.global_position.y = self.global_position.y-currentCameraSpeed

func updateCameraSpeed():
	currentCameraSpeed = currentCameraSpeed * (1 + (cameraSpeedMult/cameraSpeedMagnitude))
	

func stopCamera(): # for when we want to stop the camera later (during death)
	currentCameraSpeed = 0

# uhhhh is that it?
# uh nope lol




func _on_body_entered(body: Node2D) -> void:
	if body == playerRef:
		loseGameLol()
	elif body.name.match("**Platform****"):
		body.queue_free()


func loseGameLol():
	print("lose game func yeah")
	currentCameraSpeed = 0
	playerRef.hide()
	get_tree().change_scene_to_file("res://Scenes/mainMenu.tscn")


func updateScore():
	
	if highestPlayerHeight < playerRef.global_position.y*-1:
		highestPlayerHeight = playerRef.global_position.y*-1
		$CanvasLayer/MarginContainer/HBoxContainer/Label2.text = str(int(highestPlayerHeight*10))
	
	pass
