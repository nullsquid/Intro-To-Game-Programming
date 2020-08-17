function love.load(arg)
  -- body...
  object = require "classic"
  require "player1"
  require "ball"
  require "player2"

  player1 = player1(50,love.graphics.getHeight()/2 - 75/2)
  player2 = player2(love.graphics.getWidth() - (50 + (15/2)),love.graphics.getHeight()/2 - (75/2))
  ball = ball(love.graphics.getWidth()/2,love.graphics.getHeight()/2)
end


function love.update(dt)
  player1:update(dt)
  player2:update(dt)
  ball:update(dt)
  ball:checkforCollision(player1)
  ball:checkforCollision(player2)
end

function love.draw()
  player1:draw()
  player2:draw()
  ball:draw()
end
