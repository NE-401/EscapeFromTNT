scoreboard objectives add t_remain dummy

scoreboard objectives add t_sec_current dummy
scoreboard objectives add t_sec_current_b dummy

# set times(sec) 60 seconds
scoreboard objectives add t_sec dummy
scoreboard players set @a t_sec 20

# set const
scoreboard objectives add tps dummy
scoreboard players set @a tps 20
scoreboard objectives add two dummy
scoreboard players set @a two 2

# set timer(tick)
scoreboard players operation @a t_remain = @a t_sec
scoreboard players operation @a t_remain *= @a tps

# set max tick (for bossbar!)
scoreboard objectives add t_tick_max dummy
scoreboard players operation @a t_tick_max = @a t_remain

# t_remain (for bossbar)
scoreboard objectives add t_tick dummy
scoreboard players set @a t_tick 0

# create bossbar
bossbar add boom "boom!"
bossbar set minecraft:boom color red
bossbar set minecraft:boom players @a
execute as @a at @s store result bossbar boom max run scoreboard players get @s t_tick_max
