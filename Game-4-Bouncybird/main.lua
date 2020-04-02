function love.load(arg)
  -- body...
  object = require "classic"
  require "player"
  require "pipe"
  player = player()
  pipes = {}

  spawntimer = 1
  -- pipe = pipe(500, 400)
end

function love.update(dt)
  -- body...
  spawntimer = spawntimer - dt
  spawnpipes()
  player:update(dt)
  pipe:update(dt)
end

function love.draw()
  -- body...
  player:draw()
  pipe:draw()

end

function spawnpipes()
  if spawntimer <= 0 then
    table.insert(pipes, pipe(love.graphics.getWidth() +  20, math.random(50,450)))
    spawntimer = 2
  end
end
