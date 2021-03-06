--------------------------------------------------------------------------------
-- 単一のテクスチャを描画する為のクラスです。
--
--------------------------------------------------------------------------------

Sprite = DisplayObject()

-- プロパティ定義
Sprite:setPropertyName("texture")

---------------------------------------
-- コンストラクタです
---------------------------------------
function Sprite:init(texture, params)
    Sprite:super(self)
    
    self._initialized = false

    -- 初期化
    if texture then
        self:setTexture(texture)
    end
    if params then
        table.copy(params, self)
    end
    
    self._initialized = true
end

---------------------------------------
-- MOAIDeckを生成します。
---------------------------------------
function Sprite:newDeck()
    local deck = MOAIGfxQuad2D.new()
    deck:setUVRect(0, 0, 1, 1)
    return deck
end

---------------------------------------
-- テキスチャを設定します。
-- サイズも自動で設定されます。
---------------------------------------
function Sprite:setTexture(texture)
    if type(texture) == "string" then
        texture = TextureCache:get(texture)
    end
    
    if not self._initialized and texture then
        local width, height = texture:getSize()
        self:setSize(width, height)
    end

    self.deck:setTexture(texture)
    self._texture = texture
end

function Sprite:getTexture()
    return self._texture
end

---------------------------------------
-- 表示オブジェクトのサイズを設定します。
---------------------------------------
function Sprite:setSize(width, height)
    DisplayObject.setSize(self, width, height)
    self.deck:setRect(0, 0, self.width, self.height)
end
