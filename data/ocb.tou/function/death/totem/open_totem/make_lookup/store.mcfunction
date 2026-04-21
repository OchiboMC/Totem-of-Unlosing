#> ocb.tou:death/totem/open_totem/make_lookup/store
## スロットを保存

# 1-indexed
    $execute unless data storage ocb.tou:_ Temp.ProtectedItem.Stack.lookup.'$(id)' run data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.lookup.'$(id)' set value [""]
    $data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.lookup.'$(id)' append value $(Slot)