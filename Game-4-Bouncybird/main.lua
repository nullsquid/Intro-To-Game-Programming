function love.load(arg)
  -- body...
  object = require "classic"
  require "player"

  player = player()
end

function love.update(dt)
  -- body...
  player:update(dt)
end

function love.draw()
  -- body...
  player:draw()
end
