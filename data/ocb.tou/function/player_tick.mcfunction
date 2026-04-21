#> ocb.tou:player_tick
# 死んだときの処理
    execute if score @s ocb.tou.death_count matches 1.. unless items entity @s weapon.* music_disc_13[minecraft:custom_data~{totem_of_unlosing:true}] run function ocb.tou:death/vannila/
    execute if score @s ocb.tou.death_count matches 1.. if items entity @s weapon.* music_disc_13[minecraft:custom_data~{totem_of_unlosing:true}] run function ocb.tou:death/totem/

# 使ったときの処理
    execute if entity @s[tag=ocb.tou.used] run function ocb.tou:on_use/delay

# デススコアリセット
    scoreboard players set @s ocb.tou.death_count 0