player = object:extend()

function player:new()
  self.h = 50
  self.w = 50
  self.x = 200
  self.y = 50
  self.yVel = 0
  self.yAcceleration = -9.18
  self.jumpCooldown = .5
  self.jumpPower = 500
  self.jumpMultiplier = 1.5
  self.dead = false
end

function player:update(dt)
  self.jumpCooldown = self.jumpCooldown - dt
  if self.yVel < 0 then
    self.yVel = self.yVel + self.yAcceleration
    self.y = self.y - (self.yVel * dt) * self.jumpMultiplier
  else
    self.yVel = self.yVel + self.yAcceleration
    self.y = self.y - self.yVel * dt
  end
  if love.keyboard.isDown("space") then
    if self.jumpCooldown <= 0 then
      self.yVel = self.jumpPower
      self.jumpCooldown = .2
    end
  end
end

function player:draw()
  if self.dead == false then
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
  end
end
