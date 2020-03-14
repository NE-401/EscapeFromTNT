# play tnt primed sound
playsound minecraft:entity.tnt.primed neutral @s

# summon tnt (fuse : 40(default!))
summon tnt ~0.1 ~1 ~0.1 {Fuse:40}

# display boom to title
title @s title ["",{"text":"boom!","color":"red"}]
