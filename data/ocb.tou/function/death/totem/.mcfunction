#> ocb.tou:death/totem/
## インベントリをアイテムに保存

# 演出
    playsound entity.warden.sonic_charge master @a ~ ~ ~ 1 0.72
    playsound block.trial_spawner.ambient master @a ~ ~ ~ 1 1
    playsound block.trial_spawner.ambient_ominous master @a ~ ~ ~ 1 1
    playsound event.mob_effect.bad_omen master @s ~ ~ ~ 0.9 0.6 1
    particle minecraft:portal ~ ~1 ~ 0.2 0.5 0.2 1 1000

# トーテムの情報をオフハンドかメインハンドからとる
    execute store success score $Temp.InOffhand ocb.tou.temp if items entity @s weapon.offhand music_disc_13[minecraft:custom_data~{totem_of_unlosing:1b}]
    execute store success score $Temp.InMainhand ocb.tou.temp if items entity @s weapon.mainhand music_disc_13[minecraft:custom_data~{totem_of_unlosing:1b}]

# トーテムを消す
    execute if score $Temp.InOffhand ocb.tou.temp matches 1 if score $Temp.InMainhand ocb.tou.temp matches 0 run item replace entity @s weapon.offhand with air
    execute if score $Temp.InMainhand ocb.tou.temp matches 1 run item replace entity @s weapon.mainhand with air

# 新たなアイテムをシュルカーボックスに格納
    forceload add 0 0 1 0
    setblock 0 -64 0 white_shulker_box
    loot replace block 0 -64 0 container.0 loot ocb.tou:totem_of_unlosing_protected

# アイテムに情報を保存
    data modify block 0 -64 0 Items[{Slot:0b}].components."minecraft:custom_data".protected_items.inventory set from entity @s Inventory
    # 格納されたアイテムを探索してトーテムを解体する
        execute store result score $Temp.ProtectedItem.Length ocb.tou.temp if data block 0 -64 0 Items[{Slot:0b}].components."minecraft:custom_data".protected_items.inventory[]
        scoreboard players set $Temp.ProtectedItem.Index ocb.tou.temp 0
        data modify storage ocb.tou:_ Temp.ProtectedItem.Index set value 0
        function ocb.tou:death/totem/open_totem/ with storage ocb.tou:_ Temp.ProtectedItem
    # 60個しか保持できないようにする
        execute if data block 0 -64 0 Items[{Slot:0b}].components."minecraft:custom_data".protected_items.inventory[60] run function ocb.tou:death/totem/clump_items
        #ドロップ
            function ocb.lib:scatter_item/ {motion_scale:3, delay:20}
    data modify block 0 -64 0 Items[{Slot:0b}].components."minecraft:custom_data".protected_items.equipment set from entity @s equipment
    execute store result block 0 -64 0 Items[{Slot:0b}].components."minecraft:custom_data".exp int 1 run function ocb.tou:death/totem/get_exp_to_drop

# クリア
    clear @s
    xp set @s 0 levels
    xp set @s 0 points

# アイテムを渡す
    loot give @s mine 0 -64 0 debug_stick

# ブロックを消滅
    setblock 0 -64 0 bedrock
    forceload remove 0 0 0 0
