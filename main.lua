boss_start_y = 100
boss_spacing = 30
scroll_offset = 0

save_file = "progress.txt"

bosses = {{
    name = "Iudex Gundyr",
    defeated = false
}, {
    name = "Vordt of the Boreal Valley",
    defeated = false
}, {
    name = "Curse-Rotted Greatwood",
    defeated = false
}, {
    name = "Crystal Sage",
    defeated = false
}, {
    name = "Deacons of the Deep",
    defeated = false
}, {
    name = "Abyss Watchers",
    defeated = false
}, {
    name = "High Lord Wolnir",
    defeated = false
}, {
    name = "Old Demon King",
    defeated = false
}, {
    name = "Pontiff Sulyvahn",
    defeated = false
}, {
    name = "Aldrich",
    defeated = false
}, {
    name = "Yhorm the Giant",
    defeated = false
}, {
    name = "Dancer of the Boreal Valley",
    defeated = false
}, {
    name = "Dragonslayer Armour",
    defeated = false
}, {
    name = "Oceiros",
    defeated = false
}, {
    name = "Champion Gundyr",
    defeated = false
}, {
    name = "Twin Princes",
    defeated = false
}, {
    name = "Ancient Wyvern",
    defeated = false
}, {
    name = "Nameless King",
    defeated = false
}, {
    name = "Soul of Cinder",
    defeated = false
}, {
    name = "Champion's Gravetender",
    defeated = false
}, {
    name = "Sister Friede",
    defeated = false
}, {
    name = "Demon Prince",
    defeated = false
}, {
    name = "Halflight",
    defeated = false
}, {
    name = "Darkeater Midir",
    defeated = false
}, {
    name = "Slave Knight Gael",
    defeated = false
}}

function saveProgress()

    local data = ""

    for _, boss in ipairs(bosses) do
        data = data .. tostring(boss.defeated) .. "\n"
    end

    love.filesystem.write(save_file, data)

end

function love.load()
    love.window.setTitle("DS3 Completionist Companion")
    loadProgress()
end

function love.draw()
    love.graphics.print("DS3 Completionist Companion", 50, 50)
    local completed = 0

    for _, boss in ipairs(bosses) do
        if boss.defeated then
            completed = completed + 1
        end
    end

    love.graphics.print("Progress: " .. completed .. "/" .. #bosses, 50, 70)

    for i, boss in ipairs(bosses) do

        local status = "[ ]"

        if boss.defeated then
            status = "[X]"
        end

        love.graphics.print(status .. " " .. boss.name, 50, 100 + (i * 30) + scroll_offset)
    end
end

function love.mousepressed(x, y, button)

    if button ~= 1 then
        return
    end

    for i, boss in ipairs(bosses) do

        local boss_y = boss_start_y + (i * boss_spacing) + scroll_offset

        if y >= boss_y and y <= boss_y + 20 then
            boss.defeated = not boss.defeated
            saveProgress()
            break
        end

    end

end

function loadProgress()

    if not love.filesystem.getInfo(save_file) then
        return
    end

    local content = love.filesystem.read(save_file)

    local i = 1

    for line in content:gmatch("[^\r\n]+") do

        if bosses[i] then
            bosses[i].defeated = (line == "true")
        end

        i = i + 1
    end

end

function love.wheelmoved(x, y)

    scroll_offset = scroll_offset + (y * 20)

end
