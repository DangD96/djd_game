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
    require "arrow"

    -- Set background color to gray
    love.graphics.setBackgroundColor(0.5,0.5,0.5)

    -- Instantiate player and enemy objects
    player = Player()
    enemy = Enemy()

    -- Create tables to store different attack objects
    listOfSlashes = {}
    listofArrows = {}
end


-- Continuously runs
function love.update(dt)
    -- Control player movement and boundaries
    player:update(dt)
    
    -- Enemy movements and boundaries
    enemy:update(dt)
    
    -- Player's attacks
    for i,v in ipairs(listOfSlashes) do
        v:update(dt)
        v:checkCollision(enemy)
    end

    -- Enemy's attacks
    enemy:attack()
    
    for i,v in ipairs(listofArrows) do
        v:update(dt)
        v:checkCollision(player)
    end


end


-- Continuously runs
function love.draw()
    player:draw()
    enemy:draw()

    -- Player's attacks
    for i,v in ipairs(listOfSlashes) do
        v:draw()
    end

    -- Enemy's attacks
    for i,v in ipairs(listofArrows) do
        v:draw()
    end
    
    --Check health
    if player.health == 0 then
        love.graphics.print("You lose!", 400, 300)
        love.timer.sleep(3)
        love.load()
    end

    if enemy.health == 0 then
        love.graphics.print("You win!", 400, 300)
        love.timer.sleep(3)
        love.load()
    end
end


-- Callback function that listens for key presses from player
function love.keypressed(key)
    if key == "b" then
        player.bankai = true
        player.image = love.graphics.newImage("player_powerup.png")
        player.speed = 300
    end

    player:attack(key)
end
