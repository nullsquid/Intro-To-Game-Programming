pipe = object:extend()

function pipe:new(x, h)
  self.x = x
  self.w = 50
  self.gap = 200
  self.h = h
  self.speed = 250
  self.scored = false
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
    love.graphics.setColor(1, 0, 0, 0)
    love.graphics.rectangle("line", v.x, v.h, v.w,v.gap)
  end
end

function pipe:checkforcollisions(obj)
  local top_left = self.x
  local top_right = self.x + self.w
  local top_top = 0
  local top_bottom = 0 + self.h

  local bot_left = self.x
  local bot_right = self.x + self.w
  local bot_top = self.h + self.gap
  local bot_bottom = (self.h + self.gap) + love.graphics.getHeight()

  local gap_left = self.x
  local gap_right = self.x + self.w
  local gap_top = self.h
  local gap_bottom = self.h + self.gap

  local obj_left = obj.x
  local obj_right = obj.x + obj.w
  local obj_top = obj.y
  local obj_bottom = obj.y + obj.h

  if top_right > obj_left and
  top_left < obj_right and
  top_bottom > obj_top and
  top_top < obj_bottom or
  bot_right > obj_left and
  bot_left < obj_right and
  bot_bottom > obj_top and
  bot_top < obj_bottom then
    obj.dead = true
  end

  if gap_right > obj_left and
  gap_left < obj_right and
  gap_bottom > obj_top and
  gap_top < obj_bottom and
  self.scored == false then
    score = score + 1
    self.scored = true
  end

end
