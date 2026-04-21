#> ocb.lib:scatter_item/loop
## アイテムをシュルカーボックスのcontainerコンポーネントに格納する

# アイテム格納
    data modify storage ocblib:_ ScatterItem.NewItem.item set from storage ocblib:_ ScatterItem.Scatter[0]
    data remove storage ocblib:_ ScatterItem.NewItem.item.Slot
    execute store result storage ocblib:_ ScatterItem.NewItem.slot int 1 run scoreboard players get $ScatterItemSlot ocblib.temp
    data modify entity @s Item.components."minecraft:container" append from storage ocblib:_ ScatterItem.NewItem
    
# ループ
    scoreboard players add $ScatterItemSlot ocblib.temp 1
    execute store success score $Temp.Removed ocblib.temp run data remove storage ocblib:_ ScatterItem.Scatter[0]
    execute if score $Temp.Removed ocblib.temp matches 1 if data storage ocblib:_ ScatterItem.Scatter[0] run function ocb.lib:scatter_item/loop