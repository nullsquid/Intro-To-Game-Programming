player = object:extend()

function player:new()
  self.h = 50
  self.w = 50
  self.x = 200
  self.y = 150
  self.yVel = 0
  self.yAcceleration = -20
  self.maxCooldown = .5
  self.jumpCooldown = 0
  self.jumpPower = 500
  self.jumpMultiplier = 1.5
  self.dead = false
end

function player:update(dt)
  -- self.h = animationbounce(dt,50,20,.2)
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
      self.jumpCooldown = self.maxCooldown
    end
  end
  -- self.w = player:ease(dt, 1, 50, 20)
end

function player:draw()
  if self.dead == false then
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
  end
end

function player:reset()
  player.dead = false
  player.y = 150
end
