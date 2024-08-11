--[[
  Add in rime.lua:
    commit_on_set_ascii = require("commit_on_set_ascii")
  Add in schema engine/processors:
    lua_processor@commit_on_set_ascii
--]]
local f = {}
function f.init(env)
    context = env.engine.context
    context.option_update_notifier:connect(function(ctx, name)
        if name == "ascii_mode" and ctx:get_option("ascii_mode") then
            context:clear_non_confirmed_composition()
            context:commit()
        end
    end)
end
return f