extends KinematicBody

onready var Dialogue=get_node("/root/Game/UI/Dialogue")

var dialogue=[
	"Dude. This is messed up. (Press E to continue)"
	,"These people are INSANE!"
	,"They trapped us in this small weird metal park with no way out and void on all sides."
	,"Apparently we're "+'"threats to the human race "'+"because we've been "+'"infected by a deadly pathogen."'
	,"As if. I feel fine!"
	,"Anyway, it gets worse."
	,"These psychos are making us play some sick game for their enjoyment."
	,"If you don't shoot all the targets and kill the flying thing before time runs out..."
	,"You..."
	,"You have to do it AGAIN!"
	,"I know. Monstrous."
	,"The worst part?"
	,"If you SUCCEED? Your prize is that you get to do it AGAIN!"
	,"So basically we're trapped here forever. Sorry."
	,"I'm also sorry for talking so much. Each time you play you'll have to click through it all."
	,"The timer starts when you press E. Good luck. See you soon."
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue",self,"finished")
	
	

func _on_Area_body_entered(body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(body):
	Dialogue.hide_dialogue()

func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer=120
	Global.update_time()
	get_node("/root/Game/UI/Timer").start()



