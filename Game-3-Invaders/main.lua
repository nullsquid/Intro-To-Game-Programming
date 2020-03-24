function love.load(arg)
  -- body...
  padding = 10

  object = require "classic"
  require "player"
  require "bullet"
  player = player()
  bullets = {}
end

function love.update(dt)

  player:update(dt)

  for i, v in ipairs(bullets) do
    v:update(dt)
  end
end

function love.draw()
  -- body...
  player:draw()
  bullet:draw()

end

-- function shoot(shipX, shipY)
--   bullet = {}
--   bullet.w = 10
--   bullet.h = 10
--   bullet.x = shipX
--   bullet.y = shipY - player.h/2
--   bullet.speed = 200
--
--   table.insert(bullets, bullet)
-- end
