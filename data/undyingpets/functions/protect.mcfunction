# filter tamed entities (ignoring projectiles)
execute as @e store success score @s UP.tamed if data entity @s Health run data get entity @s Owner

# give totem of undying to new entities before registering them
execute as @e[scores={UP.tamed=1},tag=!UP.protected] run data modify entity @s HandItems[1] set value {id:"minecraft:totem_of_undying",Count:1b}

tag @e[scores={UP.tamed=1},tag=!UP.protected] add UP.protected

# entity died if totem is missing
tag @e[tag=UP.protected,nbt=!{HandItems:[{}, {id:"minecraft:totem_of_undying",Count:1b}]}] add UP.dying
execute as @e[tag=UP.dying] run data merge entity @s {NoAI:1b,Invulnerable:1b,Health:1.0f}
effect clear @e[tag=UP.dying]
execute as @e[tag=UP.dying] run data modify entity @s HandItems[1] set value {id:"minecraft:totem_of_undying",Count:1b}

# wolves are special-cased because of health bug
scoreboard players set @e[tag=UP.dying,type=wolf] UP.health 1

# add text
execute as @e[tag=UP.dying,tag=!UP.dead] at @s positioned ~ ~0.5 ~ anchored eyes run summon armor_stand ^ ^ ^ {Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b,CustomName:'{"text":"DEAD","color":"red"}',CustomNameVisible:1b,Tags:["UP.text"]}

tag @e[tag=UP.dying] add UP.dead
tag @e[tag=UP.dying] remove UP.dying
