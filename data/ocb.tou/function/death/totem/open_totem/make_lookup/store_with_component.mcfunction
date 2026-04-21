#> ocb.tou:death/totem/open_totem/make_lookup/store_with_component
## スロットを保存

# 1-indexedでスロットを保存
    $execute unless data storage ocb.tou:_ Temp.ProtectedItem.Stack.lookup.'$(id)_$(components)' run data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.lookup.'$(id)_$(components)' set value [""]
    $data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.lookup.'$(id)_$(components)' append value $(Slot)