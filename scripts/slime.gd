extends Node2D


const SPEED = 60
const GRAVITY = 980

var direction = 1
var is_dying = false
var velocity = Vector2.ZERO

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $Killzone/CollisionShape2D


func _process(delta: float) -> void:
    if is_dying:
        velocity.y += GRAVITY * delta
        position += velocity * delta
        
        # 添加旋轉效果
        rotation += direction * 5 * delta  # 旋轉速度可以調整
        
        # 檢查是否已經掉出畫面外
        var viewport_rect = get_viewport_rect()
        if position.y > viewport_rect.size.y + 100:  # 給一些額外的邊界
            queue_free()
        return
    
    if ray_cast_right.is_colliding():
        direction = -1
        animated_sprite.flip_h = true
    if ray_cast_left.is_colliding():
        direction = 1
        animated_sprite.flip_h = false
    
    position.x += direction * SPEED * delta;


func _on_stomp_detector_stomped() -> void:
    if is_dying:
        return
    dying()


func dying():
    is_dying = true
    # 禁用碰撞和檢測
    collision_shape.set_deferred("disabled", true)
    ray_cast_right.enabled = false
    ray_cast_left.enabled = false
    
    # 設定初始下落速度（可以添加一些向上的初始速度使其先彈起）
    velocity = Vector2(direction * SPEED * 0.5, -100)
    
    animated_sprite.flip_h = (direction < 0)
    animated_sprite.play("death")
    
