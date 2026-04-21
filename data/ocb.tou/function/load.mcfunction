#> ocb.tou:load
# スコアオブジェクト作成
    scoreboard objectives add ocb.tou.death_count deathCount
    scoreboard objectives add ocb.tou.const dummy
    scoreboard objectives add ocb.tou.temp dummy

# 定数設定
    scoreboard players set $Const.DeathXpMultiplier.normal ocb.tou.const 7
    scoreboard players set $Const.DeathXpMax.normal ocb.tou.const 100
    scoreboard players set $Const.DeathXpMultiplier.totem ocb.tou.const 5
    scoreboard players set $Const.DeathXpMax.totem ocb.tou.const 85