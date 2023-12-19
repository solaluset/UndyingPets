data merge entity @s {NoAI:1b,Invulnerable:1b,Health:1.0f}
effect clear @s
data modify entity @s HandItems[1] set value {id:"minecraft:totem_of_undying",Count:1b}

# wolves are special-cased because of health bug
scoreboard players set @s[type=wolf] UP.health 1

# add text
execute if entity @s[tag=!UP.dead] positioned ~ ~0.5 ~ anchored eyes run summon armor_stand ^ ^ ^ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b,CustomName:'{"text":"DEAD","color":"red"}',CustomNameVisible:1b,Tags:["UP.text"]}

tag @s add UP.dead
