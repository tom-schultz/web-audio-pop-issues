extends AudioStreamPlayer

@export var _stream : AudioStream

var _play_self : bool

func _ready() -> void:
	stream = _stream
	finished.connect(_finished)

func _process(_delta: float) -> void:
	_play_self = Input.is_key_pressed(KEY_CTRL)
	
	if Input.is_action_just_pressed("play"):
		var child = AudioStreamPlayer.new()
		add_child(child)
		child.finished.connect(func(): child.queue_free())
		child.stream = _stream
		child.play()
		
	if not playing and _play_self:
		play()

func _finished() -> void:
	if _play_self: play()
