# dismount players sitting on dead entities
execute as @a[nbt={RootVehicle:{Entity:{Tags:["UP.dead"]}}}] run tp @s @s
