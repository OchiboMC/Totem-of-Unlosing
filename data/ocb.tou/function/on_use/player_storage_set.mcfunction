#> ocb.tou:on_use/player_storage
## 各プレイヤー用のストレージに保存するマクロ

# 保存
    $data modify storage ocb.tou:_ Player.$(UUID).Inventory set from storage ocb.tou:_ Temp.OnUse.Inventory
    $data modify storage ocb.tou:_ Player.$(UUID).Equipment set from storage ocb.tou:_ Temp.OnUse.Equipment