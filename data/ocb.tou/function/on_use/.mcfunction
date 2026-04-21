#> ocb.tou:on_use/
## トーテムを使用した時の処理
# メインハンドのアイテムはディレイを掛けないといけないので、メインハンドだけ別のファイルに分けましょう

# トーテムの情報をオフハンドかメインハンドからとる(動作確認済み)
    execute store success score $Temp.InOffhand ocb.tou.temp if items entity @s weapon.offhand music_disc_13[minecraft:custom_data~{totem_of_unlosing_protected:1b}]
    execute store success score $Temp.InMainhand ocb.tou.temp if items entity @s weapon.mainhand music_disc_13[minecraft:custom_data~{totem_of_unlosing_protected:1b}]
    execute if score $Temp.InOffhand ocb.tou.temp matches 1 if score $Temp.InMainhand ocb.tou.temp matches 0 run data modify storage ocb.tou:_ Temp.UsedTotem set from entity @s equipment.offhand
    execute if score $Temp.InMainhand ocb.tou.temp matches 1 run data modify storage ocb.tou:_ Temp.UsedTotem set from entity @s SelectedItem

# インベントリをストレージに移植
    data modify storage ocb.tou:_ Temp.Player.Inventory set from entity @s Inventory
    data modify storage ocb.tou:_ Temp.Player.Equipment set from entity @s equipment

# トーテムを消す
    execute if score $Temp.InOffhand ocb.tou.temp matches 1 if score $Temp.InMainhand ocb.tou.temp matches 0 run data modify storage ocb.tou:_ Temp.UsedSlot set value -1b
    execute if score $Temp.InMainhand ocb.tou.temp matches 1 run data modify storage ocb.tou:_ Temp.UsedSlot set from entity @s SelectedItemSlot
    function ocb.tou:on_use/clear_used_totem with storage ocb.tou:_ Temp

# 演出
    playsound entity.warden.heartbeat master @a ~ ~ ~ 1 0.8
    playsound entity.wither.break_block master @a ~ ~ ~ 0.5 2
    playsound minecraft:item.ominous_bottle.dispose master @a ~ ~ ~ 1 0.9
    playsound event.mob_effect.raid_omen master @s ~ ~ ~ 0.5 1.3 1
    particle minecraft:reverse_portal ~ ~1 ~ 0.2 0.5 0.2 1 100
    particle minecraft:soul ~ ~1 ~ 0.2 0.5 0.2 0.1 10

# 保存されたアイテムのデータを避難
    data modify storage ocb.tou:_ Temp.OnUse.Inventory set from storage ocb.tou:_ Temp.UsedTotem.components."minecraft:custom_data".protected_items.inventory
    data modify storage ocb.tou:_ Temp.OnUse.Equipment set from storage ocb.tou:_ Temp.UsedTotem.components."minecraft:custom_data".protected_items.equipment
    data modify storage ocb.tou:_ Temp.UUID set from entity @s UUID[0]
    function ocb.tou:on_use/player_storage_set with storage ocb.tou:_ Temp

# xpをもらおう
    function ocb.tou:on_use/xp_get with storage ocb.tou:_ Temp.UsedTotem.components."minecraft:custom_data"

# 持ち物はぶちまける
    data modify storage ocblib:_ ScatterItem.Scatter set from storage ocb.tou:_ Temp.Player.Inventory
    data modify storage ocblib:_ ScatterItem.Scatter append from storage ocb.tou:_ Temp.Player.Equipment.head
    data modify storage ocblib:_ ScatterItem.Scatter append from storage ocb.tou:_ Temp.Player.Equipment.chest
    data modify storage ocblib:_ ScatterItem.Scatter append from storage ocb.tou:_ Temp.Player.Equipment.legs
    data modify storage ocblib:_ ScatterItem.Scatter append from storage ocb.tou:_ Temp.Player.Equipment.feet
    data modify storage ocblib:_ ScatterItem.Scatter append from storage ocb.tou:_ Temp.Player.Equipment.offhand
    clear @s

# アイテムリクエストタグ
    tag @s add ocb.tou.used

# リセット
    data remove storage ocb.tou:_ Temp.OnUse
    advancement revoke @s only ocb.tou:totem_of_unlosing