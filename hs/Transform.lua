--------------------------------------------------------------------------------
-- 表示オブジェクトの基本クラスです。
-- 描画の為の基本的な機能を有します。
--
--------------------------------------------------------------------------------

require "hs/EventDispatcher"

Transform = EventDispatcher()

-- プロパティ定義
Transform:setPropertyDef("x", "setX", "getX")
Transform:setPropertyDef("y", "setY", "getY")
Transform:setPropertyDef("worldX", "setWorldX", "getWorldX")
Transform:setPropertyDef("worldY", "setWorldY", "getWorldY")
Transform:setPropertyDef("pivotX", "setPivotX", "getPivotX")
Transform:setPropertyDef("pivotY", "setPivotY", "getPivotY")
Transform:setPropertyDef("rotation", "setRotation", "getRotation")
Transform:setPropertyDef("scaleX", "setScaleX", "getScaleX")
Transform:setPropertyDef("scaleY", "setScaleY", "getScaleY")
Transform:setPropertyDef("parent", "setParent", "getParent")

-- getters
Transform:setGetter("transformObj", "getTransformObj")

---------------------------------------
--- コンストラクタです
---------------------------------------
function Transform:init()
    EventDispatcher.init(self)

    -- 変数
    self._transformObj = self:newTransformObj()
end

---------------------------------------
--- MOAITransformを生成して返します。
---------------------------------------
function Transform:newTransformObj()
    return MOAITransform.new()
end

function Transform:getTransformObj()
    return self._transformObj
end

---------------------------------------
-- ローカル座標を設定します。
---------------------------------------
function Transform:setLocation(x, y)
    local parent = self.parent
    if parent then
        x = x + parent.worldX
        y = y + parent.worldY
    end
    self:setWorldLocation(x, y)
end

---------------------------------------
-- ローカル座標を返します。
---------------------------------------
function Transform:getLocation()
    local parent = self.parent
    local x, y = self:getWorldLocation()
    if parent then
        local worldX, worldY = parent:getWorldLocation()
        x = x - worldX
        y = y - worldY
    end
    return x, y
end

---------------------------------------
-- ローカル座標を移動します。
---------------------------------------
function Transform:moveLocation(x, y, sec, mode, completeHandler)
    local action = self.transformObj:moveLoc(x, y, sec, mode)
    if completeHandler ~= nil then
        action:setListener(MOAIAction.EVENT_STOP, function(prop) completeHandler(self) end)
    end
end

---------------------------------------
-- X座標を設定します。
---------------------------------------
function Transform:setX(x)
    self:setLocation(x, self.y)
end

---------------------------------------
-- X座標を返します。
---------------------------------------
function Transform:getX()
    local x, y = self:getLocation()
    return x
end

---------------------------------------
-- Y座標を設定します。
---------------------------------------
function Transform:setY(y)
    self:setLocation(self.x, y)
end

---------------------------------------
-- Y座標を返します。
---------------------------------------
function Transform:getY()
    local x, y = self:getLocation()
    return y
end

---------------------------------------
-- 座標を設定します。
---------------------------------------
function Transform:setWorldLocation(x, y)
    x = x - self.pivotX
    y = y - self.pivotY
    self.transformObj:setLoc(x, y)
end

---------------------------------------
-- 座標を返します。
---------------------------------------
function Transform:getWorldLocation()
    local x, y = self.transformObj:getLoc()
    x = x + self.pivotX
    y = y + self.pivotY
    return x, y
end


---------------------------------------
-- X座標を設定します。
---------------------------------------
function Transform:setWorldX(x)
    self:setWorldLocation(x, self.y)
end

---------------------------------------
-- X座標を返します。
---------------------------------------
function Transform:getWorldX()
    local x, y = self:getWorldLocation()
    return x
end

---------------------------------------
-- Y座標を設定します。
---------------------------------------
function Transform:setWorldY(y)
    self:setWorldLocation(self.x, y)
end

