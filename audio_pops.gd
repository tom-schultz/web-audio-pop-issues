extends AudioStreamPlayer

@export var _stream : AudioStream

var _play : bool

func _ready() -> void:
	stream = _stream
	finished.connect(_finished)

func _process(_delta: float) -> void:
	_play = Input.is_action_pressed("play")
	
	#if Input.is_action_just_pressed("play"):
		#var child = AudioStreamPlayer.new()
		#add_child(child)
		#child.finished.connect(func(): child.queue_free())
		#child.stream = _stream
		#child.play()
		
	if not playing and _play:
		play()

func _finished() -> void:
	if _play: play()
