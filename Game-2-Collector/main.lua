function love.load(arg)

  -- body...
  state = 1
  padding = 25

  player = {}
  player.w = 60
  player.h = 60
  player.x = love.graphics.getWidth() / 2 - (player.w / 2)
  player.y = love.graphics.getHeight() / 2 - (player.h / 2)
  player.ix = 0
  player.iy = 0
  player.speed = 250

  block = {}
  block.x = 100
  block.y = 100
  block.h = 10
  block.w = 10


end

function love.update(dt)
  -- body...
  if love.keyboard.isDown("up") then
    player.iy =  -1
  elseif love.keyboard.isDown("down") then
    player.iy = 1
  end
  if love.keyboard.isDown("left") then
    player.ix = -1
  elseif love.keyboard.isDown("right") then
    player.ix = 1
  end
  if not love.keyboard.isDown("right") and not love.keyboard.isDown("left") then
    player.ix = 0
  end
  if not love.keyboard.isDown("up") and not love.keyboard.isDown("down") then
    player.iy = 0
  end


  if(player.ix * player.ix + player.iy * player.iy > 1) then
    --the next line is the distance formula
    dist=math.sqrt(player.ix * player.ix + player.iy * player.iy)
    player.ix = player.ix / dist
    player.iy = player.iy / dist
  end
  if (player.x + player.w) + (player.ix * player.speed) * dt <= love.graphics.getWidth() - padding and (player.x + player.ix * player.speed * dt) >= padding then
    player.x = player.x + (player.ix * player.speed) * dt
  end
  if (player.y + player.h) + (player.iy * player.speed) * dt <= love.graphics.getHeight() - padding and (player.y + player.iy * player.speed * dt) >= padding then
    player.y = player.y + (player.iy * player.speed) * dt
  end


end

function love.draw()
  -- body...
  love.graphics.setColor(1, 0, 0.7)
  love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
  love.graphics.setColor(1, 0, 0)
  love.graphics.rectangle("fill", block.x, block.y, block.w, block.h)
end
