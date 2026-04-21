#> ocb.lib:random_motion/
## ランダムなモーションを生み出す

# 生成
    $execute store result storage ocblib:_ RandomMotion.X double 0.00001 run random value -$(x_range)0000..$(x_range)0000
    $execute store result storage ocblib:_ RandomMotion.Y double 0.00001 run random value -$(y_range)0000..$(y_range)0000
    $execute store result storage ocblib:_ RandomMotion.Z double 0.00001 run random value -$(z_range)0000..$(z_range)0000