tag @s remove UP.dead
data merge entity @s {Invulnerable:0b,NoAI:0b}

# remove "DEAD" text
execute positioned ~ ~0.5 ~ anchored eyes run kill @e[tag=UP.text,sort=nearest,limit=1]

# show hearts particles
particle heart ~ ~1 ~ 0.4 0.4 0.4 1 10
