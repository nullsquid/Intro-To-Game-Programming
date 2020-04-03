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

  curState = states.waiting
  spawntimer = 1

  score = 0

  mainFont = love.graphics.newFont(20)

end

function love.update(dt)
  -- body...
  if curState == states.playing then
    spawntimer = spawntimer - dt
    spawnpipes()
    player:update(dt)
    pipe:update(dt)
    for i,v in ipairs(pipes) do
      v:checkforcollisions(player)
      if v.x < -20 then
        table.remove(pipes, i)
      end
    end
  end
end

function love.draw()
  -- body...
  love.graphics.setFont(mainFont)
  if curState == states.waiting then
    love.graphics.print("Jump through the pipes\nPress any key to start", love.graphics.getWidth()/2 - 100, love.graphics.getHeight()/2)
  end
  if curState == states.lose then

  end
  if curState == states.playing then
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Score: "..score)
    player:draw()
    pipe:draw()
  end

end

function love.keypressed(key, scancode, isrepeat)
  -- body...
  if curState == states.waiting then
    curState = states.playing
  end
end

function spawnpipes()
  if spawntimer <= 0 then
    table.insert(pipes, pipe(love.graphics.getWidth() +  20, math.random(50,450)))
    spawntimer = 2
  end
end
