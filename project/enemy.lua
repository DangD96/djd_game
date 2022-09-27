-- Create the Enemy class
Enemy = Character:extend()

-- Constructor
function Enemy:new()
    -- With Enemy.super we can get access to our base class's functions, and we use it to call Character:new()
    Enemy.super.new(self)

    self.image = love.graphics.newImage("enemy.png")
    self.x = 300
    self.y = 20
    self.speed = 250
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.rotation = 0
    self.scaleX = 0.5
    self.scaleY = 0.5
end

function Enemy:draw()
    love.graphics.draw(self.image, self.x, self.y, self.rotation, self.scaleX, self.scaleY)
end

function Enemy:update(dt)
    -- Make enemy move randomly. Bias towards horizontal movement
    number = love.math.random()
    if number < 0.25 then
        self.y = self.y - self.speed * dt
    elseif number < 0.5 and number >= 0.25 then
        self.x = self.x - self.speed * dt
        self.y = self.y + self.speed * dt
    elseif number < 0.75 and number >= 0.5 then
        self.x = self.x - self.speed * dt
    else
        self.x = self.x + self.speed * dt
    end

    -- Makes enemy bounce against the borders
    if self.x < 0 then
        self.x = 0
        self.speed = -self.speed
    elseif self.x > window_width - self.width*self.scaleX then
        self.x = window_width - self.width*self.scaleX
        self.speed = -self.speed
    elseif self.y < 0 then
        self.y = 0
        self.speed = -self.speed
    elseif self.y > window_height - self.height*self.scaleY then
        self.y = window_height - self.height*self.scaleY
        self.speed = -self.speed
    end
end
