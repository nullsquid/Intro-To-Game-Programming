player = object:extend()

function player:new()
  self.w = 50
  self.h = 50
  self.x = love.graphics.getWidth() / 2 - self.w/2
  self.y = love.graphics.getHeight() - 75
  self.shotcooldown = 0
  self.speed = 500
end

function player:update(dt)
  self.shotcooldown = self.shotcooldown - dt
  if love.keyboard.isDown("a") and (self.x - self.speed * dt) > 0 then
    self.x = self.x - self.speed * dt
  end
  if love.keyboard.isDown("d") and ((self.x + self.w) + self.speed * dt) < love.graphics.getWidth() then
    self.x = self.x + self.speed * dt
  end
  -- to fire a bullet
  if love.keyboard.isDown("space") then
    player:shoot(self.x + (self.w/2),self.y)
  end
end

function player:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

function player:shoot(x,y)
  if self.shotcooldown <= 0 then
    self.shotcooldown = .2
    table.insert(bullets, bullet(x,y))
  end
end
