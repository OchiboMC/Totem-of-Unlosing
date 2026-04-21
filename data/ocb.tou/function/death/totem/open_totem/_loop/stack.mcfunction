#> ocb.tou:death/totem/open_totem/_loop/stack
## スタックさせるループ

# CurrentItem in incoming[Index]
    $execute store success score $Temp.Get ocb.tou.temp run data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem set from storage ocb.tou:_ Temp.ProtectedItem.Stack.incoming[$(Index)]

# Getが成功しなければbreak
    execute if score $Temp.Get ocb.tou.temp matches 0 run return fail


# キーを取得
    execute if data storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem.components run function ocb.tou:death/totem/open_totem/stack/get_key_with_component with storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem
    execute unless data storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem.components run function ocb.tou:death/totem/open_totem/stack/get_key with storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem

# キーがlookupに存在するか確認
    execute store success score $Temp.Exists ocb.tou.temp run function ocb.tou:death/totem/open_totem/stack/exists with storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer
    # if !exists then ProcessedItemに保存 & continue
        execute if score $Temp.Exists ocb.tou.temp matches 0 run data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem.Slot set value 127b
        execute if score $Temp.Exists ocb.tou.temp matches 0 run data modify storage ocb.tou:_ Temp.ProtectedItem.ProcessedItem append from storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem
        execute if score $Temp.Exists ocb.tou.temp matches 0 store result storage ocb.tou:_ Temp.ProtectedItem.Stack.Index int -1 run data get storage ocb.tou:_ Temp.ProtectedItem.Stack.Index -1.000000000001
        execute if score $Temp.Exists ocb.tou.temp matches 0 run return run function ocb.tou:death/totem/open_totem/_loop/stack with storage ocb.tou:_ Temp.ProtectedItem.Stack

# 現在のアイテムの個数を取得
    execute store result score $Temp.RemainingAmount ocb.tou.temp run data get storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem.count

# 存在すればループでlookupからSlotを取得してアイテムを移動させる
    data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer.Index set value 1
    function ocb.tou:death/totem/open_totem/_loop/transfer with storage ocb.tou:_ Temp.ProtectedItem.Stack.Transfer

# 余ったものをProcessedItemに保存する
    execute if score $Temp.RemainingAmount ocb.tou.temp matches 1.. run data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem.Slot set value 127b
    execute if score $Temp.RemainingAmount ocb.tou.temp matches 1.. store result storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem.count int 1 run scoreboard players get $Temp.RemainingAmount ocb.tou.temp
    execute if score $Temp.RemainingAmount ocb.tou.temp matches 1.. run data modify storage ocb.tou:_ Temp.ProtectedItem.ProcessedItem append from storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem

# ループ
    execute store result storage ocb.tou:_ Temp.ProtectedItem.Stack.Index int -1 run data get storage ocb.tou:_ Temp.ProtectedItem.Stack.Index -1.000000000001
    function ocb.tou:death/totem/open_totem/_loop/stack with storage ocb.tou:_ Temp.ProtectedItem.Stack