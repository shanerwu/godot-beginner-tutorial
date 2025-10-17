# godot-beginner-tutorial

透過 [How to make a Video Game - Godot Beginner Tutorial](https://youtu.be/LOhfqjmasi0) 實作學習 Godot 遊戲開發

### 開發環境
* Godot版本：4.5（影片版本為 4.2.1）

### 版本更新應對
* 影片中的 `TileMap` 在版本 4.3 後已被棄用，改用 `TileMapLayper`
    ```
	Game       	     Game
	├─ TileMap 	 →   ├─ TileMapLayper1（Mid）
    │                ├─ TileMapLayper2（Background）
	├─ Player  	     ├─ Player
    ├─ ...           ├─ ... 
	```
    * 不再於單一的 `TileMap` 節點管理多個圖層，而是以多個 `TileMapLayer` 節點代表不同圖層
    * 將背景的 `Z Index` 設定為 -1（預設為 0），避免蓋過中景
