class_name Player
extends CharacterBody2D


const SPEED = 300.0

var nearest_grabbable: WeaponPickup = null
var current_weapon_data: WeaponData = null

@onready var grab_hint: Label = $"../GrabHint"
@onready var equipped_weapon: Sprite2D = $Weapon
@onready var attack_hitbox_collision: CollisionShape2D = $AttackHitboxArea/AttackHitboxCollision
@onready var attack_timer: Timer = $AttackTimer

func _physics_process(_delta: float) -> void:
	# Get the combined input direction as a Vector2.
	# This automatically normalizes diagonal input (so you don't move faster diagonally).
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction:
		velocity = input_direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()

func register_grabbable(weapon: WeaponPickup):
	nearest_grabbable = weapon
	grab_hint.show()

func unregister_grabbable(weapon: WeaponPickup):
	if nearest_grabbable == weapon:
		nearest_grabbable = null
	grab_hint.hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("grab"):
		equip_weapon(nearest_grabbable)
	if event.is_action_pressed("attack") and current_weapon_data:
		attack_hitbox_collision.set_deferred("disabled", false)
		attack_timer.start()


func equip_weapon(pickup: WeaponPickup):
	if pickup:
		current_weapon_data = pickup.weapon_recipe
		equipped_weapon.texture = pickup.sprite_2d.texture
		equipped_weapon.show()
		nearest_grabbable.queue_free()
		nearest_grabbable = null


func break_weapon():
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
