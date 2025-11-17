class_name Player
extends CharacterBody2D


const SPEED = 300.0
const DODGE_SPEED = 600.0

var nearest_grabbable: WeaponPickup = null
var current_weapon_data: WeaponData = null
var is_dashing: bool = false
var dodge_direction: Vector2 = Vector2.ZERO

@onready var grab_hint: Label = $"../GrabHint"
@onready var equipped_weapon: Sprite2D = $Weapon
@onready var attack_hitbox_collision: CollisionShape2D = $AttackHitboxArea/AttackHitboxCollision
@onready var attack_timer: Timer = $AttackTimer
@onready var dodge_timer: Timer = $DodgeTimer
@onready var player_sprite: Sprite2D = $Player

func _physics_process(_delta: float) -> void:
	if is_dashing:
		velocity = dodge_direction * DODGE_SPEED
		move_and_slide()
		return

	# Get the combined input direction as a Vector2.
	# This automatically normalizes diagonal input (so you don't move faster diagonally).
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction:
		velocity = input_direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()

func register_grabbable(weapon: WeaponPickup) -> void:
	nearest_grabbable = weapon
	grab_hint.show()

func unregister_grabbable(weapon: WeaponPickup) -> void:
	if nearest_grabbable == weapon:
		nearest_grabbable = null
	grab_hint.hide()


func start_dodge() -> void:
	is_dashing = true
	dodge_direction = Input.get_vector("left", "right", "up", "down")

	if dodge_direction == Vector2.ZERO:
		if velocity.length() > 0:
			dodge_direction = velocity.normalized()
		else:
			is_dashing = false
			return

	player_sprite.modulate.a = 0.5
	dodge_timer.start()


func _input(event: InputEvent) -> void:
	if is_dashing:
		return

	if event.is_action_pressed("grab"):
		equip_weapon(nearest_grabbable)
	if event.is_action_pressed("attack") and current_weapon_data:
		attack_hitbox_collision.set_deferred("disabled", false)
		attack_timer.start()
	if event.is_action_pressed("dodge"):
		start_dodge()


func equip_weapon(pickup: WeaponPickup) -> void:
	if pickup:
		current_weapon_data = pickup.weapon_recipe
		equipped_weapon.texture = pickup.sprite_2d.texture
		equipped_weapon.show()
		nearest_grabbable.queue_free()
		nearest_grabbable = null


func break_weapon() -> void:
	equipped_weapon.hide()
	current_weapon_data = null


func _on_attack_timer_timeout() -> void:
	attack_hitbox_collision.set_deferred("disabled", true)


func _on_attack_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		area.get_parent().take_damage(1)
		current_weapon_data.durability -= 1
		if current_weapon_data.durability <= 0:
			break_weapon()


func _on_dodge_timer_timeout() -> void:
	is_dashing = false
	player_sprite.modulate.a = 1.0
