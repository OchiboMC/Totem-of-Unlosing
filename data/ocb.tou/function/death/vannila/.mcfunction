#> ocb.tou:death/vannila/
## 死んだのでアイテムと経験値をぶちまけよう

# アイテムぶちまき準備
    data modify storage ocblib:_ ScatterItem.Scatter set from entity @s Inventory
    data modify storage ocblib:_ ScatterItem.Scatter append from entity @s equipment.head
    data modify storage ocblib:_ ScatterItem.Scatter append from entity @s equipment.chest
    data modify storage ocblib:_ ScatterItem.Scatter append from entity @s equipment.legs
    data modify storage ocblib:_ ScatterItem.Scatter append from entity @s equipment.feet
    data modify storage ocblib:_ ScatterItem.Scatter append from entity @s equipment.offhand

# xpぶちまき準備
    execute store result score $DropExp.Amount ocblib.temp run function ocb.tou:death/vannila/get_exp_to_drop
    
# ぶちまく
    function ocb.lib:scatter_item/ {motion_scale:3,delay:40}
    function ocb.lib:drop_xp/

# クリア
    clear @s
    xp set @s 0 levels
    xp set @s 0 points