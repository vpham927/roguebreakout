extends Node

@export var movement_speed : float = 500

var screen_size

var paddle: CharacterBody2D
var paddle_sprite: ColorRect
var paddle_size = Vector2(200,50)

func _ready() -> void:
	screen_size = get_viewport().get_visible_rect().size
	
	paddle = CharacterBody2D.new()
	paddle.position = Vector2(screen_size.x/2,screen_size.y - paddle_size.y)
	add_child(paddle)
	
	paddle_sprite = ColorRect.new()
	paddle_sprite.color = Color.NAVAJO_WHITE
	paddle_sprite.size = Vector2(paddle_size.x,paddle_size.y)
	
	paddle_sprite.position = Vector2(-paddle_size.x/2, -paddle_size.y/2)
	paddle.add_child(paddle_sprite)

func _physics_process(delta: float) -> void:

	var input_direction := 0
	if Input.is_action_pressed("move_right"):
		input_direction += 1
	if Input.is_action_pressed("move_left"):
		input_direction -= 1
	paddle.velocity.x = input_direction * movement_speed
	paddle.move_and_slide()
