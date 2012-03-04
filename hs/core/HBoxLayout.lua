----------------------------------------------------------------
-- デフォルトで水平方向にオブジェクトを配置するBoxLayoutです
----------------------------------------------------------------
HBoxLayout = BoxLayout()

---------------------------------------
-- コンストラクタです
---------------------------------------
function HBoxLayout:init(params)
    HBoxLayout:super(self, params)
    self.direction = BoxLayout.DIRECTION_H
end
