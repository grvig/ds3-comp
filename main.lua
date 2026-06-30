boss_spacing = 30
boss_scroll = 0
quest_scroll = 0
weapon_scroll = 0
header_height = 120
detail_height = 180
selected_boss = nil
selected_quest = nil
selected_weapon = nil
active_panel = "bosses"
right_panel = "quests"
detail_scroll = 0

save_file = "progress.txt"

bosses = require("data.bosses")
quests = require("data.quests")
weapons = require("data.weapons")

function saveProgress()
    local data = "BOSSES\n"

    for _, boss in ipairs(bosses) do
        data = data .. tostring(boss.defeated) .. "\n"
    end

    data = data .. "QUESTS\n"

    for _, quest in ipairs(quests) do
        data = data .. tostring(quest.completed) .. "\n"
    end

    data = data .. "WEAPONS\n"

    for _, weapon in ipairs(weapons) do
        data = data .. tostring(weapon.obtained) .. "\n"
    end

    love.filesystem.write(save_file, data)

end

function love.load()
    love.window.setMode(900, 700, { resizable = true })
    love.window.setTitle("DS3 Completionist Companion")
    loadProgress()
end

function clampScrolls()
    local h = love.graphics.getHeight()
    local usable = h - header_height - detail_height - boss_spacing

    local boss_min = math.min(0, usable - #bosses * boss_spacing)
    boss_scroll = math.max(boss_min, math.min(0, boss_scroll))

    local quest_min = math.min(0, usable - #quests * boss_spacing)
    quest_scroll = math.max(quest_min, math.min(0, quest_scroll))

    local weapon_min = math.min(0, usable - #weapons * boss_spacing)
    weapon_scroll = math.max(weapon_min, math.min(0, weapon_scroll))
end

function love.resize()
    clampScrolls()
end

function love.draw()
    local w = love.graphics.getWidth()
    local mid_x = math.floor(w / 2)
    local panel_y = love.graphics.getHeight() - detail_height

    -- header
    love.graphics.print("DS3 Completionist Companion", 20, 18)

    local boss_done = 0
    for _, b in ipairs(bosses) do if b.defeated then boss_done = boss_done + 1 end end
    local quest_done = 0
    for _, q in ipairs(quests) do if q.completed then quest_done = quest_done + 1 end end

    local weapon_done = 0
    for _, wep in ipairs(weapons) do if wep.obtained then weapon_done = weapon_done + 1 end end

    local bar_h = 10
    local bar_y = 68
    local bar_pad = 20
    local left_bar_w  = mid_x - bar_pad * 2
    local right_bar_w = mid_x - bar_pad * 2

    -- left column
    love.graphics.setColor(0.7, 0.7, 0.7)
    love.graphics.print("Bosses", bar_pad, 38)
    love.graphics.setColor(0.35, 0.35, 0.35)
    love.graphics.rectangle("fill", bar_pad, bar_y, left_bar_w, bar_h)
    love.graphics.setColor(0.85, 0.65, 0.15)
    love.graphics.rectangle("fill", bar_pad, bar_y, left_bar_w * (boss_done / #bosses), bar_h)
    love.graphics.setColor(0.55, 0.55, 0.55)
    love.graphics.print(boss_done .. " / " .. #bosses .. " defeated", bar_pad, 84)

    -- right column tabs
    local rx = mid_x + bar_pad
    local q_bright   = right_panel == "quests"  and 1 or 0.4
    local wep_bright = right_panel == "weapons" and 1 or 0.4
    love.graphics.setColor(q_bright, q_bright, q_bright)
    love.graphics.print("NPC Quests", rx, 38)
    love.graphics.setColor(wep_bright, wep_bright, wep_bright)
    love.graphics.print("Weapons", rx + 110, 38)

    love.graphics.setColor(0.35, 0.35, 0.35)
    love.graphics.rectangle("fill", rx, bar_y, right_bar_w, bar_h)

    if right_panel == "quests" then
        love.graphics.setColor(0.25, 0.6, 0.85)
        love.graphics.rectangle("fill", rx, bar_y, right_bar_w * (quest_done / #quests), bar_h)
        love.graphics.setColor(0.55, 0.55, 0.55)
        love.graphics.print(quest_done .. " / " .. #quests .. " completed", rx, 84)
    else
        love.graphics.setColor(0.3, 0.78, 0.4)
        love.graphics.rectangle("fill", rx, bar_y, right_bar_w * (weapon_done / #weapons), bar_h)
        love.graphics.setColor(0.55, 0.55, 0.55)
        love.graphics.print(weapon_done .. " / " .. #weapons .. " obtained", rx, 84)
    end

    love.graphics.setColor(1, 1, 1)

    love.graphics.line(20, header_height, w - 20, header_height)
    love.graphics.line(mid_x, header_height, mid_x, panel_y)

    -- scrollable lists
    local list_h = love.graphics.getHeight() - header_height - detail_height
    love.graphics.setScissor(0, header_height, w, list_h)

    for i, boss in ipairs(bosses) do
        local status = boss.defeated and "[X]" or "[ ]"
        local draw_y = header_height + (i * boss_spacing) + boss_scroll
        if draw_y > header_height then
            if i == selected_boss then
                love.graphics.setColor(0.9, 0.8, 0.4)
            elseif boss.defeated then
                love.graphics.setColor(0.35, 0.35, 0.35)
            end
            love.graphics.print(status .. " " .. boss.name, 20, draw_y)
            love.graphics.setColor(1, 1, 1)
        end
    end

    if right_panel == "quests" then
        for i, quest in ipairs(quests) do
            local status = quest.completed and "[X]" or "[ ]"
            local draw_y = header_height + (i * boss_spacing) + quest_scroll
            if draw_y > header_height then
                if i == selected_quest then
                    love.graphics.setColor(0.9, 0.8, 0.4)
                elseif quest.completed then
                    love.graphics.setColor(0.35, 0.35, 0.35)
                end
                love.graphics.print(status .. " " .. quest.name, mid_x + 20, draw_y)
                love.graphics.setColor(1, 1, 1)
            end
        end
    else
        for i, wep in ipairs(weapons) do
            local status = wep.obtained and "[X]" or "[ ]"
            local draw_y = header_height + (i * boss_spacing) + weapon_scroll
            if draw_y > header_height then
                if i == selected_weapon then
                    love.graphics.setColor(0.9, 0.8, 0.4)
                elseif wep.obtained then
                    love.graphics.setColor(0.35, 0.35, 0.35)
                end
                love.graphics.print(status .. " " .. wep.name, mid_x + 20, draw_y)
                love.graphics.setColor(1, 1, 1)
            end
        end
    end

    love.graphics.setScissor()

    local panel_y = love.graphics.getHeight() - detail_height
    love.graphics.line(20, panel_y, w - 20, panel_y)

    local item = (selected_boss and bosses[selected_boss]) or (selected_quest and quests[selected_quest]) or (selected_weapon and weapons[selected_weapon])
    if item then
        love.graphics.setScissor(0, panel_y + 2, w, detail_height - 2)
        local base_y = panel_y + 10 - detail_scroll
        local done = item.defeated or item.completed or item.obtained
        local tag = done and " [Done]" or ""
        love.graphics.print(item.name .. tag, 30, base_y)
        local line_y = base_y + 22
        if item.type then
            love.graphics.setColor(0.45, 0.65, 0.85)
            love.graphics.print("[" .. item.type .. "]", 30, line_y)
            love.graphics.setColor(1, 1, 1)
            line_y = line_y + 20
        end
        if item.note then
            if item.note:sub(1, 7) == "LOCKOUT" then
                love.graphics.setColor(0.9, 0.3, 0.3)
            else
                love.graphics.setColor(0.8, 0.7, 0.3)
            end
            love.graphics.print(item.note, 30, line_y)
            love.graphics.setColor(1, 1, 1)
            line_y = line_y + 22
        end
        if item.steps then
            for j, step in ipairs(item.steps) do
                love.graphics.print(j .. ". " .. step, 30, line_y + (j - 1) * 22)
            end
        end
        love.graphics.setScissor()
    else
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.print("Click a boss or quest to see steps", 30, panel_y + 10)
        love.graphics.setColor(1, 1, 1)
    end
end

function love.mousepressed(x, y, button)
    if button ~= 1 then return end

    local mid_x = math.floor(love.graphics.getWidth() / 2)

    -- tab clicks
    if x > mid_x and y >= 40 and y <= 60 then
        if x < mid_x + 120 then
            right_panel = "quests"
            selected_weapon = nil
            active_panel = "quests"
        else
            right_panel = "weapons"
            selected_quest = nil
            active_panel = "weapons"
        end
        detail_scroll = 0
        return
    end

    if x < mid_x then
        active_panel = "bosses"
        for i, boss in ipairs(bosses) do
            local boss_y = header_height + (i * boss_spacing) + boss_scroll
            if y >= boss_y and y <= boss_y + 20 then
                boss.defeated = not boss.defeated
                selected_boss = i
                selected_quest = nil
                selected_weapon = nil
                detail_scroll = 0
                saveProgress()
                break
            end
        end
    elseif right_panel == "quests" then
        active_panel = "quests"
        for i, quest in ipairs(quests) do
            local quest_y = header_height + (i * boss_spacing) + quest_scroll
            if y >= quest_y and y <= quest_y + 20 then
                quest.completed = not quest.completed
                selected_quest = i
                selected_boss = nil
                selected_weapon = nil
                detail_scroll = 0
                saveProgress()
                break
            end
        end
    else
        active_panel = "weapons"
        for i, wep in ipairs(weapons) do
            local wep_y = header_height + (i * boss_spacing) + weapon_scroll
            if y >= wep_y and y <= wep_y + 20 then
                wep.obtained = not wep.obtained
                selected_weapon = i
                selected_boss = nil
                selected_quest = nil
                detail_scroll = 0
                saveProgress()
                break
            end
        end
    end
end

function love.keypressed(key)
    if key == "left" then
        active_panel = "bosses"
        if not selected_boss then selected_boss = 1 end
        selected_quest = nil
        selected_weapon = nil
        detail_scroll = 0
    elseif key == "right" then
        if active_panel == "bosses" then
            active_panel = right_panel
            if right_panel == "quests" and not selected_quest then selected_quest = 1 end
            if right_panel == "weapons" and not selected_weapon then selected_weapon = 1 end
            selected_boss = nil
        elseif active_panel == "quests" then
            right_panel = "weapons"
            active_panel = "weapons"
            if not selected_weapon then selected_weapon = 1 end
            selected_quest = nil
        else
            right_panel = "quests"
            active_panel = "quests"
            if not selected_quest then selected_quest = 1 end
            selected_weapon = nil
        end
        detail_scroll = 0
    elseif key == "up" then
        detail_scroll = 0
        if active_panel == "bosses" then
            selected_boss = math.max(1, (selected_boss or 2) - 1)
            selected_quest = nil
            selected_weapon = nil
            local item_y = header_height + selected_boss * boss_spacing + boss_scroll
            if item_y < header_height + boss_spacing then
                boss_scroll = boss_scroll + (header_height + boss_spacing - item_y)
            end
        elseif active_panel == "quests" then
            selected_quest = math.max(1, (selected_quest or 2) - 1)
            selected_boss = nil
            selected_weapon = nil
            local item_y = header_height + selected_quest * boss_spacing + quest_scroll
            if item_y < header_height + boss_spacing then
                quest_scroll = quest_scroll + (header_height + boss_spacing - item_y)
            end
        else
            selected_weapon = math.max(1, (selected_weapon or 2) - 1)
            selected_boss = nil
            selected_quest = nil
            local item_y = header_height + selected_weapon * boss_spacing + weapon_scroll
            if item_y < header_height + boss_spacing then
                weapon_scroll = weapon_scroll + (header_height + boss_spacing - item_y)
            end
        end
    elseif key == "down" then
        detail_scroll = 0
        local visible_bottom = love.graphics.getHeight() - detail_height - boss_spacing
        if active_panel == "bosses" then
            selected_boss = math.min(#bosses, (selected_boss or 0) + 1)
            selected_quest = nil
            selected_weapon = nil
            local item_y = header_height + selected_boss * boss_spacing + boss_scroll
            if item_y > visible_bottom then boss_scroll = boss_scroll - (item_y - visible_bottom) end
        elseif active_panel == "quests" then
            selected_quest = math.min(#quests, (selected_quest or 0) + 1)
            selected_boss = nil
            selected_weapon = nil
            local item_y = header_height + selected_quest * boss_spacing + quest_scroll
            if item_y > visible_bottom then quest_scroll = quest_scroll - (item_y - visible_bottom) end
        else
            selected_weapon = math.min(#weapons, (selected_weapon or 0) + 1)
            selected_boss = nil
            selected_quest = nil
            local item_y = header_height + selected_weapon * boss_spacing + weapon_scroll
            if item_y > visible_bottom then weapon_scroll = weapon_scroll - (item_y - visible_bottom) end
        end
    elseif key == "space" or key == "return" then
        if selected_boss then
            bosses[selected_boss].defeated = not bosses[selected_boss].defeated
            saveProgress()
        elseif selected_quest then
            quests[selected_quest].completed = not quests[selected_quest].completed
            saveProgress()
        elseif selected_weapon then
            weapons[selected_weapon].obtained = not weapons[selected_weapon].obtained
            saveProgress()
        end
    elseif key == "escape" then
        selected_boss = nil
        selected_quest = nil
        selected_weapon = nil
        detail_scroll = 0
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
    local weapon_index = 1

    for line in content:gmatch("[^\r\n]+") do

        if line == "BOSSES" then

            section = "bosses"

        elseif line == "QUESTS" then

            section = "quests"

        elseif line == "WEAPONS" then

            section = "weapons"

        else

            if section == "bosses" then

                if bosses[boss_index] then
                    bosses[boss_index].defeated = (line == "true")
                end

                boss_index = boss_index + 1

            elseif section == "quests" then

                if quests[quest_index] then
                    quests[quest_index].completed = (line == "true")
                end

                quest_index = quest_index + 1

            elseif section == "weapons" then

                if weapons[weapon_index] then
                    weapons[weapon_index].obtained = (line == "true")
                end

                weapon_index = weapon_index + 1

            end

        end

    end

end

function clampScrollValue(scroll, item_count)
    local content_height = item_count * boss_spacing
    local min_scroll = math.min(0, love.graphics.getHeight() - header_height - detail_height - content_height - boss_spacing)

    if scroll > 0 then scroll = 0 end
    if scroll < min_scroll then scroll = min_scroll end

    return scroll
end

function love.wheelmoved(x, y)

    local mouse_x, mouse_y = love.mouse.getPosition()
    local mid_x = math.floor(love.graphics.getWidth() / 2)
    local panel_y = love.graphics.getHeight() - detail_height

    if mouse_y >= panel_y then
        detail_scroll = math.max(0, detail_scroll - (y * 20))
        return
    end

    if mouse_x < mid_x then
        boss_scroll = clampScrollValue(boss_scroll + (y * 20), #bosses)
    elseif right_panel == "quests" then
        quest_scroll = clampScrollValue(quest_scroll + (y * 20), #quests)
    else
        weapon_scroll = clampScrollValue(weapon_scroll + (y * 20), #weapons)
    end

end
