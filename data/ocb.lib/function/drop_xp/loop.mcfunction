#> ocb.lib:drop_xp/loop
## オーブ生成ループ

# バニラの処理踏襲(?)
    execute if score $DropExp.Amount ocblib.temp matches 2477.. run function ocb.lib:drop_xp/_summon/ {Value:2477}
    execute if score $DropExp.Amount ocblib.temp matches 2477.. run scoreboard players remove $DropExp.Amount ocblib.temp 2477
    execute if score $DropExp.Amount ocblib.temp matches 1237.. run function ocb.lib:drop_xp/_summon/ {Value:1237}
    execute if score $DropExp.Amount ocblib.temp matches 1237.. run scoreboard players remove $DropExp.Amount ocblib.temp 1237
    execute if score $DropExp.Amount ocblib.temp matches 617.. run function ocb.lib:drop_xp/_summon/ {Value:617}
    execute if score $DropExp.Amount ocblib.temp matches 617.. run scoreboard players remove $DropExp.Amount ocblib.temp 617
    execute if score $DropExp.Amount ocblib.temp matches 307.. run function ocb.lib:drop_xp/_summon/ {Value:307}
    execute if score $DropExp.Amount ocblib.temp matches 307.. run scoreboard players remove $DropExp.Amount ocblib.temp 307
    execute if score $DropExp.Amount ocblib.temp matches 149.. run function ocb.lib:drop_xp/_summon/ {Value:149}
    execute if score $DropExp.Amount ocblib.temp matches 149.. run scoreboard players remove $DropExp.Amount ocblib.temp 149
    execute if score $DropExp.Amount ocblib.temp matches 73.. run function ocb.lib:drop_xp/_summon/ {Value:73}
    execute if score $DropExp.Amount ocblib.temp matches 73.. run scoreboard players remove $DropExp.Amount ocblib.temp 73
    execute if score $DropExp.Amount ocblib.temp matches 37.. run function ocb.lib:drop_xp/_summon/ {Value:37}
    execute if score $DropExp.Amount ocblib.temp matches 37.. run scoreboard players remove $DropExp.Amount ocblib.temp 37
    execute if score $DropExp.Amount ocblib.temp matches 17.. run function ocb.lib:drop_xp/_summon/ {Value:17}
    execute if score $DropExp.Amount ocblib.temp matches 17.. run scoreboard players remove $DropExp.Amount ocblib.temp 17
    execute if score $DropExp.Amount ocblib.temp matches 7.. run function ocb.lib:drop_xp/_summon/ {Value:7}
    execute if score $DropExp.Amount ocblib.temp matches 7.. run scoreboard players remove $DropExp.Amount ocblib.temp 7
    execute if score $DropExp.Amount ocblib.temp matches 3.. run function ocb.lib:drop_xp/_summon/ {Value:3}
    execute if score $DropExp.Amount ocblib.temp matches 3.. run scoreboard players remove $DropExp.Amount ocblib.temp 3
    execute if score $DropExp.Amount ocblib.temp matches 1.. run function ocb.lib:drop_xp/_summon/ {Value:1}
    execute if score $DropExp.Amount ocblib.temp matches 1.. run scoreboard players remove $DropExp.Amount ocblib.temp 1

# ループ
    execute if score $DropExp.Amount ocblib.temp matches 1.. run function ocb.lib:drop_xp/loop