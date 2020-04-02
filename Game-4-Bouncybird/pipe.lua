pipe = object:extend()

function pipe:new(x, h)
  self.x = x
  self.w = 50
  self.gap = 150
  self.h = h
  self.speed = 250
end

function pipe:update(dt)
  for i,v in ipairs(pipes) do
    v.x = v.x - v.speed * dt
  end
end

function pipe:draw()
  for i,v in ipairs(pipes) do
    love.graphics.setColor(0, 1, .3)
    love.graphics.rectangle("fill", v.x, 0, v.w, v.h)
    love.graphics.rectangle("fill", v.x, v.h + v.gap, v.w, love.graphics.getHeight())
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(v.gap, v.x,10)
  end
end
