# register new tamed entities
execute as @e[tag=!UP.protected] at @s if data entity @s Health if data entity @s Owner run function undyingpets:protect/register_mob

# entity died if totem is missing
execute as @e[tag=UP.protected,nbt=!{HandItems:[{}, {id:"minecraft:totem_of_undying",Count:1b}]}] at @s run function undyingpets:protect/death
