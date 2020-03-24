function love.load(arg)
  -- body...
  box1 = {}
  box1.x = 50
  box1.y = 100
  box1.w = 100
  box1.h = 100

  box2 = {}
  box2.x = 200
  box2.y = 20
  box2.w = 150
  box2.h = 60
end

function love.update(dt)
  -- body...
  box1.x = love.mouse.getX()
  box1.y = love.mouse.getY()
end

function love.draw()
  -- body...
  love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle("fill", box1.x, box1.y, box1.w, box1.h)

  love.graphics.setColor(0, 0, 1)
  love.graphics.rectangle("fill", box2.x, box2.y, box2.w, box2.h)
end

function isColliding(a, b)
  local a_left = a.x
  local a_right = a.x + a.w
  local a_top = a.y
  local a_bottom = a.y + a.height

  local b_left = b.x
  local b_right = b.x + b.w
  local b_top = b.y
  local b_bottom = b.y + b.height

  if a_right > b_left
end
