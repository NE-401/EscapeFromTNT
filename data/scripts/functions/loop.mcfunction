# count down t_tick
scoreboard players remove @a t_remain 1

scoreboard players add @a t_tick 1

# display bossbar
bossbar set minecraft:boom players @a
execute as @a at @s store result bossbar boom value run scoreboard players get @s t_tick

# second
execute as @a run scoreboard players operation @s t_sec_current = @s t_remain
execute as @a run scoreboard players operation @s t_sec_current /= @s tps

# second (1/10 sec scale)
execute as @a run scoreboard players operation @s t_sec_current_b = @s t_remain
execute as @a run scoreboard players operation @s t_sec_current_b %= @s tps
execute as @a run scoreboard players operation @s t_sec_current_b /= @s two

# display timer (t_tick > 0)
execute as @a[scores={t_remain=1..}] run title @s actionbar ["",{"text":"Next boom: "},{"score":{"name":"@s","objective":"t_sec_current"}},{"text":"."},{"score":{"name":"@s","objective":"t_sec_current_b"}},{"text":"s"}]

# summon tnt (t_tick = 0)
execute as @a[scores={t_remain=0}] at @s run function scripts:summon_tnt

# reset timer (t_tick < 0)
execute as @a[scores={t_remain=..-1}] at @s run function scripts:reset_timer