---------------------------------------
-- Y座標を返します。
---------------------------------------
function Transform:getWorldY()
    local x, y = self:getWorldLocation()
    return y
end

---------------------------------------
-- rotationを設定します。
---------------------------------------
function Transform:setRotation(rotation)
    self.transformObj:setRot(rotation)
end

---------------------------------------
-- rotationを返します。
---------------------------------------
function Transform:getRotation()
    return self.transformObj:getRot()
end

---------------------------------------
-- 回転量を移動します。
---------------------------------------
function Transform:moveRotation(rotation, sec, mode, completeHandler)
    local action = self.transformObj:moveRot(rotation, sec, mode)
    if completeHandler then
        action:setListener(MOAIAction.EVENT_STOP, function() completeHandler(self) end)
    end
end


---------------------------------------
-- scaleX, scaleYを設定します。
---------------------------------------
function Transform:setScale(scaleX, scaleY)
    self.transformObj:setScl(scaleX, scaleY)
end

---------------------------------------
-- scaleX, scaleYを返します。
---------------------------------------
function Transform:getScale()
    return self.transformObj:getScl()
end

---------------------------------------
-- 回転量を移動します。
---------------------------------------
function Transform:moveScale(x, y, sec, mode, completeHandler)
    local action = self.transformObj:moveScl(x, y, sec, mode)
    if completeHandler then
        action:setListener(MOAIAction.EVENT_STOP, function() completeHandler(self) end)
    end
end

---------------------------------------
-- scaleXを設定します。
---------------------------------------
function Transform:setScaleX(scaleX)
    self:setScale(scaleX, self.scaleY)
end

---------------------------------------
-- scaleXを返します。
---------------------------------------
function Transform:getScaleX()
    local scaleX, scaleY = self:getScale()
    return scaleX
end

---------------------------------------
-- scaleYを設定します。
---------------------------------------
function Transform:setScaleY(scaleY)
    self:setScale(self.scaleX, scaleY)
end

---------------------------------------
-- scaleYを返します。
---------------------------------------
function Transform:getScaleY()
    local scaleX, scaleY = self:getScale()
    return scaleY
end

---------------------------------------
-- 中心点を設定します。
-- これは、回転や拡大・縮小で使用されます。
---------------------------------------
function Transform:setPivot(pivotX, pivotY)
    local x, y = self:getWorldLocation()
    self.transformObj:setPiv(pivotX, pivotY)
    self:setWorldLocation(x, y)
end

---------------------------------------
-- 中心点を返します。
---------------------------------------
function Transform:getPivot()
    return self.transformObj:getPiv()
end

---------------------------------------
-- 中心点を設定します。
-- これは、回転や拡大・縮小で使用されます。
---------------------------------------
function Transform:setPivotX(pivotX)
    self:setPivot(pivotX, self.pivotY)
end

---------------------------------------
-- pivotXを返します。
---------------------------------------
function Transform:getPivotX()
    local pivotX, pivotY = self:getPivot()
    return pivotX
end

---------------------------------------
-- 中心点を設定します。
-- これは、回転や拡大・縮小で使用されます。
---------------------------------------
function Transform:setPivotY(pivotY)
    self:setPivot(self.pivotX, pivotY)
end

---------------------------------------
-- pivotYを返します。
---------------------------------------
function Transform:getPivotY()
    local pivotX, pivotY = self:getPivot()
    return pivotY
end

---------------------------------------
-- 親オブジェクトを設定します。
-- 親オブジェクトはGroupである必要があります。
-- nilを設定した場合、親オブジェクトはクリアされます。
---------------------------------------
function Transform:setParent(parent)
    self._parent = parent
    if parent == nil or parent.getRenderPass then
        self.transformObj:setParent(nil)
    else
        self.transformObj:setParent(parent.transformObj)
    end

end

---------------------------------------
-- 親オブジェクトを返します。
---------------------------------------
function Transform:getParent(parent)
    return self._parent
end
