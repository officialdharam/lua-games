io.stdout:setvbuf('no')
function love.load()
    num = 3
    w = 100
    h = 100
    X_OFFSET = 100
    Y_OFFSET = 100
    color = {248,251,239}
    backgroundcolor = {192, 192, 192}
    filename = "assets/leaf.png"
    image = love.graphics.newImage( filename )
    indexToShow = 0
    max = 9

    showingTime = 0
    hiddenTime = 0

end

function love.update(dt)
  if(showing) then
    showingTime = showingTime + 1
  else
    hiddenTime = hiddenTime + 1
  end

  if(hiddenTime == 60) then
    indexToShow = love.math.random( max )
    hiddenTime = 0
    showing = true
  end
  if(showingTime == 60) then
    showing = false
  end
end

function love.draw()

    love.graphics.print("Welcome to Dual N Back", 100, 50)
    love.graphics.setColor(unpack(color))
    for x = 1,num do
        for y = 1,num do

            love.graphics.rectangle("fill", X_OFFSET +(x - 1)*(w) ,Y_OFFSET +(y - 1)*(h), w-10, h-10)
            res = x * num + y;
            if(res == indexToShow and not showing) then
              love.graphics.draw(image, X_OFFSET +(x - 1)*(w)+ 20 ,Y_OFFSET +(y - 1)*(h)+20)
            end
        end
    end
end
