#> ocb.tou:on_use/inventory_restore/unknown_slot_items
## 復元できない(Slotが127bのアイテム)をScatterItemに格納する
    data modify storage ocblib:_ ScatterItem.Scatter append from storage ocb.tou:_ Temp.Restore.Inventory[-1]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[-1]
    scoreboard players remove $Temp.Restore.UnknownSlotItemLength ocb.tou.temp 1
    execute if score $Temp.Restore.UnknownSlotItemLength ocb.tou.temp matches 1.. run function ocb.tou:on_use/inventory_restore/unknown_slot_items