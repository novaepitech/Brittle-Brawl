class_name WeaponPickup
extends Area2D

var should_highlight: bool = false

@export var weapon_recipe: WeaponData
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var outline: Sprite2D = $Outline
@onready var weapon_pickup_area: WeaponPickup = $"."

func _ready() -> void:
	weapon_pickup_area.body_entered.connect(show_outline)
	weapon_pickup_area.body_exited.connect(hide_outline)
	if weapon_recipe:
		sprite_2d.texture = weapon_recipe.sprite_texture
		outline.texture = sprite_2d.texture
		outline.hide()


func show_outline(_body: Node2D) -> void:
	if should_highlight != true:
		should_highlight = true
		outline.show()


func hide_outline(_body: Node2D) -> void:
	if should_highlight != false:
		should_highlight = false
		outline.hide()


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.register_grabbable(self)


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		body.unregister_grabbable(self)
