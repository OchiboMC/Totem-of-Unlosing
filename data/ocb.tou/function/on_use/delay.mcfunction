#> ocb.tou:on_use/delay
## advancementのrewardのfunctionでメインハンドを変えるとバグるのでディレイを掛けましょうね

# データを取り出そう
    data modify storage ocb.tou:_ Temp.UUID set from entity @s UUID[0]
    function ocb.tou:on_use/player_storage_get with storage ocb.tou:_ Temp

# こんにちは、シュルカーボックス
    forceload add 0 0 1 0
    setblock 0 -64 0 white_shulker_box
    
# Slotが127bのものはドロップ用ライブラリにぶち込む
    execute store result score $Temp.Restore.UnknownSlotItemLength ocb.tou.temp if data storage ocb.tou:_ Temp.Restore.Inventory[{Slot:127b}]
    execute if score $Temp.Restore.UnknownSlotItemLength ocb.tou.temp matches 1.. run function ocb.tou:on_use/inventory_restore/unknown_slot_items

# 元の配置に戻そうとしてみよう
    function ocb.tou:on_use/inventory_restore/

# さようなら、シュルカーボックス
    setblock 0 -64 0 bedrock
    forceload remove 0 0 1 0
    
# ぶちまけ
    function ocb.lib:scatter_item/ {motion_scale:2,delay:5}

# リセット
    tag @s remove ocb.tou.used
    data remove storage ocb.tou:_ Temp.Restore