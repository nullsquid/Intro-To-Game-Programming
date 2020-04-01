player = object:extend()

function player:new()
  self.w = 50
  self.h = 50
  self.x = love.graphics.getWidth() / 2 - self.w/2
  self.y = love.graphics.getHeight() - 75
  self.shotcooldown = 0
  self.speed = 500
  self.hp = 50
  self.dead = false
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

  if self.hp <= 0 then
    self.dead = true
  end
end

function player:draw()
  if self.dead == false then
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
  else
    --state change
  end
end

function player:shoot(x,y)
  if self.shotcooldown <= 0 then
    self.shotcooldown = .2
    table.insert(bullets, bullet(x,y))
  end
end

function player:checkforcollisions(obj)
  local left = self.x
  local right = self.x + self.w
  local top = self.y
  local bottom = self.y + self.h

  local obj_left = obj.x
  local obj_right = obj.x + obj.w
  local obj_top = obj.y
  local obj_bottom = obj.y + obj.h

  if right > obj_left and
  left < obj_right and
  bottom > obj_top and
  top < obj_bottom then
    self.hp = self.hp - 10
    obj.dead = true
  end
end

function player:reset()
  self.w = 50
  self.h = 50
  self.x = love.graphics.getWidth() / 2 - self.w/2
  self.y = love.graphics.getHeight() - 75
  self.shotcooldown = 0
  self.speed = 500
  self.hp = 50
  self.dead = false
end
