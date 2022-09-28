Arrow = Object:extend()

-- Pass in the enemy's x/y position so know where to launch the attack from
function Arrow:new(x, y)
    self.image = love.graphics.newImage("enemy_attack.png")
    self.x = x
    self.y = y
    self.rotation = 0
    self.scaleX = 0.15
    self.scaleY = 0.15
    self.speed = 300
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end


-- Needs to move down towards the player
function Arrow:update(dt)
    self.y = self.y + self.speed * dt 
end


function Arrow:draw()
    love.graphics.draw(self.image, self.x, self.y, self.rotation, self.scaleX, self.scaleY)
end


-- Detect if the attack hit the player. Restart the game if it hits
function Arrow:checkCollision(obj)
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
        love.load()
    end
end
