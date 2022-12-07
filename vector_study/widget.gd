extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var camera = get_node("../Camera")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var basis = Basis()
	print(basis)
	transform.basis.x = Vector3(.7, 0, -.7) # Vector pointing along the X axis
	transform.basis.y = Vector3(0, 1, 0) # Vector pointing along the Y axis
	transform.basis.z = Vector3(.7, 0, .7) # Vector pointing along the Z axis
	print(basis) # Replace with function body.
	#var basis_camera = camera.global_position
	var child_two_position = camera.global_transform
	print("camera position", child_two_position)
