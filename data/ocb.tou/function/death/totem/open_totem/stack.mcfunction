#> ocb.tou:death/totem/open_totem/stack
## O(n+m)でスタックさせよう

# こんにちは、シュルカーボックス
    setblock 1 -64 0 white_shulker_box

# Indexのインクリメントを1コマンドで可能にするため1-indexedのデータを作成する
    data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.existing set from block 0 -64 0 Items[0].components."minecraft:custom_data".protected_items.inventory
    data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.existing prepend value ""
    data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.incoming prepend value ""

# ルックアップ作成ループ
    data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.Index set value 1
    function ocb.tou:death/totem/open_totem/_loop/make_lookup with storage ocb.tou:_ Temp.ProtectedItem.Stack

# リセット
    data remove storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem

# スタックループ
    data modify storage ocb.tou:_ Temp.ProtectedItem.Stack.Index set value 1
    function ocb.tou:death/totem/open_totem/_loop/stack with storage ocb.tou:_ Temp.ProtectedItem.Stack

# リセット
    data remove storage ocb.tou:_ Temp.ProtectedItem.Stack.CurrentItem

# さようなら、シュルカーボックス
    setblock 1 -64 0 bedrock