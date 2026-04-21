#> ocb.tou:on_use/inventory_restore/
## 復元
# アイテム復元のため、一度ストレージから出せるものだけシュルカーボックスに移動する
    data modify block 0 -64 0 Items set from storage ocb.tou:_ Temp.Restore.Inventory

# そしてゴリ押しである
    item replace entity @s container.0 from block 0 -64 0 container.0
    item replace entity @s container.1 from block 0 -64 0 container.1
    item replace entity @s container.2 from block 0 -64 0 container.2
    item replace entity @s container.3 from block 0 -64 0 container.3
    item replace entity @s container.4 from block 0 -64 0 container.4
    item replace entity @s container.5 from block 0 -64 0 container.5
    item replace entity @s container.6 from block 0 -64 0 container.6
    item replace entity @s container.7 from block 0 -64 0 container.7
    item replace entity @s container.8 from block 0 -64 0 container.8
    item replace entity @s container.9 from block 0 -64 0 container.9
    item replace entity @s container.10 from block 0 -64 0 container.10
    item replace entity @s container.11 from block 0 -64 0 container.11
    item replace entity @s container.12 from block 0 -64 0 container.12
    item replace entity @s container.13 from block 0 -64 0 container.13
    item replace entity @s container.14 from block 0 -64 0 container.14
    item replace entity @s container.15 from block 0 -64 0 container.15
    item replace entity @s container.16 from block 0 -64 0 container.16
    item replace entity @s container.17 from block 0 -64 0 container.17
    item replace entity @s container.18 from block 0 -64 0 container.18
    item replace entity @s container.19 from block 0 -64 0 container.19
    item replace entity @s container.20 from block 0 -64 0 container.20
    item replace entity @s container.21 from block 0 -64 0 container.21
    item replace entity @s container.22 from block 0 -64 0 container.22
    item replace entity @s container.23 from block 0 -64 0 container.23
    item replace entity @s container.24 from block 0 -64 0 container.24
    item replace entity @s container.25 from block 0 -64 0 container.25
    item replace entity @s container.26 from block 0 -64 0 container.26

# さようなら、用済みのデータ
    data remove block 0 -64 0 Items
    data modify block 0 -64 0 Items set value [{Slot:0b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:1b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:2b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:3b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:4b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:5b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:6b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:7b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:8b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:9b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:10b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:11b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:12b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}},{Slot:13b,id:"minecraft:stick",components:{"minecraft:custom_data":{ocb.temp:1b}}}]
    data get block 0 -64 0

# 要らないのを消してずらす
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:0b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:1b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:2b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:3b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:4b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:5b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:6b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:7b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:8b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:9b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:10b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:11b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:12b}]
    data remove storage ocb.tou:_ Temp.Restore.Inventory[{Slot:13b}]
    data modify storage ocb.tou:_ Temp.Restore.Inventory[{Slot:27b}] merge value {Slot:0b}
    data modify storage ocb.tou:_ Temp.Restore.Inventory[{Slot:28b}] merge value {Slot:1b}
    data modify storage ocb.tou:_ Temp.Restore.Inventory[{Slot:29b}] merge value {Slot:2b}
    data modify storage ocb.tou:_ Temp.Restore.Inventory[{Slot:30b}] merge value {Slot:3b}
    data modify storage ocb.tou:_ Temp.Restore.Inventory[{Slot:31b}] merge value {Slot:4b}
    data modify storage ocb.tou:_ Temp.Restore.Inventory[{Slot:32b}] merge value {Slot:5b}
    data modify storage ocb.tou:_ Temp.Restore.Inventory[{Slot:33b}] merge value {Slot:6b}
    data modify storage ocb.tou:_ Temp.Restore.Inventory[{Slot:34b}] merge value {Slot:7b}
    data modify storage ocb.tou:_ Temp.Restore.Inventory[{Slot:35b}] merge value {Slot:8b}


# 入りきらなかったアイテムをストレージから移植
    data modify block 0 -64 0 Items set from storage ocb.tou:_ Temp.Restore.Inventory
    data modify block 0 -64 0 Items[{Slot:9b}] merge from storage ocb.tou:_ Temp.Restore.Equipment.head
    data modify block 0 -64 0 Items[{Slot:10b}] merge from storage ocb.tou:_ Temp.Restore.Equipment.chest
    data modify block 0 -64 0 Items[{Slot:11b}] merge from storage ocb.tou:_ Temp.Restore.Equipment.legs
    data modify block 0 -64 0 Items[{Slot:12b}] merge from storage ocb.tou:_ Temp.Restore.Equipment.feet
    data modify block 0 -64 0 Items[{Slot:13b}] merge from storage ocb.tou:_ Temp.Restore.Equipment.offhand

# そしてゴリ押しである 2nd season
    item replace entity @s container.27 from block 0 -64 0 container.0
    item replace entity @s container.28 from block 0 -64 0 container.1
    item replace entity @s container.29 from block 0 -64 0 container.2
    item replace entity @s container.30 from block 0 -64 0 container.3
    item replace entity @s container.31 from block 0 -64 0 container.4
    item replace entity @s container.32 from block 0 -64 0 container.5
    item replace entity @s container.33 from block 0 -64 0 container.6
    item replace entity @s container.34 from block 0 -64 0 container.7
    item replace entity @s container.35 from block 0 -64 0 container.8
    item replace entity @s armor.head from block 0 -64 0 container.9
    item replace entity @s armor.chest from block 0 -64 0 container.10
    item replace entity @s armor.legs from block 0 -64 0 container.11
    item replace entity @s armor.feet from block 0 -64 0 container.12
    item replace entity @s weapon.offhand from block 0 -64 0 container.13
    clear @a *[custom_data~{ocb.temp:1b}]