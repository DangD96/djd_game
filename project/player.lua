-- Create the Player class. Inherits from Character class
Player = Character:extend()

-- Constructor
function Player:new()
    -- With Player.super we can get access to our base class's functions, and we use it to call Character:new()
    Player.super.new(self)

    self.image = love.graphics.newImage("player.png")
    self.x = 325
    self.y = 450
    self.speed = 150
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.rotation = 0
    self.scaleX = 0.1
    self.scaleY = 0.1
end

function Player:draw()
    love.graphics.draw(self.image, self.x, self.y, self.rotation, self.scaleX, self.scaleY)
end

function Player:attack(key)
    if key == "space" then
        table.insert(listOfSlashes, Slash(self.x, self.y))
    end
end

function Player:bankai()
    if love.keyboard.isDown("b") then
        self.image = love.graphics.newImage("player_powerup.png")
        self.speed = 300
    end
end