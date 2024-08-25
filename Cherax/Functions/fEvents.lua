local function OnPresent()
    if FeatureMgr.GetFeature(Utils.Joaat("LogTransactions")) then
        if FeatureMgr.GetFeature(Utils.Joaat("LogTransactions")):IsToggled() then
            Log("Log Transactions feature enabled. Silent Night unloaded")
            SetShouldUnload()
        end
    end
end

EventMgr.RegisterHandler(eLuaEvent.ON_PRESENT, OnPresent)
