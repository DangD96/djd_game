-- Runs once at the start of the game
function love.load()
    -- Dimensions of the game window
    window_width = love.graphics.getWidth()
    window_height = love.graphics.getHeight()
    
    -- Need details in classic.lua to create classes
    Object = require "classic"

    -- Pull in relevant files
    require "character"
    require "player"
    require "enemy"
    require "slash"

    -- Set background color to gray
    love.graphics.setBackgroundColor(0.5,0.5,0.5)

    -- Instantiate player and enemy objects
    player = Player()
    enemy = Enemy()

    -- Create table to store different attack objects
    listOfSlashes = {}
    listofArrows = {}

end

-- Continuously runs
function love.update(dt)
    -- Control player movement and boundaries
    player:update(dt)
    player:bankai()
    
    -- Enemy movements and boundaries
    enemy:update(dt)

    for i,v in ipairs(listOfSlashes) do
        v:update(dt)
    end
end

-- Continuously runs
function love.draw()
    player:draw()
    enemy:draw()

    for i,v in ipairs(listOfSlashes) do
        v:draw()
    end
end

-- Callback function that listen for a key press
function love.keypressed(key)
    player:attack(key)
    player:bankai(key)
end