# add value to wolf's health and decrement item count
scoreboard players operation @e[tag=UP.dead,type=wolf,distance=..1,sort=nearest,limit=1] UP.health += @s UP.food_value
execute store result score @s UP.food_count run data get entity @s Item.Count
scoreboard players remove @s UP.food_count 1
execute store result entity @s Item.Count byte 1 run scoreboard players get @s UP.food_count
