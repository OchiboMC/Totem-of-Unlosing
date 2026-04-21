#> ocb.tou:death/totem/open_totem/_loop/transfer
## スタック処理内でアイテムを移動させるループ

# CurrentSlot in lookup[Key][Index]
    $execute store success score $Temp.Get ocb.tou.temp run data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer.CurrentSlot set from storage ocb.tou:_ Temp.ProtectedItem.Stack.lookup.'$(Key)'[$(Index)]

# Getが成功しなければbreak
    execute if score $Temp.Get ocb.tou.temp matches 0 run return fail

# CurrentSlotのアイテムを取得
    function ocb.tou:death/totem/open_totem/transfer/get_slot with storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer

# 現在のスタック数と最大スタック数を取得する
    execute store result score $Temp.ItemCount ocb.tou.temp run data get storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer.CurrentItem.count
    execute store result score $Temp.MaxStackSize ocb.tou.temp run data get storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer.CurrentItem.components."minecraft:max_stack_size"
    data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.GetCount set from storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer.CurrentItem
    execute unless score $Temp.MaxStackSize ocb.tou.temp matches 1.. run function ocb.tou:death/totem/open_totem/util/get_stacksize

# TransferAmount = min(RemainingAmount, MaxStackSize - ItemCount)
    execute store result score $Temp.Capacity ocb.tou.temp run scoreboard players operation $Temp.MaxStackSize ocb.tou.temp -= $Temp.ItemCount ocb.tou.temp
    execute store result score $Temp.TransferAmount ocb.tou.temp run scoreboard players operation $Temp.Capacity ocb.tou.temp < $Temp.RemainingAmount ocb.tou.temp

# アイテムを移動させる
    execute store result storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer.CurrentItem.count int 1 run scoreboard players operation $Temp.ItemCount ocb.tou.temp += $Temp.TransferAmount ocb.tou.temp
    scoreboard players operation $Temp.RemainingAmount ocb.tou.temp -= $Temp.TransferAmount ocb.tou.temp

# CurrentItemから元のストレージに保存
    function ocb.tou:death/totem/open_totem/transfer/save_item with storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer

# RemainingAmountが0ならbreak
    execute if score $Temp.RemainingAmount ocb.tou.temp matches 0 run return fail

# ループ
    execute store result storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer.Index int -1 run data get storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer.Index -1.000000000001
    function ocb.tou:death/totem/open_totem/_loop/transfer with storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer