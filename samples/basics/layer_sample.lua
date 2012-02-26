-- scene
layer_sample = Scene:new()
local scene = layer_sample

function scene:onOpen()
    -- The child who can add to Scene is only Layer.
    -- When Group is specified as Scene, a child is added to TopLayer. 
    
    -- layer1
    local layer1 = Layer:new()
    layer1.parent = scene
    layer1:addChild(Sprite:new("samples/images/cathead.png", {x = 0, y = 0}))
    layer1:addChild(Sprite:new("samples/images/cathead.png", {x = 64, y = 64}))
    
    -- layer2
    local layer2 = Layer:new()
    layer2.parent = scene
    layer2:addChild(Sprite:new("samples/images/cathead.png", {x = 32, y = 32}))
    layer2:addChild(Sprite:new("samples/images/cathead.png", {x = 96, y = 96}))
    
    -- camera
    layer2.camera:move(100, 100, 3)
end

-- close event
function scene:onClose(event)
end
