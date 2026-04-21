#> ocb.tou:death/totem/open_totem/transfer/save_item
## CurrentSlotのアイテムに情報を上書きするマクロ
    $data modify block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory[{Slot:$(CurrentSlot)b}] set from storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer.CurrentItem
    data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.existing set from block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory