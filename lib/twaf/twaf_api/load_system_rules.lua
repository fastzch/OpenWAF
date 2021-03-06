
-- Copyright (C) Miracle
-- Copyright (C) OpenWAF

local _M = {
    _VERSION = "0.0.1"
}

local twaf_conf = require "lib.twaf.twaf_conf"

_M.api = {}
_M.help = {}
_M.api.load_system_rules = {}

_M.api.load_system_rules.get = function(_twaf, log, u)
    
    local delete_id = {}
    for phase, rules in pairs(_twaf.config.rules) do
        for i, r in ipairs(rules) do
            table.insert(delete_id, r.id)
          --table.remove(rules, i)
            _twaf.config.rules_id[r.id] = nil
        end
    end
    log.result = #delete_id
    _twaf.config.rules = {}
    twaf_conf.load_rules(_twaf.config)
end

_M.help.load_system_rules = {
    "GET host/path/access_rule/{user}/{uuid}",
    "POST host/path/access_rule/{user}/{pos}",
    "POST host/path/access_rule/{user}/uuid/{uuid}",
    "PUT host/path/access_rule/{user}/{uuid}",
    "DELETE host/path/access_rule/{user}/{uuid}"
}
    
return _M