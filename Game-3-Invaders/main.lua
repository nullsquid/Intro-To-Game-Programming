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
  states = {}
  states.win = 1
  states.lose = 2
  states.playing = 3
  states.waiting = 4

  state = states.waiting

  score = 0
end

function love.keypressed(key)
  if state == states.waiting then
    state = states.playing
  end
  if state == states.lose then
    state = states.playing
    score = 0
    player:reset()
  end
  if state == states.win then
    --put hooks in here to loop back to idle or playing after the win state is reached
  end
end

function love.update(dt)

  if state == states.playing then
    spawntimer = spawntimer - dt
    spawnenemy()
    player:update(dt)
    enemy:update(dt)
    if player.hp <= 0 then
      state = states.lose
    end
    for i, v in ipairs(bullets) do
      v:update(dt)
      if v.y < 0 then
        v.dead = true
      end
      if v.dead == true then
        table.remove(bullets, i)
      end
      for j,b in ipairs(enemies) do
        v:checkforcollisions(b)
        if b.dead == true then
          table.remove(enemies, j)
          score = score + 1
        end
      end
    end
    for i,v in ipairs(enemies) do
      if v.y >= love.graphics.getHeight() then
        table.remove(enemies, i)
      end
    end
    for i,v in ipairs(enemies) do
      player:checkforcollisions(v)
      if v.dead == true then
        table.remove(enemies,i)
      end
    end
  end
end

function love.draw()
  -- body...
  if state == states.waiting then
    love.graphics.setColor(1,1,1)
    love.graphics.print("Shoot the invading aliens\nPress any key to start",love.graphics.getWidth()/2 - 70,love.graphics.getHeight()/2)
  end
  if state == states.lose then
    love.graphics.setColor(1,0,0)
    love.graphics.print("You lose\nPress any key to restart",love.graphics.getWidth()/2 - 70,love.graphics.getHeight()/2)
  end
  if state == states.win then
    love.graphics.setColor(0,1,0)
    love.graphics.print("You win!\nPress any key to restart",love.graphics.getWidth()/2 - 70,love.graphics.getHeight()/2)
  end
  if state == states.playing then
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("Score: "..score, 20, 20, 50, "center")
    player:draw()
    bullet:draw()
    enemy:draw()
  end
end

function spawnenemy()
  if spawntimer <= 0 then
    local side = math.random(1,4)
    if side == 1 then -- enemy(x,y)
      table.insert(enemies, enemy(math.random(0, love.graphics.getWidth() - 50),-50))
    elseif side == 2 then
      table.insert(enemies, enemy(math.random(0, love.graphics.getWidth() - 50),love.graphics.getHeight() + 50))
    elseif side == 3 then
      table.insert(enemies, enemy(math.random(0, love.graphics.getWidth() - 50),-50))
    elseif side == 4 then
      table.insert(enemies,enemy(love.graphics.getWidth(),math.random(0,love.graphics.getHeight())))
    end
    spawntimer = 1
  end
end
