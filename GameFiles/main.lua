function love.load()
    player = {}
    player.x = 300
    player.y = 200
    player.movementSpeed = 200
end

function love.update(dt)

    -- Player Movement

    local playerDirection = {x = 0, y = 0}
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        playerDirection.x = playerDirection.x + 1
    end

    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        playerDirection.x = playerDirection.x - 1
    end

    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        playerDirection.y = playerDirection.y - 1
    end

    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        playerDirection.y = playerDirection.y + 1
    end

    -- Normalizing movement vector
    local length = math.sqrt(playerDirection.x ^ 2 + playerDirection.y ^ 2)
    if length > 0 then
        playerDirection.x = playerDirection.x / length
        playerDirection.y = playerDirection.y / length
    end

    -- Applying normalized vector to speed
    player.x = player.x + player.movementSpeed * playerDirection.x * dt
    player.y = player.y + player.movementSpeed * playerDirection.y * dt
end

function love.draw()
    love.graphics.circle("fill", player.x, player.y, 100)

end