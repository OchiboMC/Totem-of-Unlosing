#> ocb.tou:death/totem/get_exp_to_drop
## 死んだときのxp減衰(多め)

## out = max(level*5,75)
    execute store result score $Temp.Out ocb.tou.temp run xp query @s levels
    scoreboard players operation $Temp.Out ocb.tou.temp *= $Const.DeathXpMultiplier.totem ocb.tou.const
    execute if score $Temp.Out ocb.tou.temp >= $Const.DeathXpMax.totem ocb.tou.const run scoreboard players operation $Temp.Out ocb.tou.temp = $Const.DeathXpMax.totem ocb.tou.const
    return run scoreboard players get $Temp.Out ocb.tou.temp