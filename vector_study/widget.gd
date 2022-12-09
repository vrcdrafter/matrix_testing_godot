extends Spatial

var t = 0.0 

var start_num = 0 
var end_num = 0
var gradual_one = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var camera = get_node("../Camera")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	t += delta
	
	var basis = Basis()
	#print(basis)
	transform.basis.x = Vector3(.7, 0, -.7) # Vector pointing along the X axis
	transform.basis.y = Vector3(0, 1, 0) # Vector pointing along the Y axis
	transform.basis.z = Vector3(.7, 0, .7) # Vector pointing along the Z axis
	#print(basis) # Replace with function body.
	#var basis_camera = camera.global_position
	var camera_pos = camera.global_transform
	var camera_basis = transform.basis
	#print("camera position", camera_basis.x)
	#self.transform = self.transform.looking_at(camera.translation,camera_basis.y)
	var look_to_angle = self.transform.looking_at(camera.translation,camera_basis.y)

	
	var test = analog_one()
	print(test)
	var wtransform = global_transform.looking_at(camera.translation,camera_basis.y)
	var wrotation = Quat(global_transform.basis).slerp(Quat(wtransform.basis), test)

	global_transform = Transform(Basis(wrotation), global_transform.origin)
	
	#self.transform = look_to_angle
	#self.transform.origin = lerp(self.transform.origin,camera.transform.origin,.001)
	
func analog_one():
	end_num += .01
	gradual_one = lerp(0,1, end_num)
	
	if gradual_one > 1:
		return 1.0
	else:
		return gradual_one
