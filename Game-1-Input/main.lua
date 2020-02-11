local state
function love.load()
  state = 1
  targetFont = love.graphics.newFont(20)
  score = 0
  target = {}
  target.w = 60
  target.h = 60
  target.a = (target.w * target.h)
  target.x = math.random(50, love.graphics.getWidth() - 50)
  target.y = 100
  target.speed = 1
  target.keyToPress = {}
  target.keyToPress[1] = "w"
  target.keyToPress[2] = "s"
  target.keyToPress[3] = "a"
  target.keyToPress[4] = "d"
  target.key = target.keyToPress[math.random(1, #target.keyToPress)]
end

function love.update(dt)
  if state == 1 then


  elseif state == 2 then
    -- target.
    target.y = target.y + target.speed
  end
end

function love.draw()
  if state == 2 then
    love.graphics.printf(score, love.graphics.getHeight()/2, 50, 50, "center")
    if target.y < love.graphics.getHeight() - 100 then
      love.graphics.setColor(1, 1, 1)
      love.graphics.rectangle("fill", target.x, target.y, target.w, target.h)
    elseif target.y > love.graphics.getHeight() - 100 then
      love.graphics.setColor(1, 0, 0)
      love.graphics.rectangle("fill", target.x, target.y, target.w, target.h)
    end
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", 0, love.graphics.getHeight() - 100, love.graphics.getWidth(), 20)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(targetFont)
    love.graphics.printf(target.key, target.x, target.y, target.w,"center")
  end
end

function love.keyreleased(key)
  if state == 1 then
    state = 2
  end
  if key == target.key then
    target.x = math.random(50, love.graphics.getWidth() - 50)
    target.y = 100
    -- target.y = math.random(0, love.graphics.getHeight())
    target.key = target.keyToPress[math.random(1, #target.keyToPress)]
    score = score + 1
  else
    target.y = 100
  end
end

function distance(x1, y1, x2, y2)
  return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end
