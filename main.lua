boss_spacing = 30
boss_scroll = 0
quest_scroll = 0
header_height = 120
detail_height = 180
selected_boss = nil
selected_quest = nil
active_panel = "bosses"

save_file = "progress.txt"

bosses = {
    {
        name = "Iudex Gundyr",
        defeated = false,
        steps = {
            "Pick up the Coiled Sword from the chest at Cemetery of Ash",
            "Approach the statue and plunge the sword into it to start the fight",
        },
    },
    {
        name = "Vordt of the Boreal Valley",
        defeated = false,
        steps = {
            "Light Tower on the Wall bonfire on High Wall of Lothric",
            "Take the elevator down and cross the courtyard past the knight",
            "Enter the fog gate at the bottom of the stairs",
        },
    },
    {
        name = "Curse-Rotted Greatwood",
        defeated = false,
        steps = {
            "Reach Undead Settlement and light the Dilapidated Bridge bonfire",
            "Drop into the pit in the courtyard surrounded by worshippers",
            "Destroy the white sacs on the Greatwood's body to stagger it",
        },
        note = "Drops Transposing Kiln — required for boss soul weapons",
    },
    {
        name = "Crystal Sage",
        defeated = false,
        steps = {
            "Cross Road of Sacrifices swamp to Crucifixion Woods",
            "Head northeast through the ruins to the fog gate",
            "Attack the real Sage (the one actively casting, not the clones)",
        },
    },
    {
        name = "Deacons of the Deep",
        defeated = false,
        steps = {
            "Navigate Cathedral of the Deep past the giant and the thrall tunnels",
            "Open the main doors from inside using the two levers",
            "Kill the Archdeacon with the red aura — that's where real damage goes",
        },
        note = "Drops Small Doll — required to enter Irithyll",
    },
    {
        name = "Abyss Watchers",
        defeated = false,
        steps = {
            "Reach Farron Keep and light all three flames in the swamp",
            "The seal breaks — enter the fog gate near the Keep Ruins bonfire",
        },
        note = "Lord of Cinder — one of four required to trigger Dancer",
    },
    {
        name = "High Lord Wolnir",
        defeated = false,
        steps = {
            "Reach Catacombs of Carthus and descend to the suspended bridge",
            "Find the chalice on the altar past the skeleton ball trap and interact with it",
            "Destroy the three golden bracelets on his wrists before he engulfs the arena",
        },
    },
    {
        name = "Old Demon King",
        defeated = false,
        steps = {
            "Cut the rope bridge in Catacombs of Carthus to use it as a ladder",
            "Descend into Smouldering Lake and navigate the ruins to the fog gate",
        },
        note = "Optional boss",
    },
    {
        name = "Pontiff Sulyvahn",
        defeated = false,
        steps = {
            "Use the Small Doll at the barrier to enter Irithyll of the Boreal Valley",
            "Navigate through Irithyll past the dog pack and the silver knights",
            "Enter the fog gate inside the cathedral past the giant",
        },
    },
    {
        name = "Aldrich",
        defeated = false,
        steps = {
            "Defeat Pontiff Sulyvahn to unlock Anor Londo",
            "Take the rotating elevator up and cross the walkway to the cathedral",
            "Stay close to dodge his arrows; attack heavily during his movement",
        },
        note = "Lord of Cinder — Anri's quest ends here if active",
    },
    {
        name = "Yhorm the Giant",
        defeated = false,
        steps = {
            "Reach Profaned Capital via the lower exit of Irithyll Dungeon",
            "Pick up the Storm Ruler greatsword from inside the fog gate arena",
            "Charge Storm Ruler's weapon art (hold L2/RB) and release for massive damage",
        },
        note = "Lord of Cinder — Siegward appears here if his quest is active",
    },
    {
        name = "Dancer of the Boreal Valley",
        defeated = false,
        steps = {
            "Defeat all four Lords of Cinder (or speak to Emma at High Wall to trigger early)",
            "Emma drops the Basin of Vows — interact with it to summon the Dancer",
        },
        note = "Opens path to Lothric Castle",
    },
    {
        name = "Dragonslayer Armour",
        defeated = false,
        steps = {
            "Reach Lothric Castle through the Dancer's fog gate",
            "Cross the bridge (watch for the dragon), take the elevator up",
            "Enter the fog gate on the rooftop",
        },
    },
    {
        name = "Oceiros",
        defeated = false,
        steps = {
            "In Lothric Castle, find the altar past the dragon shortcut elevator",
            "Roll through the illusory wall behind the altar to reach Consumed King's Garden",
            "Navigate the garden and poison swamp to the fog gate",
        },
        note = "Required to reach Untended Graves and Champion Gundyr",
    },
    {
        name = "Champion Gundyr",
        defeated = false,
        steps = {
            "Defeat Oceiros then roll through the illusory wall directly behind him",
            "Navigate the dark Untended Graves (mirror of Cemetery of Ash) to the fog gate",
        },
        note = "Optional — drops Coiled Sword Fragment",
    },
    {
        name = "Twin Princes",
        defeated = false,
        steps = {
            "Reach Grand Archives past Dragonslayer Armour (use the wax pools to resist curse)",
            "Climb through the archives to the rooftop gargoyle gauntlet, then up to the fog gate",
            "Kill Lorian; Lothric will revive him — kill Lothric on Lorian's back to end it",
        },
        note = "Lord of Cinder — required for final boss",
    },
    {
        name = "Ancient Wyvern",
        defeated = false,
        steps = {
            "Use the Path of the Dragon gesture at the altar near the Dragon Barracks in Lothric Castle",
            "You are teleported to Archdragon Peak — navigate up to the Wyvern",
            "Run past the Wyvern and plunge attack from the ledge above to one-shot it",
        },
        note = "Optional area and boss",
    },
    {
        name = "Nameless King",
        defeated = false,
        steps = {
            "Reach Archdragon Peak and ring both giant bells to reveal the fog gate",
            "Phase 1: target the King of the Storm's head (the wyvern), not the rider",
            "Phase 2: the Nameless King fights on foot — he staggers on enough head hits",
        },
        note = "Optional — considered one of the hardest fights in the game",
    },
    {
        name = "Soul of Cinder",
        defeated = false,
        steps = {
            "Defeat all four Lords of Cinder (Abyss Watchers, Aldrich, Yhorm, Twin Princes)",
            "Light the Kiln of the First Flame bonfire and enter",
        },
        note = "Final boss — ends the base game",
    },
    {
        name = "Champion's Gravetender",
        defeated = false,
        steps = {
            "Access Ashes of Ariandel DLC and reach the Snowfield via the painter's building",
            "Find the arena through the wolf pack past the Rope Bridge Cave bonfire",
            "Kill the Gravetender before the Greatwolf fully enters — it becomes a two-enemy fight",
        },
        note = "AoA DLC — optional",
    },
    {
        name = "Sister Friede",
        defeated = false,
        steps = {
            "Reach Ariandel Chapel and descend to the basement through the hidden path",
            "Phase 1: Friede goes invisible — bait her slam and punish",
            "Phase 2: Ariandel joins; kill him to advance. Phase 3: Friede returns buffed",
        },
        note = "AoA DLC — final boss",
    },
    {
        name = "Demon Prince",
        defeated = false,
        steps = {
            "Access The Ringed City DLC via the Kiln bonfire or the AoA ending bonfire",
            "Descend through the Dreg Heap to the fog gate at the bottom",
            "Two demons fight simultaneously — whichever dies last becomes the Demon Prince",
        },
        note = "TRC DLC — first boss",
    },
    {
        name = "Halflight",
        defeated = false,
        steps = {
            "Reach Filianore's Rest in the Ringed City past the Shared Grave bonfire",
            "Enter the Spear of the Church arena fog gate",
        },
        note = "TRC DLC — PvP boss; NPC-controlled if playing offline",
    },
    {
        name = "Darkeater Midir",
        defeated = false,
        steps = {
            "Reach the Ringed City streets and find the illusory ledge beneath the main bridge",
            "Drop down and navigate the cavern to Midir's pit fog gate",
            "Attack the head exclusively — body and legs deal a fraction of the damage",
        },
        note = "TRC DLC — optional; drops Frayed Blade katana",
    },
    {
        name = "Slave Knight Gael",
        defeated = false,
        steps = {
            "Reach the end of the Ringed City and enter Filianore's inner chamber",
            "Wake Filianore — the world shifts to the far future painted world",
            "Three-phase fight in the open arena; phase 3 adds lightning and AoE grabs",
        },
        note = "TRC DLC — true final boss of the Dark Souls trilogy",
    },
}

