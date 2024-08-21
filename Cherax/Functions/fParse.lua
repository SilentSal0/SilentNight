function ParseTunables(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v.tunable then
            local joaat = 0
            if type(v.tunable) == "string" then
                joaat = Utils.sJoaat(v.tunable)
            elseif type(v.tunable) == "number" and v.tunable == math.floor(v.tunable) then
                joaat = v.tunable
            else
                Logger.LogSN("Bad tunable! " .. v.tunable)
                break
            end
            local pointer = ScriptGlobal.GetTunableByHash(joaat)
            if pointer == 0 then
                Logger.LogSN("Bad tunable pointer! " .. v.tunable .. " " .. pointer)
                break
            end
            v.pointer = pointer
            v.Get = function(self)
                if self.type == "int" then
                    return Memory.ReadInt(self.pointer)
                elseif self.type == "float" then
                    return Memory.ReadFloat(self.pointer)
                end
                Logger.LogSN("No type for tunable! " .. self.tunable)
                return nil
            end
            v.Set = function(self, value)
                if self.type == "int" then
                    Memory.WriteInt(self.pointer, value)
                elseif self.type == "float" then
                    Memory.WriteFloat(self.pointer, value)
                else
                    Logger.LogSN("No type for tunable! " .. self.tunable)
                end
            end
            v.Reset = function(self)
                if self.type == "int" then
                    Memory.WriteInt(self.pointer, self.defaultValue)
                elseif self.type == "float" then
                    Memory.WriteFloat(self.pointer, self.defaultValue)
                else
                    Logger.LogSN("No type for tunable! " .. self.tunable)
                end
            end
        elseif type(v) == "table" then
            ParseTunables(v)
        end
    end
    tbl.HAS_PARSED = true
end

function ParseGlobals(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v.global then
            v.Get = function(self)
                if self.type == "int" then
                    return ScriptGlobal.GetInt(self.global)
                elseif self.type == "float" then
                    return ScriptGlobal.GetFloat(self.global)
                elseif self.type == "bool" then
                    return ScriptGlobal.GetBool(self.global)
                end
                Logger.LogSN("No type for global! " .. self.global)
                return nil
            end
            v.Set = function(self, value)
                if self.type == "int" then
                    ScriptGlobal.SetInt(self.global, value)
                elseif self.type == "float" then
                    ScriptGlobal.SetFloat(self.global, value)
                elseif self.type == "bool" then
                    ScriptGlobal.SetBool(self.global, value)
                else
                    Logger.LogSN("No type for global! " .. self.global)
                end
            end
        elseif type(v) == "table" then
            ParseGlobals(v)
        end
    end
    tbl.HAS_PARSED = true
end

function ParseLocals(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v.vLocal then
            v.Get = function(self)
                local scriptHash = Utils.sJoaat(self.script)
                if self.type == "int" then
                    return ScriptLocal.GetInt(scriptHash, self.vLocal)
                elseif self.type == "float" then
                    return ScriptLocal.GetFloat(scriptHash, self.vLocal)
                end
                Logger.LogSN("No type for local! ", self.vLocal)
                return nil
            end
            v.Set = function(self, value)
                local scriptHash = Utils.sJoaat(self.script)
                if self.type == "int" then
                    ScriptLocal.SetInt(scriptHash, self.vLocal, value)
                elseif self.type == "float" then
                    ScriptLocal.SetFloat(scriptHash, self.vLocal, value)
                else
                    Logger.LogSN("No type for local! " .. self.vLocal)
                end
            end
        elseif type(v) == "table" then
            ParseLocals(v)
        end
    end
    tbl.HAS_PARSED = true
end

function ParseStats(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v.stat then
            local function IsStoryStat()
                return v.stat:find("SP0") or v.stat:find("SP1") or v.stat:find("SP2")
            end
            local hash = 0
            if not v.stat:find("MPPLY") and not IsStoryStat() then
                local success, statValue = Stats.GetInt(Utils.sJoaat("MPPLY_LAST_MP_CHAR"))
                hash = Utils.sJoaat(string.format("MP%d_", statValue) .. v.stat)
            elseif v.stat:find("MPPLY") or IsStoryStat() then
                hash = Utils.sJoaat(v.stat)
            else
                Logger.LogSN("Bad stat! " .. v.stat)
                break
            end
            v.hash = hash
            v.Get = function(self)
                if self.type == "int" then
                    local success, statValue = Stats.GetInt(self.hash)
                    return statValue
                elseif self.type == "float" then
                    local success, statValue = Stats.GetFloat(self.hash)
                    return statValue
                elseif self.type == "bool" then
                    local success, statValue = Stats.GetBool(self.hash)
                    return statValue
                end
                Logger.LogSN("No type for stat! " .. self.stat)
                return nil
            end
            v.Set = function(self, value)
                if self.type == "int" then
                    Stats.SetInt(self.hash, value)
                elseif self.type == "float" then
                    Stats.SetFloat(self.hash, value)
                elseif self.type == "bool" then
                    Stats.SetBool(self.hash, value)
                else
                    Logger.LogSN("No type for stat! " .. self.stat)
                end
            end
        elseif type(v) == "table" then
            ParseStats(v)
        end
    end
    tbl.HAS_PARSED = true
end

function ParseTables(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and #v > 0 and type(v[1]) == "table" then
            v.GetNames = function(self)
                local names = {}
                for _, item in ipairs(v) do
                    table.insert(names, item.name)
                end
                return names
            end
            v.GetNamesRange = function(self, start, finish)
                local names = {}
                for i = start, finish do
                    if v[i] then
                        table.insert(names, v[i].name)
                    end
                end
                return names
            end
            v.GetIndexes = function(self)
                local indexes = {}
                for _, item in ipairs(v) do
                    table.insert(indexes, item.index)
                end
                return indexes
            end
        elseif type(v) == "table" then
            ParseTables(v)
        end
    end
    tbl.HAS_PARSED = true
end

function ParsePackedBools(tbl)
    for _, v in pairs(tbl) do
        if type(v) == "table" and v[1] then
            v.Set = function(self, value)
                local success, statValue = Stats.GetInt(Utils.sJoaat("MPPLY_LAST_MP_CHAR"))
                if v[2] then
                    for i = v[1], v[2] do
                        eNative.STATS.SET_PACKED_STAT_BOOL_CODE(i, value, statValue)
                    end
                else
                    eNative.STATS.SET_PACKED_STAT_BOOL_CODE(v[1], value, statValue)
                end
            end
        elseif type(v) == "table" then
            ParsePackedBools(v)
        end
    end
    tbl.HAS_PARSED = true
end

ParseTunables(eTunable)
ParseGlobals(eGlobal)
ParseLocals(eLocal)
ParseStats(eStat)
ParsePackedBools(ePackedBool)
ParseTables(eTable)

Script.QueueJob(function()
    local function AllParsed()
        return eTunable.HAS_PARSED and eGlobal.HAS_PARSED and eLocal.HAS_PARSED and eStat.HAS_PARSED and ePackedBool.HAS_PARSED and eTable.HAS_PARSED
    end
    while not AllParsed() do
        Script.Yield(1)
    end
    Logger.LogSN("Script has started successfully")
end)
