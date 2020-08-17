player2 = object:extend()

function player2:new(x,y)
  self.w = 15
  self.h = 75
  self.x = love.graphics.getWidth() - (50 + self.w)
  self.y = love.graphics.getHeight()/2 - (self.h/2)
end

function player2:update(dt)
  if love.keyboard.isDown("up") and (self.y - 500 * dt > 0) then
    self.y= self.y - 500 * dt
  elseif love.keyboard.isDown("down") and (self.y + self.h) + (500 * dt) < love.graphics.getHeight() then
    self.y = self.y + 500 * dt
  end
end

function player2:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end
