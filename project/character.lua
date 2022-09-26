-- Create the Character class
Character = Object:extend()

-- Constructor
function Character:new()
    self.health = 5
end

--By using delta time our character will move with the same speed on all computers--
function Character:update(dt)
    if love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    elseif love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("up") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("down") then
        self.y = self.y + self.speed * dt
    end

    if self.x > window_width - self.width*self.scaleX then
        self.x = self.x - self.speed * dt
    elseif self.x < 0 then
        self.x = self.x + self.speed * dt
    elseif self.y < 0 then
        self.y = self.y + self.speed * dt
    elseif self.y > window_height - self.height*self.scaleY then
        self.y = self.y - self.speed * dt
    end
end
