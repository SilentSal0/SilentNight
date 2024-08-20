FeatureMgr.AddFeature(bunkerPrice.hash, bunkerPrice.name, bunkerPrice.type, bunkerPrice.desc, function(f)
    bunkerPrice.func()
end)

FeatureMgr.AddFeature(bunkerReset.hash, bunkerReset.name, bunkerReset.type, bunkerReset.desc, function(f)
    bunkerReset.func()
end)

FeatureMgr.AddFeature(bunkerSell.hash, bunkerSell.name, bunkerSell.type, bunkerSell.desc, function(f)
    bunkerSell.func()
end)

FeatureMgr.AddFeature(bunkerOpen.hash, bunkerOpen.name, bunkerOpen.type, bunkerOpen.desc, function(f)
    bunkerOpen.func()
end)

FeatureMgr.AddFeature(bunkerTrigger.hash, bunkerTrigger.name, bunkerTrigger.type, bunkerTrigger.desc, function(f)
    bunkerTrigger.func()
end)

FeatureMgr.AddFeature(bunkerSupply.hash, bunkerSupply.name, bunkerSupply.type, bunkerSupply.desc, function(f)
    bunkerSupply.func()
end)

FeatureMgr.AddFeature(bunkerSupplier.hash, bunkerSupplier.name, bunkerSupplier.type, bunkerSupplier.desc, function(f)
    bunkerSupplier.func(bool)
end)

FeatureMgr.AddFeature(bunkerMade.hash, bunkerMade.name, bunkerMade.type, bunkerMade.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_LIFETIME_BKR_SEL_COMPLETBC5:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(10)
    :Reset()

FeatureMgr.AddFeature(bunkerUndertaken.hash, bunkerUndertaken.name, bunkerUndertaken.type, bunkerUndertaken.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_LIFETIME_BKR_SEL_UNDERTABC5:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(10)
    :Reset()

FeatureMgr.AddFeature(bunkerEarnings.hash, bunkerEarnings.name, bunkerEarnings.type, bunkerEarnings.desc, function(f)
end)
    :RegisterCallbackTrigger(eCallbackTrigger.OnSessionChange)
    :SetDefaultValue(eStat.MPX_LIFETIME_BKR_SELL_EARNINGS5:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(1000000)
    :Reset()

for i = 1, 2 do
    FeatureMgr.AddFeature(bunkerToggles[i].hash, bunkerToggles[i].name, bunkerToggles[i].type, bunkerToggles[i].desc, function(f)
    end)
end

FeatureMgr.AddFeature(bunkerApply.hash, bunkerApply.name, bunkerApply.type, bunkerApply.desc, function(f)
    local args = {}
    for i = 1, 2 do
        table.insert(args, FeatureMgr.GetFeature(bunkerToggles[i].hash):IsToggled())
    end
    for i = 1, 3 do
        table.insert(args, FeatureMgr.GetFeature(bunkerStats[i].hash):GetIntValue())
    end
    bunkerApply.func(table.unpack(args))
end)
