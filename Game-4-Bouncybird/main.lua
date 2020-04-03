function love.load(arg)
  -- body...
  object = require "classic"
  require "player"
  require "pipe"
  player = player()
  pipes = {}
  states = {}

  states.waiting = 1
  states.playing = 2
  states.lose = 3

  cur_state = states.waiting
  spawntimer = 1

end

function love.update(dt)
  -- body...
  if cur_state == states.playing then
    spawntimer = spawntimer - dt
    spawnpipes()
    player:update(dt)
    pipe:update(dt)
    for i,v in ipairs(pipes) do
      v:checkforcollisions(player)
    end
  end
end

function love.draw()
  -- body...
  if cur_state == states.playing then
    player:draw()
    pipe:draw()
  end

end

function love.keypressed(key, scancode, isrepeat)
  -- body...
  if cur_state == states.waiting then
    cur_state = states.playing
  end
end

function spawnpipes()
  if spawntimer <= 0 then
    table.insert(pipes, pipe(love.graphics.getWidth() +  20, math.random(50,450)))
    spawntimer = 2
  end
end
