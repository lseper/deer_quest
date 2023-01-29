extends KinematicBody2D

class_name Actor

# base horizontal move speed
export var speed := 400.0
export var gravity := 40

var _velocity := Vector2.RIGHT

const FLOOR_NORMAL = Vector2.UP
