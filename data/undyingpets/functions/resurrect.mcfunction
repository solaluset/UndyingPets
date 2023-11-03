# get health and max health of dead entities
execute as @e[tag=UP.dead,type=!wolf] store result score @s UP.health run data get entity @s Health 1
execute as @e[tag=UP.dead] store result score @s UP.max_health run attribute @s generic.max_health get

# resurrect if health is full
execute as @e[tag=UP.dead] if score @s UP.health >= @s UP.max_health run tag @s add UP.resurrecting
tag @e[tag=UP.resurrecting] remove UP.dead
execute as @e[tag=UP.resurrecting] run data merge entity @s {Invulnerable:0b,NoAI:0b}

# remove "DEAD" text
execute as @e[tag=UP.resurrecting] at @s positioned ~ ~0.5 ~ anchored eyes run kill @e[tag=UP.text,sort=nearest,limit=1]

# show hearts particles
execute at @e[tag=UP.resurrecting] run particle heart ~ ~1 ~ 0.4 0.4 0.4 1 10

tag @e[tag=UP.resurrecting] remove UP.resurrecting
