player1 = {}
player1.w = 15
player1.h = 75
player1.x = 50
player1.y = love.graphics.getHeight()/2 - (player1.h/2)

player2 = {}
player2.w = 15
player2.h = 75
player2.x = love.graphics.getWidth() - (50 + player2.w)
player2.y = love.graphics.getHeight()/2 - (player1.h/2)

ball = {}
ball.w = 10
ball.h = 10
ball.x = (love.graphics.getWidth()/2) - (ball.w/2)
ball.y = (love.graphics.getHeight()/2) - (ball.h/2)
ball.speed = 1000
function love.update(dt)
  -- body...
  if love.keyboard.isDown("w") and (player1.y - 500 * dt > 0) then
    player1.y = player1.y - 500 * dt
  elseif love.keyboard.isDown("s") and (player1.y + player1.h) + (500 * dt) < love.graphics.getHeight() then
    player1.y = player1.y + 500 * dt
  end

  if love.keyboard.isDown("up") and (player2.y - 500 * dt > 0) then
    player2.y = player2.y - 500 * dt
  elseif love.keyboard.isDown("down") and (player2.y + player2.h) + (500 * dt) < love.graphics.getHeight() then
    player2.y = player2.y + 500 * dt
  end

  ball.x = ball.x + ball.speed * dt


end

function love.draw()
  love.graphics.rectangle("fill", player1.x, player1.y, player1.w, player1.h)
  love.graphics.rectangle("fill", player2.x, player2.y, player2.w, player2.h)
  love.graphics.rectangle("fill", ball.x, ball.y, ball.w, ball.h)
end

function checkForCollision()
