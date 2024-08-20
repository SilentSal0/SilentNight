FeatureMgr.AddFeature(hangarCargo.hash, hangarCargo.name, hangarCargo.type, hangarCargo.desc, function(f)
end)
    :SetList(hangarCargo.list:GetNames())

FeatureMgr.AddFeature(hangarSelect.hash, hangarSelect.name, hangarSelect.type, hangarSelect.desc, function(f)
end)
    :SetDefaultValue(30000)
    :SetLimitValues(0, 4000000)
    :SetStepSize(30000)
    :Reset()

FeatureMgr.AddFeature(hangarPApply.hash, hangarPApply.name, hangarPApply.type, hangarPApply.desc, function(f)
    local cargo = hangarCargo.list[FeatureMgr.GetFeatureListIndex(hangarCargo.hash) + 1].index
    local price = FeatureMgr.GetFeature(hangarSelect.hash):GetIntValue()
    hangarPApply.func(cargo, price)
end)

FeatureMgr.AddFeature(hangarReset.hash, hangarReset.name, hangarReset.type, hangarReset.desc, function(f)
    FeatureMgr.GetFeature(hangarCargo.hash):SetListIndex(0)
    FeatureMgr.GetFeature(hangarSelect.hash):SetIntValue(30000)
    hangarReset.func()
end)

FeatureMgr.AddFeature(hangarDelivered.hash, hangarDelivered.name, hangarDelivered.type, hangarDelivered.desc, function(f)
end)
    :SetDefaultValue(0)
    :SetLimitValues(0, 15)
    :SetStepSize(1)
    :Reset()

FeatureMgr.AddFeature(hangarSell.hash, hangarSell.name, hangarSell.type, hangarSell.desc, function(f)
    local delivered = FeatureMgr.GetFeature(hangarDelivered.hash):GetIntValue()
    hangarSell.func(delivered)
end)

FeatureMgr.AddFeature(hangarOpen.hash, hangarOpen.name, hangarOpen.type, hangarOpen.desc, function(f)
    hangarOpen.func()
end)

FeatureMgr.AddFeature(hangarSupply.hash, hangarSupply.name, hangarSupply.type, hangarSupply.desc, function(f)
    hangarSupply.func()
end)

FeatureMgr.AddFeature(hangarSupplier.hash, hangarSupplier.name, hangarSupplier.type, hangarSupplier.desc, function(f)
end)

FeatureMgr.AddFeature(hangarBuyMade.hash, hangarBuyMade.name, hangarBuyMade.type, hangarBuyMade.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_LFETIME_HANGAR_BUY_COMPLET:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(10)
    :Reset()

FeatureMgr.AddFeature(hangarBuyUndertaken.hash, hangarBuyUndertaken.name, hangarBuyUndertaken.type, hangarBuyUndertaken.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_LFETIME_HANGAR_BUY_UNDETAK:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(10)
    :Reset()

FeatureMgr.AddFeature(hangarSellMade.hash, hangarSellMade.name, hangarSellMade.type, hangarSellMade.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_LFETIME_HANGAR_SEL_UNDETAK:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(10)
    :Reset()

FeatureMgr.AddFeature(hangarSellUndertaken.hash, hangarSellUndertaken.name, hangarSellUndertaken.type, hangarSellUndertaken.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_LFETIME_HANGAR_SEL_UNDETAK:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(10)
    :Reset()

FeatureMgr.AddFeature(hangarEarnings.hash, hangarEarnings.name, hangarEarnings.type, hangarEarnings.desc, function(f)
end)
    :SetDefaultValue(eStat.MPX_LFETIME_HANGAR_EARNINGS:Get())
    :SetLimitValues(0, INT32_MAX)
    :SetStepSize(1000000)
    :Reset()

for i = 1, 3 do
    FeatureMgr.AddFeature(hangarToggles[i].hash, hangarToggles[i].name, hangarToggles[i].type, hangarToggles[i].desc, function(f)
    end)
end

FeatureMgr.AddFeature(hangarApply.hash, hangarApply.name, hangarApply.type, hangarApply.desc, function(f)
    local args = {}
    for i = 1, 3 do
        table.insert(args, FeatureMgr.GetFeature(hangarToggles[i].hash):IsToggled())
    end
    for i = 1, 5 do
        table.insert(args, FeatureMgr.GetFeature(hangarStats[i].hash):GetIntValue())
    end
    hangarApply.func(table.unpack(args))
end)