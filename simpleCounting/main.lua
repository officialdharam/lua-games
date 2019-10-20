function love.load()
    number = 1
end

function love.update(dt)
    number = number+ 1
end

function love.draw()
    love.graphics.print( number)
end
