function love.load(arg)
  -- body...
  padding = 10
  spawntimer = 1
  object = require "classic"
  require "player"
  require "bullet"
  require "enemy"
  player = player()
  --enemy = enemy(100,100)
  bullets = {}
  enemies = {}
end

function love.update(dt)
  spawntimer = spawntimer - dt
  spawnenemy()
  player:update(dt)
  enemy:update(dt)
  for i, v in ipairs(bullets) do
    v:update(dt)
    if v.dead == true then
      table.remove(bullets, i)
    end
    for j,b in ipairs(enemies) do
      v:checkforcollisions(b)
      if b.dead == true then
        table.remove(enemies, j)
      end
    end
  end

end

function love.draw()
  -- body...
  player:draw()
  bullet:draw()
  enemy:draw()
end

function spawnenemy()
  if spawntimer <= 0 then
    table.insert(enemies, enemy(math.random(0, love.graphics.getWidth() - 50),-50))
    spawntimer = 1
  end
end
