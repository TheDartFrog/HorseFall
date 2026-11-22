extends Node2D

@onready var playerRef = get_tree().root.find_child("PlayerScene", true, false)

var wasGrounded = false
var isGrounded = false

var enableBtn1 = false
var enableBtn2 = false
var enableBtn3 = false
var enableBtn4 = false

#TODO: check if player can move to button's position

func _physics_process(delta): 
	if playerRef == null:
		return
	isGrounded = playerRef.isGrounded
	switchGroundedStateBoard()
	enableButton(3)
	if not isGrounded:
		return ## exit func if not on ground
	
	# if we are grounded we continue:
	updateMoves()
	


func switchGroundedStateBoard():
	if wasGrounded != isGrounded:
		wasGrounded = isGrounded
		if isGrounded:
			print("now on ground!")
			enableButton(1)
			enableButton(2)
			enableButton(3)
			enableButton(4)
			#TODO: ungray possible moves
		if not isGrounded:
			print("now in the air!")
			disableButton(1)
			disableButton(2)
			disableButton(3)
			disableButton(4)
			#TODO: gray out possible moves

func updateMoves():
	pass #TODO: check collision, if allowed enable button

func enableButton(number: int):
	
	match number: # oh yeah we in spaghetti town babeeyyyyy
		1:
			enableBtn1 = true #TODO: setting textures for enabled
		2:
			enableBtn2 = true
		3:
			enableBtn3 = true
		4:
			enableBtn4 = true
		_:
			print("what")


func disableButton(number: int):
	
	match number: # second spaghetti settlement
		1:
			enableBtn1 = false #TODO: setting textures for disabled
		2:
			enableBtn2 = false
		3:
			enableBtn3 = false
		4:
			enableBtn4 = false
		_:
			print("what")





func _on_go_button_1_button_down() -> void:
	if enableBtn1:
		playerRef.goToNode(1)


func _on_go_button_2_button_down() -> void:
	if enableBtn2:
		playerRef.goToNode(2)


func _on_go_button_3_button_down() -> void:
	if enableBtn3:
		playerRef.goToNode(3)
		print("gooo")


func _on_go_button_4_button_down() -> void:
	if enableBtn4:
		playerRef.goToNode(4)
