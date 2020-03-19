function love.load(arg)
  -- body...
  padding = 10
  player = {}
  player.w = 50
  player.h = 50
  player.x = love.graphics.getWidth() / 2 - player.w/2
  player.y = love.graphics.getHeight() - 75
  player.speed = 250

  bullets = {}
end

function love.update(dt)
  -- body...
  if love.keyboard.isDown("a") then
    player.x = player.x - player.speed * dt
  end
  if love.keyboard.isDown("d") then
    player.x = player.x + player.speed * dt
  end
  -- to fire a bullet
  if love.keyboard.isDown("space") then
    shoot(player.x,player.y)

  end
  -- for i, v in ipairs(bullets) do
  --   v.y = v.y + v.speed
  -- end
end

function love.draw()
  -- body...
  love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
  for i, v in ipairs(bullets) do
    love.graphics.rectangle("fill", v.x, v.y, v.w, v.h)
    v.y = v.y + v.speed
  end

end

function shoot(shipX, shipY)
  bullet = {}
  bullet.w = 10
  bullet.h = 10
  bullet.x = shipX
  bullet.y = shipY - player.h/2
  bullet.speed = 200

  table.insert(bullets, bullet)
end
