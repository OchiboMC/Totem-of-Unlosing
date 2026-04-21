#> ocb.tou:death/totem/open_totem/util/get_stacksize
## スタックサイズ取得(1 or 16 or 64)

# 64個でセットする
    data remove storage ocb.tou:_ Temp.ProtectedItem.Stack.GetCount.Slot
    data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.GetCount merge value {count:64}
    data modify block 1 -64 0 Items append from storage ocb.tou:_ Temp.ProtectedItem.Stack.GetCount

# 置きなおすことで最大値にclampする
    item replace block 1 -64 0 container.0 from block 1 -64 0 container.0

# スタック数を取得
    execute store result score $Temp.MaxStackSize ocb.tou.temp run data get block 1 -64 0 Items[0].count

# リセット
    data remove block 1 -64 0 Items[]
    data remove storage ocb.tou:_ Temp.ProtectedItem.Stack.GetCount