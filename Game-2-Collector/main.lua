function love.load(arg)

  -- body...
  state = 1
  padding = 0

  player = {}
  player.w = 60
  player.h = 60
  player.x = love.graphics.getWidth() / 2 - (player.w / 2)
  player.y = love.graphics.getHeight() / 2 - (player.h / 2)
  player.ix = 0
  player.iy = 0
  player.speed = 250

  blocks = {}
  for i=1,10 do
    -- body...
    createBlock()
  end


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
  for i,v in ipairs(blocks) do
    if distance(player.x, player.y, v.x, v.y) < 100 then
      love.graphics.setColor(1, 0, 0)
      love.graphics.rectangle("fill", v.x, v.y, v.w, v.h)
    else
      love.graphics.setColor(1, 1, 0)
      love.graphics.rectangle("fill", v.x, v.y, v.w, v.h)
    end
  end
end

function createBlock(x, y)
  block = {}
  block.h = 10
  block.w = 10
  block.x = math.random(0, love.graphics.getWidth() - block.w)
  block.y = math.random(0, love.graphics.getHeight() - block.h)


  table.insert(blocks, block)
end

function distance(x1, y1, x2, y2)
  return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end
