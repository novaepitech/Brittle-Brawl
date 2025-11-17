class_name EnemyLogic
extends CharacterBody2D

const ENEMY_SPEED = 200.0

@export var enemy_recipe: EnemyData
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var weapon_pickup_area: EnemyLogic = $"."

var player: Player = null

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")
	if enemy_recipe:
		sprite_2d.texture = enemy_recipe.sprite_texture


func _physics_process(delta: float) -> void:
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * enemy_recipe.speed
	move_and_slide()


func take_damage(damage_amount: int) -> void:
	print("Ouch ! HP : " + str(enemy_recipe.hp))
	enemy_recipe.hp -= damage_amount
	if enemy_recipe.hp <= 0:
		queue_free()
