local function DiamondAutograbber()
    if FeatureMgr.GetFeature(diamondAutograbber.hash):IsToggled() then
        diamondAutograbber.func()
    end
end

local function TurkishSupplier()
    if FeatureMgr.GetFeature(bunkerSupplier.hash):IsToggled() then
        bunkerSupplier.func()
        Script.Yield(1000)
    end
    if FeatureMgr.GetFeature(hangarSupplier.hash):IsToggled() then
        hangarSupplier.func()
        Script.Yield(1000)
    end
    if FeatureMgr.GetFeature(specialSupplier.hash):IsToggled() then
        specialSupplier.func()
        Script.Yield(1000)
    end
end

local function EasyLooper()
    if FeatureMgr.GetFeature(easyLoop5k.hash):IsToggled() then
        easyLoop5k.func()
        Script.Yield(1500)
    end
    if FeatureMgr.GetFeature(easyLoop50k.hash):IsToggled() then
        easyLoop50k.func()
        Script.Yield(333)
    end
    if FeatureMgr.GetFeature(easyLoop180k.hash):IsToggled() then
        easyLoop180k.func()
        Script.Yield(333)
    end
    if FeatureMgr.GetFeature(easyLoop300k.hash):IsToggled() then
        easyLoop300k.func()
        Script.Yield(1000)
    end
end

Script.RegisterLooped(function()
    PLAYER_ID = GTA.GetLocalPlayerId()
    DiamondAutograbber()
    TurkishSupplier()
    EasyLooper()
    Script.Yield(1)
end)
