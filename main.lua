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

quests = {{
    name = "Siegward",
    completed = false
}, {
    name = "Anri",
    completed = false
}, {
    name = "Greirat",
    completed = false
}, {
    name = "Leonhard",
    completed = false
}, {
    name = "Sirris",
    completed = false
}, {
    name = "Yoel",
    completed = false
}, {
    name = "Yuria",
    completed = false
}, {
    name = "Orbeck",
    completed = false
}, {
    name = "Cornyx",
    completed = false
}, {
    name = "Karla",
    completed = false
}, {
    name = "Hawkwood",
    completed = false
}, {
    name = "Irina",
    completed = false
}}

function saveProgress()

    local data = "BOSSES\n"

    for _, boss in ipairs(bosses) do
        data = data .. tostring(boss.defeated) .. "\n"
    end

    data = data .. "QUESTS\n"

    for _, quest in ipairs(quests) do
        data = data .. tostring(quest.completed) .. "\n"
    end

    love.filesystem.write(save_file, data)

end

function love.load()
    love.window.setMode(900, 700, {
        resizable = true
    })
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

    local completed_quests = 0

    for _, quest in ipairs(quests) do

        if quest.completed then
            completed_quests = completed_quests + 1
        end

    end
    love.graphics.print("Quest Progress: " .. completed_quests .. "/" .. #quests, 500, 70)
    love.graphics.print("NPC Quests", 500, 100)

    for i, quest in ipairs(quests) do

        local status = "[ ]"

        if quest.completed then
            status = "[X]"
        end

        love.graphics.print(status .. " " .. quest.name, 500, 140 + (i * 30))

    end
end

function love.mousepressed(x, y, button)

    if button ~= 1 then
        return
    end

    for i, boss in ipairs(bosses) do

        local boss_y = boss_start_y + (i * boss_spacing) + scroll_offset

        if x >= 50 and x <= 400 and y >= boss_y and y <= boss_y + 20 then
            boss.defeated = not boss.defeated
            saveProgress()
            break
        end

    end
    for i, quest in ipairs(quests) do

        local quest_y = 140 + (i * 30)

        if x >= 500 and x <= 800 and y >= quest_y and y <= quest_y + 20 then

            quest.completed = not quest.completed

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

    local section = ""
    local boss_index = 1
    local quest_index = 1

    for line in content:gmatch("[^\r\n]+") do

        if line == "BOSSES" then

            section = "bosses"

        elseif line == "QUESTS" then

            section = "quests"

        else

            if section == "bosses" then

                if bosses[boss_index] then
                    bosses[boss_index].defeated =
                        (line == "true")
                end

                boss_index = boss_index + 1

            elseif section == "quests" then

                if quests[quest_index] then
                    quests[quest_index].completed =
                        (line == "true")
                end

                quest_index = quest_index + 1

            end

        end

    end

end

function love.wheelmoved(x, y)

    scroll_offset = scroll_offset + (y * 20)

    local total_items = math.max(#bosses, #quests)

    local content_height = total_items * boss_spacing

    local window_height = love.graphics.getHeight()

    local min_scroll = math.min(0, window_height - content_height - 200)

    if scroll_offset > 0 then
        scroll_offset = 0
    end

    if scroll_offset < min_scroll then
        scroll_offset = min_scroll
    end

end
