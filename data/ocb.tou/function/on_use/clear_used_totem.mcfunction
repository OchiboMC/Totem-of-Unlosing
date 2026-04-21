#> ocb.tou:on_use/clear_used_totem
## 使用したトーテムを破壊
    execute if predicate {condition:"minecraft:value_check",value:{type:"minecraft:storage",storage:"ocb.tou:_",path:"Temp.UsedSlot"},range:-1b} run return run data remove storage ocb.tou:_ Temp.Player.Equipment.offhand
    $data remove storage ocb.tou:_ Temp.Player.Inventory[{Slot:$(UsedSlot)b}]