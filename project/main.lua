function love.load()
    -- Dimensions of the game window
    window_width = love.graphics.getWidth()
    window_height = love.graphics.getHeight()
    
    -- Need this to create classes and objects
    Object = require "classic"

    -- Pull in relevant files
    require "character"
    require "player"
    require "enemy"

    -- Set background color to gray
    love.graphics.setBackgroundColor(0.5,0.5,0.5)

    -- Instantiate player and enemy objects
    player = Player()
    enemy = Enemy()

end

function love.update(dt)
    -- Control player movement and boundaries
    player:update(dt)
    player:bankai()
    
    -- Enemy movements and boundaries
    enemy:update(dt)
end

function love.draw()
    player:draw()
    enemy:draw()

end