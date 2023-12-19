# register food values
execute as @e[type=item] run function undyingpets:feed_wolves/register_food

# food will be used if there is a dead wolf nearby
execute as @e[scores={UP.food_value=1..}] at @s if entity @e[tag=UP.dead,type=wolf,distance=..1] run function undyingpets:feed_wolves/feed
