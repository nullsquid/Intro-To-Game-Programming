ball = object:extend()
vector = {
  x,
  y
}

function ball:new(x,y)
  self.w = 10
  self.h = 10
  self.x = (love.graphics.getWidth()/2) - (self.w/2)
  self.y = (love.graphics.getHeight()/2) - (self.h/2)
  self.speed = 200
  self.bounce = false
  vector.x = self.speed  * -1
  vector.y = 0
end

function ball:update(dt)

  --self.x = self.x + (self.speed * dt)
  if self.bounce == false then
    self.x = self.x + vector.x * dt
    self.y = self.y + vector.y * dt
  elseif self.bounce == true then
    vector.x = vector.x * -1
    self.bounce = false
  end

end

function ball:draw()
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

function ball:checkforCollision(obj)
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
    if vector.x > 0 then
      self.x = self.x - 10
    elseif vector.x < 0 then
      self.x = self.x + 10
    end
    self.bounce = true
  end
end
