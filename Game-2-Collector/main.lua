function love.load(arg)
  -- body...
  player = {}
  player.w = 60
  player.h = 60
  player.x = love.graphics.getWidth() / 2 - (player.w / 2)
  player.y = love.graphics.getHeight() / 2 - (player.h / 2)
  player.ix = 0
  player.iy = 0
  player.speed = 250
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
    dist=math.sqrt(player.ix * player.ix + player.iy * player.iy)
    player.ix = player.ix / dist
    player.iy = player.iy / dist
  end

  player.x = player.x + (player.ix * player.speed) * dt
  player.y = player.y + (player.iy * player.speed) * dt


end

function love.draw()
  -- body...
  love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
end
