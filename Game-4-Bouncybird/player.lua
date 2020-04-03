player = object:extend()

function player:new()
  self.h = 50
  self.w = 50
  self.x = 200
  self.y = 50
  self.yVel = 0
  self.yAcceleration = -20
  self.jumpCooldown = .5
  self.jumpPower = 500
  self.jumpMultiplier = 1.5
  self.dead = false
end

function player:update(dt)
  self.h = animationbounce(dt,50,20,.2)
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

function animationbounce(t, b, c, d)
  t = t/(d/2)
  if t < 1 then
    return c/2*t*t*t + b
  end
  t = t - 2
  return  c/2 * (t*t*t + 2) + b
end
