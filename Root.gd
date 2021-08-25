extends Node2D

const Note = preload("res://tile.tscn")

var notes = [
	0,
	0,
	3,
	3,
	4,
	2,
	2,
	0,
	1,
	3,
	3,
]

var index = 0



var one = false
var two = false
var three = false
var four = false




func _ready():
	$Timer.start()

func _on_Timer_timeout():
	createNote(notes[index])
	index+=1
	pass

func createNote(position):
	if position == 0:
		return
	
	var newNote = Note.instance()

	newNote.position.y = -120
	newNote.position.x = 75*position
	
	add_child(newNote)



func _process(delta):
	if one is KinematicBody2D and Input.is_action_just_pressed("1"):
		one.vel = 0
		one.queue_free()
		one = false
	if two is KinematicBody2D and Input.is_action_just_pressed("2"):
		two.vel = 0
		two.queue_free()
		two = false
	if three is KinematicBody2D and Input.is_action_just_pressed("3"):
		three.vel = 0
		three.queue_free()
		three = false
	if four is KinematicBody2D and Input.is_action_just_pressed("4"):
		four.vel = 0
		four.queue_free()
		four = false

func _on_Acerto1_body_entered(body):
	one = body

func _on_Acerto2_body_entered(body):
	two = body

func _on_Acerto3_body_entered(body):
	three = body
	
func _on_Acerto4_body_entered(body):
	four = body

func _on_Errou_body_entered(body):
	$Timer.paused = true
	$Label.show()


func _on_Acerto4_body_exited(body):
	four = false


func _on_Acerto3_body_exited(body):
	three = false


func _on_Acerto2_body_exited(body):
	two = false


func _on_Acerto1_body_exited(body):
	one = false
