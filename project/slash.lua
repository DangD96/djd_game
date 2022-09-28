Slash = Object:extend()

-- Pass in the player's x/y position so know where to launch the attack from
function Slash:new(obj)
    -- Use different slash attack if you're powered up
    if obj.bankai then
        self.image = love.graphics.newImage("player_attack2.png")
    else
        self.image = love.graphics.newImage("player_attack1.png")
    end

    self.x = obj.x
    self.y = obj.y
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


-- Detect if the attack hit the enemy. Restart the game if it hits
function Slash:checkCollision(obj)
    local left_edge = self.x
    local right_edge = self.x + self.width*self.scaleX
    local top_edge = self.y 
    local bottom_edge = self.y + self.height*self.scaleY

    local enemy_left = obj.x 
    local enemy_right = obj.x + obj.width*obj.scaleX
    local enemy_top = obj.y 
    local enemy_bottom = obj.y + obj.height*obj.scaleY

    -- Collision between two rectangles: https://sheepolution.com/learn/book/13
    if right_edge > enemy_left 
    and left_edge < enemy_right
    and bottom_edge > enemy_top
    and top_edge < enemy_bottom then
        obj.health = obj.health - 1
    end
end
