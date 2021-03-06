function love.load(arg)
  score = 0
  time = 10

  --state will control the game state

  states = {}
  states.start = 1
  states.playing = 2
  states.win = 3
  states.gameover = 4

  curState = states.start
  --padding controls the thickness of the stage's borders
  padding = 0

  --First, we need to set up the player object
  --We define an empty table called player first
  --and then give it a width, height, and starting x and y values

  --ix and iy (input x and input y) are values that can either be set to -1, 1, or 0
  --depending on which input is being pressed
  player = {}
  player.w = 60
  player.h = 60
  player.x = love.graphics.getWidth() / 2 - (player.w / 2)
  player.y = love.graphics.getHeight() / 2 - (player.h / 2)
  player.ix = 0
  player.iy = 0
  player.cx = (player.x + (player.w/2))
  player.cy = (player.y + (player.h/2))
  player.speed = 250

  --We need to define an empty table to hold all of the coins that we want to put into our scene
  coins = {}

  --In load, we want to write a loop that runs 10 times
  --i=1,10 means create a temp variable,set it to 1, and stop the loop once it reaches 10
  for i=1,10 do
    createcoin()
  end
end

--update runs every frame
function love.update(dt)
  if curState == states.playing then
    if time > 0 then
      time = time - dt
    elseif time <= 0 then
      curState = states.gameover
    end

    --the next several lines check what key is being pressed
    --if a given key is pressed, if it's on the horizontal axis
    --we set ix to -1 or 1; if it's vertical, we do the same for iy
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
    --if no key is being pressed, we do not want any movement
    --so we check if no key is pressed and set the respective input variable to 0
    if not love.keyboard.isDown("right") and not love.keyboard.isDown("left") then
      player.ix = 0
    end
    if not love.keyboard.isDown("up") and not love.keyboard.isDown("down") then
      player.iy = 0
    end

    --we check if the player is moving
    if(player.ix * player.ix + player.iy * player.iy > 1) then

      dist=math.sqrt(player.ix * player.ix + player.iy * player.iy)
      player.ix = player.ix / dist
      player.iy = player.iy / dist
    end
    --The following several lines adds borders to the game board
    if (player.x + player.w) + (player.ix * player.speed) * dt <= love.graphics.getWidth() - padding and (player.x + player.ix * player.speed * dt) >= padding then
      player.x = player.x + (player.ix * player.speed) * dt
    end
    if (player.y + player.h) + (player.iy * player.speed) * dt <= love.graphics.getHeight() - padding and (player.y + player.iy * player.speed * dt) >= padding then
      player.y = player.y + (player.iy * player.speed) * dt
    end

    player.cx = (player.x + (player.w/2))
    player.cy = (player.y + (player.h/2))

    for i,v in ipairs(coins) do
      if distance(player.cx, player.cy, v.x, v.y) <= player.w/2 then
        table.remove(coins, i)
        score = score + 1
      end
    end
    if #coins <= 0 then
      curState = states.win
    end
  end
end

function love.draw()
  -- body...
  if curState == states.playing then
    love.graphics.setColor(1, 0, 0.7)
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
    for i,v in ipairs(coins) do
      love.graphics.setColor(1, 1, 0)
      love.graphics.rectangle("fill", v.x, v.y, v.w, v.h)
    end
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf("Score: "..score,50,50,100,"center")
    love.graphics.printf("Time: "..math.ceil(time),50,70,100,"center")
  elseif curState == states.gameover then
    love.graphics.printf("You ran out of time\nPress any key to try again", love.graphics.getWidth()/2 - 100, love.graphics.getHeight()/2,200,"center")

  elseif curState == states.win then
    love.graphics.printf("You win!\nPress any key to restart", love.graphics.getWidth()/2 - 100, love.graphics.getHeight()/2,200,"center")

  elseif curState == states.start then
    love.graphics.printf("Press any key to start", love.graphics.getWidth()/2 - 100, love.graphics.getHeight()/2,200,"center")
  end

end

--We can create a coin using this custom function
function createcoin()
  --Creates the empty table to hold the coin we make
  coin = {}
  coin.h = 10
  coin.w = 10
  coin.x = math.random(0, love.graphics.getWidth() - coin.w)
  coin.y = math.random(0, love.graphics.getHeight() - coin.h)


  table.insert(coins, coin)
end

function love.keypressed(key, scancode, isrepeat)
  -- body...
  if curState == states.start then
    curState = states.playing
  end
  if curState == states.gameover or curState == states.win then
    resetBoard()
    curState = states.playing
  end
end

function resetBoard()
  coins = {}
  for i=1,10 do
    createcoin()
  end
  player.x = love.graphics.getWidth() / 2 - (player.w / 2)
  player.y = love.graphics.getHeight() / 2 - (player.h / 2)
  time = 10
  score = 0
end

function distance(x1, y1, x2, y2)
  return math.sqrt((y2 - y1)^2 + (x2 - x1)^2)
end
