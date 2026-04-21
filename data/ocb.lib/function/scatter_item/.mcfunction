#> ocb.lib:scatter_item/
## アイテムをぶちまける

# インベントリをストレージに格納し、ストレージの中身をcontainerコンポーネントに移植
    summon item ~ ~1 ~ {Item:{id:"shulker_box",count:1},Tags:["scatter"]}
    scoreboard players set $ScatterItemSlot ocblib.temp 0
    execute as @n[type=item,tag=scatter] run function ocb.lib:scatter_item/loop

# 破壊してMotionに倍率を掛ける
    damage @n[type=item,tag=scatter] 10000
    $execute positioned ~ ~1 ~ as @e[type=item,distance=0,tag=!motioned] store result entity @s Motion[0] double 0.0001 run data get entity @s Motion[0] $(motion_scale)0000
    $execute positioned ~ ~1 ~ as @e[type=item,distance=0,tag=!motioned] store result entity @s Motion[2] double 0.0001 run data get entity @s Motion[2] $(motion_scale)0000
    $execute positioned ~ ~1 ~ as @e[type=item,distance=0,tag=!motioned] run data modify entity @s PickupDelay set value $(delay)s
    tag @e[type=item] add motioned

# ストレージリセット
    data remove storage ocblib:_ ScatterItem