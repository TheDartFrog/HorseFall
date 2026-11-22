extends RigidBody2D

var isGrounded = false

func _ready():
	print("yay")

func _physics_process(delta): ## yo are we even gonna need this lowk         update: yes we are
	if $groundCheckArea2D.get_overlapping_bodies().is_empty():
		isGrounded = false
	else: isGrounded = true

func goToNode(theNode: int): ## nodes 1-4
	match theNode:
		1:
			self.global_position = $horsNode1.global_position
		2:
			self.global_position = $horsNode2.global_position
		3:
			self.global_position = $horsNode3.global_position
		4:
			self.global_position = $horsNode4.global_position
		_: print("what")
