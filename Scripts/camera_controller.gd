extends Node2D

var playerRef

var currentCameraSpeed = 0.0
var cameraSpeedMult = 0.0 ## later divided by cam speed mag
var cameraSpeedMagnitude = 10.0

var highestCameraHeight = self.position.y * -1 ## mult by -1 because why the hell is up decreasing in godot????

func _ready():
	playerRef = %PlayerScene

func _physics_process(delta): 
	updateHighestHeight()
	moveCam()
	updateCameraSpeed()
	

func updateHighestHeight():
	highestCameraHeight = self.position.y*-1

func moveCam():
	if playerRef.position.y*-1 > highestCameraHeight:
		self.position.y = playerRef.position.y
	else:
		self.position.y = self.position.y-currentCameraSpeed

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
	#TODO: lose game screen
