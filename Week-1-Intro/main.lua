local x
function love.load()
  x = 5
end

function love.draw()
  love.graphics.rectangle("fill", x, 50, 60, 120)
end

function love.update(dt)
  if x < 300 then
    x = x + 5 * dt
  else
    x = 50
  end
end
