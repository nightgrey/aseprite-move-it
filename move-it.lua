local CELS = {}

function visit(layer, collection)
    if layer.isEditable and layer.isVisible then
        if layer.isGroup == true then
            for _, l in ipairs(layer.layers) do
                visit(l, collection)
            end
        else
            if layer.cels then
                for _, cel in ipairs(layer.cels) do
                    table.insert(collection, cel)
                end
            end
        end
    end
end

function collect()
    for cel in pairs(CELS) do
        CELS[cel] = nil
    end

    for _, layer in ipairs(app.range.layers) do
        visit(layer, CELS)
    end
end

---
---Moves active cels up by the specified amount.
---
---
---@param x number
---@param y number
function MoveIt(x, y)
    collect()

    app.transaction(
        function()
            for _, cel in ipairs(CELS) do
                cel.position = Point(cel.position.x + x,
                    cel.position.y + y)

                -- app.tip("Moving cel to " .. cel.position.x .. ", " .. cel.position.y)
            end
        end
    )
    app.refresh()
end

---
---Set
---
---
---@param x number
---@param y number
function SetIt(x, y)
    collect()

    app.transaction(
        function()
            for _, cel in ipairs(CELS) do
                cel.position = Point(x, y)
            end
        end
    )
    app.refresh()
end

local function isenabled()
    return app.range.isEmpty == false or app.cel ~= nil
end

function init(plugin)
    -- we can use "plugin.preferences" as a table with fields for
    -- our plugin (these fields are saved between sessions)
    if plugin.preferences.nudge == nil then
        plugin.preferences.nudge = 1
    end

    if plugin.preferences.push == nil then
        plugin.preferences.push = 10
    end

    --
    plugin:newMenuGroup {
        id = "nudge-it",
        title = "Nudge",
        group = "layer_properties"
    }
    plugin:newCommand {
        id = "nudge-it-left",
        title = "Left",
        group = "nudge-it",
        onclick = function()
            MoveIt(-plugin.preferences.nudge, 0)
        end,
        onenabled = isenabled
    }
    plugin:newCommand {
        id = "nudge-it-right",
        title = "Right",
        group = "nudge-it",
        onclick = function()
            MoveIt(plugin.preferences.nudge, 0)
        end,
        onenabled = isenabled
    }
    plugin:newCommand {
        id = "nudge-it-up",
        title = "Up",
        group = "nudge-it",
        onclick = function()
            MoveIt(0, -plugin.preferences.nudge)
        end,
        onenabled = isenabled
    }
    plugin:newCommand {
        id = "nudge-it-down",
        title = "Down",
        group = "nudge-it",
        onclick = function()
            MoveIt(0, plugin.preferences.nudge)
        end,
        onenabled = isenabled
    }


    plugin:newMenuGroup {
        id = "push-it",
        title = "Push",
        group = "layer_properties"
    }

    plugin:newCommand {
        id = "push-it-left",
        title = "Left",
        group = "push-it",
        onclick = function()
            MoveIt(-plugin.preferences.push, 0)
        end,
        onenabled = isenabled
    }
    plugin:newCommand {
        id = "push-it-right",
        title = "Right",
        group = "push-it",
        onclick = function()
            MoveIt(plugin.preferences.push, 0)
        end,
        onenabled = isenabled
    }
    plugin:newCommand {
        id = "push-it-up",
        title = "Up",
        group = "push-it",
        onclick = function()
            MoveIt(0, -plugin.preferences.push)
        end,
        onenabled = isenabled
    }
    plugin:newCommand {
        id = "push-it-down",
        title = "Down",
        group = "push-it",
        onclick = function()
            MoveIt(0, plugin.preferences.push)
        end,
        onenabled = isenabled
    }

    plugin:newMenuGroup {
        id = "move-it",
        title = "Move",
        group = "layer_properties"
    }

    plugin:newCommand {
        id = "move-it-to-origin",
        title = "To origin",
        group = "move-it",
        onclick = function()
            SetIt(0, 0)
        end,
        onenabled = isenabled
    }
end
