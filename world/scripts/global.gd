extends Node

# Global player variable
var player: Player

# Basic friction stuff
@export var knockback_speed: float = 200.0
@export var decelerate_speed: float = 5.0

# 4 cardinal directions
const DIR_4 = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

# Different gun parts
var barrel_parts: Array[String] = ["default", "upgraded"]
var gun_parts: Array[String] = ["barrel"]
