-- window
Application:openWindow("title", 480, 320)

-- scene
local scene = Scene:new()

-- sprite1
local sprite1 = Sprite:new("samples/images/cathead.png", {x = 10, y = 10, parent = scene})

-- spritesheet
local sprite2 = SpriteSheet:new("samples/images/actor.png", 3, 4, {x = 20 + sprite1.width, y = 10, parent = scene})
sprite2:moveFrames({1, 2, 3, 2, 1}, 0.25)

sprite2:addListener(Event.FRAME_LOOP,
    function(e)
        Log.debug("FRAME_LOOP!")
    end
)

-- graphics
local g = Graphics:new({x = 10, y = 20, width = 50, height = 50, parent = scene})
g:setPenColor(0, 1, 0, 1)
g:fillRect(0, 0, 50, 50)
g:setPenColor(1, 0, 0, 1)
g:setPenWidth(1)
g:drawRect(0, 0, 50, 50)

scene:openScene()

-- move
sprite1:move(50, 50, 1, nil,
    function(target)
        target:fadeOut(1, nil, function(target) target:fadeIn(1) end)
    end
)

