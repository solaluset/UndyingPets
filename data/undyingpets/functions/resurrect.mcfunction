# get health and max health of dead entities
execute as @e[tag=UP.dead] at @s run function undyingpets:resurrect/get_health

# resurrect if health is full
execute as @e[tag=UP.dead] at @s if score @s UP.health >= @s UP.max_health run function undyingpets:resurrect/do_resurrect
