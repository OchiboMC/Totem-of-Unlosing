#> ocb.tou:death/totem/open_totem/transfer/get_slot
## CurrentSlotのアイテムを取得するマクロ
    $data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer.CurrentItem set from storage ocb.tou:_ Temp.ProtectedItem.Stack.existing[{Slot:$(CurrentSlot)b}]