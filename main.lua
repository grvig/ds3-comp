boss_start_y = 100
boss_spacing = 30

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

    for i, boss in ipairs(bosses) do

        local status = "[ ]"

        if boss.defeated then
            status = "[X]"
        end

        love.graphics.print(
            status .. " " .. boss.name,
            50,
            100 + (i * 30)
        )
    end
end

function love.mousepressed(x, y, button)

    if button ~= 1 then
        return
    end

    for i, boss in ipairs(bosses) do

        local boss_y = boss_start_y + (i * boss_spacing)

        if y >= boss_y and y <= boss_y + 20 then
            boss.defeated = not boss.defeated
            break
        end

    end

end