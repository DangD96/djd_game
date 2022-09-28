Slash = Object:extend()

-- Pass in the player's x/y position so know where to launch the attack from
function Slash:new(x, y)
    self.image = love.graphics.newImage("player_attack1.png")
    self.x = x
    self.y = y
    self.rotation = 0
    self.scaleX = 0.1
    self.scaleY = 0.1
    self.speed = 200
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

-- Needs to move up towards the enemy
function Slash:update(dt)
    self.y = self.y - self.speed * dt 
end

function Slash:draw()
    love.graphics.draw(self.image, self.x, self.y, self.rotation, self.scaleX, self.scaleY)
end