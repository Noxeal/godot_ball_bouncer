extends RigidBody2D

@onready var sprite = $Sprite2D
@onready var collision_shape = $CollisionShape2D
@onready var timer: Timer = $"../Timer"
@onready var audio_stream_player: AudioStreamPlayer = $"../AudioStreamPlayer"
@export var velocity = Vector2(200,200)
var is_playing = false

#func _physics_process(delta):
	#var collision = move_and_collide(velocity * delta)
	#if collision:
		#velocity = velocity.bounce(collision.get_normal())
		#velocity *= 1.05  # accélération

func _on_body_entered(body):
	print("Rebond sur", body.name)
	# Augmentation de vitesse du rebond
	linear_velocity *= 1.04
	sprite.modulate = Color(randf(), randf(), randf())
	
	sprite.scale *= 1.05
	collision_shape.scale *= 1.05
	
	timer.start()
	
	if not is_playing:
		audio_stream_player.play()
		is_playing = true

func _on_timer_timeout() -> void:
	audio_stream_player.stop()
	is_playing = false
