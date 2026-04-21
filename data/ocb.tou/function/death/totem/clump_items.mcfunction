#> ocb.tou:death/totem/clump_items
## アイテムを60要素分しか持てないようにする

# データをドロップ用に格納&ループ
    data modify storage ocblib:_ ScatterItem.Scatter append from block 0 -64 0 Items[{Slot:0b}].components."minecraft:custom_data".protected_items.inventory[60]
    data remove block 0 -64 0 Items[{Slot:0b}].components."minecraft:custom_data".protected_items.inventory[60]
    execute if data block 0 -64 0 Items[{Slot:0b}].components."minecraft:custom_data".protected_items.inventory[60] run function ocb.tou:death/totem/clump_items