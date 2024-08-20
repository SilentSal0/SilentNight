
FeatureMgr.AddFeature(genericCutscene.hash, genericCutscene.name, genericCutscene.type, genericCutscene.desc, function(f)
    genericCutscene.func()
end)

FeatureMgr.AddFeature(genericLaunch.hash, genericLaunch.name, genericLaunch.type, genericLaunch.desc, function(f)
    genericLaunch.func()
end)
