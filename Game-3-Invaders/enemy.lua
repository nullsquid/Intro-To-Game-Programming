enemy = object:extend()

function enemy:new(x, y)
 self.x = x
 self.y = y
 self.speed = 250
 self.w = 50
 self.h = 50
 self.dead = false
 --self.hp = 20
end

function enemy:update(dt)
  for i, v in ipairs(enemies) do
    v.y = v.y + v.speed * dt
  end
end

function enemy:draw()
  love.graphics.setColor(1,0,0)
  for i, v in ipairs(enemies) do
    love.graphics.rectangle("fill", v.x, v.y, v.w, v.h)
  end
end
