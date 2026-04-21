#> ocb.tou:death/totem/open_totem/_loop/make_lookup
## lookupを作成するループ

# CurrentItem in existing[Index]
    scoreboard players set $Temp.Get ocb.tou.temp 0
    $execute store success score $Temp.Get ocb.tou.temp run data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem set from storage ocb.tou:_ Temp.ProtectedItem.Stack.existing[$(Index)]

# Getが成功しなければbreak
    execute if score $Temp.Get ocb.tou.temp matches 0 run return fail


# 現在のスタック数と最大スタック数を取得する
    execute store result score $Temp.ItemCount ocb.tou.temp run data get storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem.count
    # if ItemCount == 0 then continue
        execute if score $Temp.ItemCount ocb.tou.temp matches 0 store result storage ocb.tou:_ Temp.ProtectedItem.Stack.Index int -1 run data get storage ocb.tou:_ Temp.ProtectedItem.Stack.Index -1.000000000001
        execute if score $Temp.ItemCount ocb.tou.temp matches 0 run return run function ocb.tou:death/totem/open_totem/_loop/make_lookup with storage ocb.tou:_ Temp.ProtectedItem.Stack
    execute store result score $Temp.MaxStackSize ocb.tou.temp run data get storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem.components."minecraft:max_stack_size"
    data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.GetCount set from storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem
    execute unless score $Temp.MaxStackSize ocb.tou.temp matches 1.. run function ocb.tou:death/totem/open_totem/util/get_stacksize

# ItemCountがMaxStackSize未満であれば記録する
    # if !(ItemCount < MaxStackSize) then continue
        execute unless score $Temp.ItemCount ocb.tou.temp < $Temp.MaxStackSize ocb.tou.temp store result storage ocb.tou:_ Temp.ProtectedItem.Stack.Index int -1 run data get storage ocb.tou:_ Temp.ProtectedItem.Stack.Index -1.000000000001
        execute unless score $Temp.ItemCount ocb.tou.temp < $Temp.MaxStackSize ocb.tou.temp run return run function ocb.tou:death/totem/open_totem/_loop/make_lookup with storage ocb.tou:_ Temp.ProtectedItem.Stack
    execute if data storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem.components run function ocb.tou:death/totem/open_totem/make_lookup/store_with_component with storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem
    execute unless data storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem.components run function ocb.tou:death/totem/open_totem/make_lookup/store with storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem

# ループ
    execute store result storage ocb.tou:_ Temp.ProtectedItem.Stack.Index int -1 run data get storage ocb.tou:_ Temp.ProtectedItem.Stack.Index -1.000000000001
    function ocb.tou:death/totem/open_totem/_loop/make_lookup with storage ocb.tou:_ Temp.ProtectedItem.Stack
