#> ocb.tou:on_use/player_storage_get
## プレイヤーストレージから取得

# 取得
    $data modify storage ocb.tou:_ Temp.Restore.Inventory set from storage ocb.tou:_ Player.$(UUID).Inventory
    $data modify storage ocb.tou:_ Temp.Restore.Equipment set from storage ocb.tou:_ Player.$(UUID).Equipment