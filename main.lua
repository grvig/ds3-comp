bosses = {
    {
        name = "Iudex Gundyr",
        defeated = false
    },
    {
        name = "Vordt of the Boreal Valley",
        defeated = false
    },
    {
        name = "Curse-Rotted Greatwood",
        defeated = false
    }
}

function love.load()
    love.window.setTitle("DS3 Completionist Companion")
end

function love.draw()
    love.graphics.print("DS3 Completionist Companion", 50, 50)
end