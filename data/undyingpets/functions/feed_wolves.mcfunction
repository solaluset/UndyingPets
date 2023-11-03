# register food values
scoreboard players set @e[type=item,nbt={Item:{id:"minecraft:chicken"}}] UP.food_value 2
scoreboard players set @e[type=item,nbt={Item:{id:"minecraft:mutton"}}] UP.food_value 2
scoreboard players set @e[type=item,nbt={Item:{id:"minecraft:porkchop"}}] UP.food_value 3
scoreboard players set @e[type=item,nbt={Item:{id:"minecraft:beef"}}] UP.food_value 3
scoreboard players set @e[type=item,nbt={Item:{id:"minecraft:rabbit"}}] UP.food_value 3
scoreboard players set @e[type=item,nbt={Item:{id:"minecraft:rotten_flesh"}}] UP.food_value 4
scoreboard players set @e[type=item,nbt={Item:{id:"minecraft:cooked_rabbit"}}] UP.food_value 5
scoreboard players set @e[type=item,nbt={Item:{id:"minecraft:cooked_chicken"}}] UP.food_value 6
scoreboard players set @e[type=item,nbt={Item:{id:"minecraft:cooked_mutton"}}] UP.food_value 6
scoreboard players set @e[type=item,nbt={Item:{id:"minecraft:cooked_porkchop"}}] UP.food_value 8
scoreboard players set @e[type=item,nbt={Item:{id:"minecraft:cooked_beef"}}] UP.food_value 8

# food will be used if there is a dead wolf nearby
execute as @e[scores={UP.food_value=1..}] at @s if entity @e[tag=UP.dead,type=wolf,distance=..1] run tag @s add UP.used_food

# add value to wolf's health and decrement item count
execute as @e[tag=UP.used_food] at @s run scoreboard players operation @e[tag=UP.dead,type=wolf,distance=..1,sort=nearest,limit=1] UP.health += @s UP.food_value
execute as @e[tag=UP.used_food] store result score @s UP.food_count run data get entity @s Item.Count
scoreboard players remove @e[tag=UP.used_food] UP.food_count 1
execute as @e[tag=UP.used_food] store result entity @s Item.Count byte 1 run scoreboard players get @s UP.food_count

tag @e[tag=UP.used_food] remove UP.used_food
