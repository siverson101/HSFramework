module(..., package.seeall)

-- create event
function onCreate()
    scene.sceneOpenAnimation = SceneAnimation.now
    scene.sceneCloseAnimation = SceneAnimation.now
    
    -- scrollView
    scrollView = ScrollView:new({parent = scene, layout = VBoxLayout:new()})

    -- sample list
    for i, item in ipairs(sceneItems) do
        local button = Button:new(
            {text = item.text, width = 200, height = 30, parent = scrollView,
            onTouchDown = onTouchDown_button, sceneName = item.scene})
    end
end

-- scene names
sceneItems ={
    {text = "sprite_sample", scene = "samples/basics/sprite_sample"},
    {text = "mapsprite_sample", scene = "samples/basics/mapsprite_sample"},
    {text = "group_sample", scene = "samples/basics/group_sample"},
    {text = "layer_sample", scene = "samples/basics/layer_sample"},
    {text = "scene_sample", scene = "samples/basics/scene1_sample"},
    {text = "textlabel_sample", scene = "samples/basics/textlabel_sample"},
    {text = "anime_basic_sample", scene = "samples/animations/anime_basic_sample"},
    {text = "anime_fade_sample", scene = "samples/animations/anime_fade_sample"},
    {text = "anime_group_sample", scene = "samples/animations/anime_group_sample"},
    {text = "tmxmap1_sample", scene = "samples/maps/tmxmap1_sample"},
    {text = "tmxmap2_sample", scene = "samples/maps/tmxmap2_sample"},
    {text = "box2d_body_sample", scene = "samples/box2d/box2d_body_sample"},
    {text = "button_sample", scene = "samples/gui/button_sample"},
    {text = "fps_sample", scene = "samples/utils/fps_sample"}
}

-- touch event
function onTouchDown_button(self, event)
    Log.info("label touch!" .. self.sceneName)
    SceneManager:openNextScene(self.sceneName)
end

