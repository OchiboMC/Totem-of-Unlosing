#> ocb.tou:tick
# keepinventoryをonに
    gamerule keepInventory true

# playerTick
    execute as @a at @s run function ocb.tou:player_tick

# tempを消去
    scoreboard players reset * ocb.tou.temp
    data remove storage ocb.tou:_ Temp