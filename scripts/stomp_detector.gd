extends Area2D

signal stomped

func _on_body_entered(body: Node2D):
    # 檢查進來的物體是否為玩家
    if body.is_in_group("player"):
        # 檢查玩家是不是從上往下掉落
        if body.velocity.y > 0:
            stomped.emit()
            # 讓玩家向上反彈，增加遊戲手感
            body.bounce()
