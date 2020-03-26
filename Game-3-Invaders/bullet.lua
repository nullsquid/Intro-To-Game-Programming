bullet = object:extend()

function bullet:new(x, y)
 self.x = x
 self.y = y
 self.speed = 500
 self.w = 10
 self.h = 10
 self.dead = false
end

function bullet:update(dt)
  self.y = self.y - self.speed * dt
end

function bullet:draw()
  for i, v in ipairs(bullets) do
    love.graphics.rectangle("fill", v.x, v.y, v.w, v.h)
  end
end

function bullet:checkforcollisions(obj)
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
    self.dead = true
    obj.dead = true
  end
end
