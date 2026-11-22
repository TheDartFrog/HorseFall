extends RigidBody2D


func _ready():
	print("yay")

#func _physics_process(delta): ## yo are we even gonna need this lowk
#	print("woo")

func goToNode(theNode: int): ## nodes 1-4
	match theNode:
		1:
			self.position = $horsNode1.position
		2:
			self.position = $horsNode2.position
		3:
			self.position = $horsNode3.position
		4:
			self.position = $horsNode4.position
		_: print("what")
