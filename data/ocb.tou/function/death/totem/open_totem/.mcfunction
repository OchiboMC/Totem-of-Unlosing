#> ocb.tou:death/totem/open_totem/
## ループでトーテムを解体してアイテムに格納する

# 今見ているアイテムはトーテムですか？

    # 判定する
        $execute store success score $Temp.IsTotem ocb.tou.temp if data block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory[$(Index)].components."minecraft:custom_data".totem_of_unlosing_protected
        
    # トーテムではない
        execute if score $Temp.IsTotem ocb.tou.temp matches 0 store result storage ocb.tou:_ Temp.ProtectedItem.Index int 1 run scoreboard players add $Temp.ProtectedItem.Index ocb.tou.temp 1
        execute if score $Temp.IsTotem ocb.tou.temp matches 0 if score $Temp.ProtectedItem.Index ocb.tou.temp < $Temp.ProtectedItem.Length ocb.tou.temp run function ocb.tou:death/totem/open_totem/ with storage ocb.tou:_ Temp.ProtectedItem
        execute if score $Temp.IsTotem ocb.tou.temp matches 0 run return fail

    # トーテムなら解体し、スタックさせたうえで格納する
        $data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.incoming set from block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory[$(Index)].components."minecraft:custom_data".protected_items.inventory
        $data modify storage ocb.tou:_ Temp.ProtectedItem.Equipment set from block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory[$(Index)].components."minecraft:custom_data".protected_items.equipment
        $data remove block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory[$(Index)]
        function ocb.tou:death/totem/open_totem/stack
        execute if data storage ocb.tou:_ Temp.ProtectedItem.Equipment.head run data modify storage ocb.tou:_ Temp.ProtectedItem.Equipment.head merge value {Slot:127b}
        execute if data storage ocb.tou:_ Temp.ProtectedItem.Equipment.chest run data modify storage ocb.tou:_ Temp.ProtectedItem.Equipment.chest merge value {Slot:127b}
        execute if data storage ocb.tou:_ Temp.ProtectedItem.Equipment.legs run data modify storage ocb.tou:_ Temp.ProtectedItem.Equipment.legs merge value {Slot:127b}
        execute if data storage ocb.tou:_ Temp.ProtectedItem.Equipment.feet run data modify storage ocb.tou:_ Temp.ProtectedItem.Equipment.feet merge value {Slot:127b}
        execute if data storage ocb.tou:_ Temp.ProtectedItem.Equipment.offhand run data modify storage ocb.tou:_ Temp.ProtectedItem.Equipment.offhand merge value {Slot:127b}
        data modify block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory append from storage ocb.tou:_ Temp.ProtectedItem.ProcessedItem[]
        data modify block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory append from storage ocb.tou:_ Temp.ProtectedItem.Equipment.head
        data modify block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory append from storage ocb.tou:_ Temp.ProtectedItem.Equipment.chest
        data modify block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory append from storage ocb.tou:_ Temp.ProtectedItem.Equipment.legs
        data modify block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory append from storage ocb.tou:_ Temp.ProtectedItem.Equipment.feet
        data modify block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory append from storage ocb.tou:_ Temp.ProtectedItem.Equipment.offhand

    # リセットとループ
        data remove storage ocb.tou:_ Temp.ProtectedItem.Stack
        data remove storage ocb.tou:_ Temp.ProtectedItem.Equipment
        data remove storage ocb.tou:_ Temp.ProtectedItem.ProcessedItem
        execute if score $Temp.ProtectedItem.Index ocb.tou.temp < $Temp.ProtectedItem.Length ocb.tou.temp run function ocb.tou:death/totem/open_totem/ with storage ocb.tou:_ Temp.ProtectedItem

