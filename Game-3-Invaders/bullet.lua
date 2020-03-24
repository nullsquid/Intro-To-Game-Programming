bullet = object:extend()

function bullet:new(x, y)
 self.x = x
 self.y = y
 self.speed = 500
 self.w = 10
 self.h = 10
end

function bullet:update(dt)
  self.y = self.y - self.speed * dt
end

function adbullet:draw()
  for i, v in ipairs(bullets) do
    love.graphics.rectangle("fill", v.x, v.y, v.w, v.h)
  end
end
