#> ocb.lib:drop_xp/_summon/
## ランダムモーションを適応して生成する

#declare entity foo

# ランダムモーションを生成
    function ocb.lib:random_motion/ {x_range:2,y_range:2,z_range:5}

# データの準備
    data modify storage ocblib:_ DropExp.X set from storage ocblib:_ RandomMotion.X
    data modify storage ocblib:_ DropExp.Z set from storage ocblib:_ RandomMotion.Z
    $data modify storage ocblib:_ DropExp.Amount set value $(Value)

# オーブ生成
    function ocb.lib:drop_xp/_summon/exe with storage ocblib:_ DropExp