quests = {
    {
        name = "Siegward",
        completed = false,
        steps = {
            "Meet Siegward on the Cathedral of the Deep elevator (ride it down, then back up)",
            "Buy back his armor from Patches after he sets up shop in Firelink Shrine",
            "Return armor to Siegward at the well in Irithyll of the Boreal Valley",
            "Free Siegward from his cell in Irithyll Dungeon using the Old Cell Key",
            "He appears at Yhorm's fight — defeat Yhorm to complete the quest",
        },
        note = "Must free Siegward before defeating Yhorm or he won't appear",
    },
    {
        name = "Anri",
        completed = false,
        steps = {
            "Meet Anri and Horace at Halfway Fortress bonfire on Road of Sacrifices",
            "Find Horace in Smouldering Lake and kill him — do NOT tell Anri his location",
            "Find Anri in Church of Yorshka in Irithyll — kill the pilgrim assassin near them",
            "Find Anri at the tomb in Anor Londo (they're going to kill Aldrich)",
        },
        note = "LOCKOUT: Telling Anri where Horace is sends Anri to die. Joining Rosaria's Fingers also locks this quest.",
    },
    {
        name = "Greirat",
        completed = false,
        steps = {
            "Free Greirat from his cell on High Wall of Lothric using the Cell Key",
            "Send him to pillage Undead Settlement (always safe)",
            "Before sending him to Irithyll: recruit Patches OR ensure Siegward is at the Irithyll well",
            "Send him to Irithyll — he survives only if Siegward or Patches can rescue him",
            "Send him to Lothric Castle (he dies here regardless — nothing saves him at this point)",
        },
        note = "LOCKOUT: Greirat dies on the Irithyll run if neither Siegward nor Patches is available",
    },
    {
        name = "Leonhard",
        completed = false,
        steps = {
            "Talk to Leonhard at Firelink Shrine — he gives you the Lift Chamber Key",
            "Use it on High Wall of Lothric to unlock the lift and kill the Darkwraith for a Red Eye Orb",
            "Offer a Pale Tongue to Rosaria in Cathedral of the Deep",
            "Defeat Leonhard when he invades Rosaria's chamber — he drops the Black Eye Orb",
            "Use the Black Eye Orb in Gwynevere's chamber in Anor Londo to invade and kill him",
        },
        note = "LOCKOUT: Must use the Black Eye Orb before defeating Aldrich or Leonhard's sign disappears",
    },
    {
        name = "Sirris",
        completed = false,
        steps = {
            "Meet Sirris at Firelink Shrine and exhaust her dialogue",
            "Use her summon sign near Church of Yorshka bonfire in Irithyll to help fight Creighton",
            "Use her summon sign near Cliff Underside bonfire in Undead Settlement to fight Hodrick",
            "After Hodrick dies she moves to Firelink — exhaust dialogue for the Sunset armor set",
        },
        note = "LOCKOUT: Joining Rosaria's Fingers covenant permanently locks out this quest",
    },
    {
        name = "Yoel",
        completed = false,
        steps = {
            "Find Yoel among the failed pilgrims past Foot of the High Wall in Undead Settlement",
            "Recruit him to Firelink Shrine",
            "Visit him and select 'Draw Out True Strength' — repeat 5 times for 5 free levels",
            "After the 5th draw Yoel dies and Yuria of Londor takes his place",
        },
        note = "LOCKOUT: Yoel disappears if you reach the Halfway Fortress bonfire before recruiting him",
    },
    {
        name = "Yuria",
        completed = false,
        steps = {
            "Complete Yoel's quest (all 5 draws of true strength)",
            "Talk to Yuria in Firelink — she sells dark sorceries and advances the Hollow ending",
            "Complete Anri's questline alongside this one",
            "After Soul of Cinder, choose the Usurpation of Fire ending at the First Flame",
        },
        note = "LOCKOUT: Removing your Dark Sigils with the Fire Keeper causes Yuria to leave Firelink permanently",
    },
    {
        name = "Orbeck",
        completed = false,
        steps = {
            "Find Orbeck in the Road of Sacrifices swamp (Crystal Sage area) and recruit him",
            "Buy at least 3 sorceries from him before defeating 4 bosses — or give him a scroll early",
            "Give him all four scrolls: Sage's Scroll, Golden Scroll, Logan's Scroll, Crystal Scroll",
            "After all scrolls are given he moves to Grand Archives — exhaust dialogue there to complete",
        },
        note = "LOCKOUT: Orbeck leaves Firelink if too many bosses are defeated without purchasing from him",
    },
    {
        name = "Cornyx",
        completed = false,
        steps = {
            "Free Cornyx from his hanging cage in Undead Settlement (near the Fire Demon)",
            "Give him the Great Swamp Tome (Road of Sacrifices swamp)",
            "Give him the Carthus Pyromancy Tome (Catacombs of Carthus) and Izalith Pyromancy Tome (Smouldering Lake)",
            "Give him the Quelana Pyromancy Tome (rare drop in Smouldering Lake) to complete the quest",
        },
    },
    {
        name = "Karla",
        completed = false,
        steps = {
            "Obtain the Jailer's Key Ring from a body in the Profaned Capital",
            "Use it to free Karla from her cell in Irithyll Dungeon",
            "Give her the dark tomes other teachers refuse: Deep Braille Divine Tome, Londor Braille Divine Tome, Grave Warden Tome, Quelana Pyromancy Tome",
        },
        note = "Give dark/forbidden tomes to Karla instead of Irina — giving them to Irina locks out Irina's good ending",
    },
    {
        name = "Hawkwood",
        completed = false,
        steps = {
            "Exhaust Hawkwood's dialogue at Firelink Shrine",
            "Optionally use his summon sign for the Abyss Watchers fight",
            "After Abyss Watchers are defeated, find his note about the Path of the Dragon gesture",
            "Use Path of the Dragon gesture at the Archdragon Peak altar — Hawkwood invades",
            "Defeat Hawkwood to receive the Twinkling Dragon Torso Stone",
        },
    },
    {
        name = "Irina",
        completed = false,
        steps = {
            "Buy the Grave Key from the Undead Settlement sewer merchant",
            "Use it to free Irina from her cell near the Dilapidated Bridge bonfire",
            "Purchase ALL of her light miracles (do not give her any dark braille tomes)",
            "After buying everything she moves to the Altar of Sunlight — quest complete",
        },
        note = "LOCKOUT: Giving Irina dark braille tomes causes her to go mad and bricks her good ending. Give those to Karla.",
    },
}

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
    local w = love.graphics.getWidth()
    local mid_x = math.floor(w / 2)
    local panel_y = love.graphics.getHeight() - detail_height

    -- header
    love.graphics.print("DS3 Completionist Companion", 20, 18)

    local boss_done = 0
    for _, b in ipairs(bosses) do if b.defeated then boss_done = boss_done + 1 end end
    local quest_done = 0
    for _, q in ipairs(quests) do if q.completed then quest_done = quest_done + 1 end end

    love.graphics.setColor(0.7, 0.7, 0.7)
    love.graphics.print("Bosses", 20, 45)
    love.graphics.print(boss_done .. " / " .. #bosses .. " defeated", 20, 65)
    love.graphics.print("NPC Quests", mid_x + 20, 45)
    love.graphics.print(quest_done .. " / " .. #quests .. " completed", mid_x + 20, 65)
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
            if i == selected_boss then love.graphics.setColor(0.9, 0.8, 0.4) end
            love.graphics.print(status .. " " .. boss.name, 20, draw_y)
            love.graphics.setColor(1, 1, 1)
        end
    end

    for i, quest in ipairs(quests) do
        local status = quest.completed and "[X]" or "[ ]"
        local draw_y = header_height + (i * boss_spacing) + quest_scroll
        if draw_y > header_height then
            if i == selected_quest then love.graphics.setColor(0.9, 0.8, 0.4) end
            love.graphics.print(status .. " " .. quest.name, mid_x + 20, draw_y)
            love.graphics.setColor(1, 1, 1)
        end
    end

    love.graphics.setScissor()

    local panel_y = love.graphics.getHeight() - detail_height
    love.graphics.line(20, panel_y, love.graphics.getWidth() - 20, panel_y)

    local item = (selected_boss and bosses[selected_boss]) or (selected_quest and quests[selected_quest])
    if item then
        local done = item.defeated or item.completed
        local tag = done and " [Done]" or ""
        love.graphics.print(item.name .. tag, 30, panel_y + 10)
        local line_y = panel_y + 32
        if item.note then
            if item.note:sub(1, 7) == "LOCKOUT" then
                love.graphics.setColor(0.9, 0.3, 0.3)
            else
                love.graphics.setColor(0.8, 0.7, 0.3)
            end
            love.graphics.print(item.note, 30, line_y)
            love.graphics.setColor(1, 1, 1)
            line_y = line_y + 20
        end
        if item.steps then
            for j, step in ipairs(item.steps) do
                love.graphics.print(j .. ". " .. step, 30, line_y + (j - 1) * 22)
            end
        end
    else
        love.graphics.setColor(0.5, 0.5, 0.5)
        love.graphics.print("Click a boss or quest to see steps", 30, panel_y + 10)
        love.graphics.setColor(1, 1, 1)
    end
end

function love.mousepressed(x, y, button)
    if button ~= 1 then return end

    local mid_x = math.floor(love.graphics.getWidth() / 2)

    if x < mid_x then
        active_panel = "bosses"
        for i, boss in ipairs(bosses) do
            local boss_y = header_height + (i * boss_spacing) + boss_scroll
            if y >= boss_y and y <= boss_y + 20 then
                boss.defeated = not boss.defeated
                selected_boss = i
                selected_quest = nil
                saveProgress()
                break
            end
        end
    else
        active_panel = "quests"
        for i, quest in ipairs(quests) do
            local quest_y = header_height + (i * boss_spacing) + quest_scroll
            if y >= quest_y and y <= quest_y + 20 then
                quest.completed = not quest.completed
                selected_quest = i
                selected_boss = nil
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
    elseif key == "right" then
        active_panel = "quests"
        if not selected_quest then selected_quest = 1 end
        selected_boss = nil
    elseif key == "up" then
        if active_panel == "bosses" then
            selected_boss = math.max(1, (selected_boss or 2) - 1)
            selected_quest = nil
            local item_y = header_height + selected_boss * boss_spacing + boss_scroll
            if item_y < header_height + boss_spacing then
                boss_scroll = boss_scroll + (header_height + boss_spacing - item_y)
            end
        else
            selected_quest = math.max(1, (selected_quest or 2) - 1)
            selected_boss = nil
            local item_y = header_height + selected_quest * boss_spacing + quest_scroll
            if item_y < header_height + boss_spacing then
                quest_scroll = quest_scroll + (header_height + boss_spacing - item_y)
            end
        end
    elseif key == "down" then
        if active_panel == "bosses" then
            selected_boss = math.min(#bosses, (selected_boss or 0) + 1)
            selected_quest = nil
            local item_y = header_height + selected_boss * boss_spacing + boss_scroll
            local visible_bottom = love.graphics.getHeight() - detail_height - boss_spacing
            if item_y > visible_bottom then
                boss_scroll = boss_scroll - (item_y - visible_bottom)
            end
        else
            selected_quest = math.min(#quests, (selected_quest or 0) + 1)
            selected_boss = nil
            local item_y = header_height + selected_quest * boss_spacing + quest_scroll
            local visible_bottom = love.graphics.getHeight() - detail_height - boss_spacing
            if item_y > visible_bottom then
                quest_scroll = quest_scroll - (item_y - visible_bottom)
            end
        end
    elseif key == "space" or key == "return" then
        if selected_boss then
            bosses[selected_boss].defeated = not bosses[selected_boss].defeated
            saveProgress()
        elseif selected_quest then
            quests[selected_quest].completed = not quests[selected_quest].completed
            saveProgress()
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
                    bosses[boss_index].defeated = (line == "true")
                end

                boss_index = boss_index + 1

            elseif section == "quests" then

                if quests[quest_index] then
                    quests[quest_index].completed = (line == "true")
                end

                quest_index = quest_index + 1

            end

        end

    end

end

function love.wheelmoved(x, y)

    local mouse_x, mouse_y = love.mouse.getPosition()
    local mid_x = math.floor(love.graphics.getWidth() / 2)

    if mouse_x < mid_x then

        boss_scroll = boss_scroll + (y * 20)

        local content_height = #bosses * boss_spacing

        local min_scroll = math.min(0, love.graphics.getHeight() - header_height - detail_height - content_height - boss_spacing)

        if boss_scroll > 0 then
            boss_scroll = 0
        end

        if boss_scroll < min_scroll then
            boss_scroll = min_scroll
        end

    else

        quest_scroll = quest_scroll + (y * 20)

        local content_height = #quests * boss_spacing

        local min_scroll = math.min(0, love.graphics.getHeight() - header_height - detail_height - content_height - boss_spacing)

        if quest_scroll > 0 then
            quest_scroll = 0
        end

        if quest_scroll < min_scroll then
            quest_scroll = min_scroll
        end

    end

end
