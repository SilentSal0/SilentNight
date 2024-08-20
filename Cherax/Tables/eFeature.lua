eFeature = {
    Heist = {
        Generic = {
            Cutscene = {
                hash = Utils.Joaat("SN_Generic_Cutscene"),
                name = "Skip Cutscene",
                type = eFeatureType.Button,
                desc = "Skips the current cutscene.",
                func = function()
                    eNative.CUTSCENE.STOP_CUTSCENE_IMMEDIATELY()
                end
            },
            Launch = {
                hash = Utils.Joaat("SN_Generic_Launch"),
                name = "Solo Launch",
                type = eFeatureType.Button,
                desc = "Allows launching the heist alone.",
                func = function()
                    eLocal.Heist.Generic.Launch1:Set(1)
                    ScriptGlobal.SetInt(794744 + 4 + 1 + (eLocal.Heist.Generic.Launch2:Get() * 89) + 69, 1)
                    eGlobal.Heist.Generic.Launch1:Set(1)
                    eGlobal.Heist.Generic.Launch2:Set(1)
                    eGlobal.Heist.Generic.Launch3:Set(1)
                    eGlobal.Heist.Generic.Launch4:Set(0)
                end
            },
        },
        Agency = {
            Preps = {
                Contract = {
                    hash = Utils.Joaat("SN_Agency_Contract"),
                    name = "Contract",
                    type = eFeatureType.Combo,
                    desc = "Select the desired VIP contract.",
                    list = eTable.Heist.Agency.Contracts
                },
                Complete = {
                    hash = Utils.Joaat("SN_Agency_Complete"),
                    name = "Apply & Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Applies all changes and completes all preparations.",
                    func = function(contract)
                        if contract < 12 then
                            eStat.MPX_FIXER_STORY_BS:Set(contract)
                        else
                            eStat.MPX_FIXER_STORY_BS:Set(contract)
                            eStat.MPX_FIXER_FIXER_STORY_STRAND:Set(-1)
                        end
                        eStat.MPX_FIXER_GENERAL_BS:Set(-1)
                        eStat.MPX_FIXER_COMPLETED_BS:Set(-1)
                        eStat.MPX_FIXER_STORY_COOLDOWN:Set(-1)
                    end
                }
            },
            Misc = {
                Cooldown = {
                    hash = Utils.Joaat("SN_Agency_Cooldown"),
                    name = "Kill Cooldown",
                    type = eFeatureType.Button,
                    desc = "Skips the heist's cooldown.",
                    func = function()
                        eTunable.Heist.Agency.Cooldown:Set(0)
                    end
                },
                Finish = {
                    hash = Utils.Joaat("SN_Agency_Finish"),
                    name = "Instant Finish",
                    type = eFeatureType.Button,
                    desc = "Finishes the heist instantly. Use after the heist has started.",
                    func = function()
                        eLocal.Heist.Agency.Finish1:Set(51338752)
                        eLocal.Heist.Agency.Finish2:Set(50)
                    end
                }
            },
            Payout = {
                Select = {
                    hash = Utils.Joaat("SN_Agency_Select"),
                    name = "Payout",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired payout."
                },
                Apply = {
                    hash = Utils.Joaat("SN_Agency_Apply"),
                    name = "Apply Payout",
                    type = eFeatureType.Button,
                    desc = "Applies the selected payout. Use after the heist has started.",
                    func = function(payout)
                        eTunable.Heist.Agency.Payout:Set(payout)
                    end
                }
            }
        },
        AutoShop = {
            Preps = {
                Contract = {
                    hash = Utils.Joaat("SN_AutoShop_Contract"),
                    name = "Contract",
                    type = eFeatureType.Combo,
                    desc = "Select the desired contract.",
                    list = eTable.Heist.AutoShop.Contracts
                },
                Complete = {
                    hash = Utils.Joaat("SN_AutoShop_Complete"),
                    name = "Apply & Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Applies all changes and completes all preparations. Also, redraws the planning board.",
                    func = function(contract)
                        eStat.MPX_TUNER_CURRENT:Set(contract)
                        eStat.MPX_TUNER_GEN_BS:Set((contract == 1) and 4351 or 12543)
                        eLocal.Heist.AutoShop.Reload:Set(2)
                    end
                },
                Reload = {
                    hash = Utils.Joaat("SN_AutoShop_Reload"),
                    name = "Redraw Board",
                    type = eFeatureType.Button,
                    desc = "Redraws the planning board.",
                    func = function()
                        eLocal.Heist.AutoShop.Reload:Set(2)
                    end
                }
            },
            Misc = {
                Cooldown = {
                    hash = Utils.Joaat("SN_AutoShop_Cooldown"),
                    name = "Kill Cooldown",
                    type = eFeatureType.Button,
                    desc = "Skips the heist's cooldown.",
                    func = function()
                        eStat.MPX_TUNER_CONTRACT0_POSIX:Set(0)
                        eStat.MPX_TUNER_CONTRACT1_POSIX:Set(0)
                        eStat.MPX_TUNER_CONTRACT2_POSIX:Set(0)
                        eStat.MPX_TUNER_CONTRACT3_POSIX:Set(0)
                        eStat.MPX_TUNER_CONTRACT4_POSIX:Set(0)
                        eStat.MPX_TUNER_CONTRACT5_POSIX:Set(0)
                        eStat.MPX_TUNER_CONTRACT6_POSIX:Set(0)
                        eStat.MPX_TUNER_CONTRACT7_POSIX:Set(0)
                        eTunable.Heist.AutoShop.Cooldown:Set(0)
                    end
                },
                Finish = {
                    hash = Utils.Joaat("SN_AutoShop_Finish"),
                    name = "Instant Finish",
                    type = eFeatureType.Button,
                    desc = "Finishes the heist instantly. Use after the heist has started.",
                    func = function()
                        eLocal.Heist.AutoShop.Finish1:Set(51338977)
                        eLocal.Heist.AutoShop.Finish2:Set(101)
                    end
                }
            },
            Payout = {
                Select = {
                    hash = Utils.Joaat("SN_AutoShop_Select"),
                    name = "Payout",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired payout."
                },
                Apply = {
                    hash = Utils.Joaat("SN_AutoShop_Apply"),
                    name = "Apply Payout",
                    type = eFeatureType.Button,
                    desc = "Applies the selected payout. Use after the heist has started.",
                    func = function(payout)
                        eTunable.Heist.AutoShop.Payout.First:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Second:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Third:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Fourth:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Fifth:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Sixth:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Seventh:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Eight:Set(payout)
                        eTunable.Heist.AutoShop.Payout.Fee:Set(0)
                    end
                }
            }
        },
        Apartment = {
            Preps = {
                Complete = {
                    hash = Utils.Joaat("SN_Apartment_Complete"),
                    name = "Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Completes all preparations.",
                    func = function()
                        eStat.MPX_HEIST_PLANNING_STAGE:Set(-1)
                    end
                },
                Reload = {
                    hash = Utils.Joaat("SN_Apartment_Reload"),
                    name = "Redraw Board",
                    type = eFeatureType.Button,
                    desc = "Redraws the planning board.",
                    func = function()
                        eGlobal.Heist.Apartment.Reload:Set(22)
                    end
                },
            },
            Misc = {
                Finish = {
                    hash = Utils.Joaat("SN_Apartment_Finish"),
                    name = "Instant Finish",
                    type = eFeatureType.Button,
                    desc = "Finishes the heist instantly. Use after the heist has started.",
                    func = function()
                        eLocal.Heist.Apartment.Finish1:Set(80)
                        eLocal.Heist.Apartment.Finish2:Set(10000000)
                        eLocal.Heist.Apartment.Finish3:Set(99999)
                        eLocal.Heist.Apartment.Finish4:Set(99999)
                    end
                },
                FleecaHack = {
                    hash = Utils.Joaat("SN_Apartment_FleecaHack"),
                    name = "Bypass Fleeca Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the hacking process of The Fleeca Job.",
                    func = function()
                        eLocal.Heist.Apartment.Bypass.Fleeca.Hack:Set(7)
                    end
                },
                FleecaDrill = {
                    hash = Utils.Joaat("SN_Apartment_FleecaDrill"),
                    name = "Bypass Fleeca Drill",
                    type = eFeatureType.Button,
                    desc = "Skips the drilling process of The Fleeca Job.",
                    func = function()
                        eLocal.Heist.Apartment.Bypass.Fleeca.Drill:Set(100)
                    end
                },
                PacificHack = {
                    hash = Utils.Joaat("SN_Apartment_PacificHack"),
                    name = "Bypass Pacific Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the hacking process of The Pacific Standard Job.",
                    func = function()
                        eLocal.Heist.Apartment.Bypass.Pacific.Hack:Set(9)
                    end
                },
                Play = {
                    hash = Utils.Joaat("SN_Apartment_Play"),
                    name = "Play Unavailable Jobs",
                    type = eFeatureType.Button,
                    desc = "Allows you to play unavailable jobs. Also, skips the heist's cooldown.",
                    func = function()
                        eGlobal.Heist.Apartment.Jobs:Set(31)
                    end
                },
                Unlock = {
                    hash = Utils.Joaat("SN_Apartment_Unlock"),
                    name = "Unlock All Jobs",
                    type = eFeatureType.Button,
                    desc = "Unlocks all jobs without playing every heist one by one. Restart the game after.",
                    func = function()
                        eStat.MPX_HEIST_SAVED_STRAND_0:Set(eTunable.Heist.Apartment.RootIdHash.Fleeca:Get())
                        eStat.MPX_HEIST_SAVED_STRAND_0_L:Set(5)
                        eStat.MPX_HEIST_SAVED_STRAND_1:Set(eTunable.Heist.Apartment.RootIdHash.Prison:Get())
                        eStat.MPX_HEIST_SAVED_STRAND_1_L:Set(5)
                        eStat.MPX_HEIST_SAVED_STRAND_2:Set(eTunable.Heist.Apartment.RootIdHash.Humane:Get())
                        eStat.MPX_HEIST_SAVED_STRAND_2_L:Set(5)
                        eStat.MPX_HEIST_SAVED_STRAND_3:Set(eTunable.Heist.Apartment.RootIdHash.Series:Get())
                        eStat.MPX_HEIST_SAVED_STRAND_3_L:Set(5)
                        eStat.MPX_HEIST_SAVED_STRAND_4:Set(eTunable.Heist.Apartment.RootIdHash.Pacific:Get())
                        eStat.MPX_HEIST_SAVED_STRAND_4_L:Set(5)
                    end
                }
            },
            Cuts = {
                Team = {
                    hash = Utils.Joaat("SN_Apartment_Team"),
                    name = "Team",
                    type = eFeatureType.Combo,
                    desc = "Select your number of players.",
                    list = eTable.Heist.Apartment.Team
                },
                Receivers = {
                    hash = Utils.Joaat("SN_Apartment_Receivers"),
                    name = "Receivers",
                    type = eFeatureType.Combo,
                    desc = "Decide who will receive the money.",
                    list = eTable.Heist.Apartment.Receivers
                },
                Presets = {
                    hash = Utils.Joaat("SN_Apartment_Presets"),
                    name = "Presets",
                    type = eFeatureType.Combo,
                    desc = "Select one of the ready-made presets. High cuts are calculated for Normal difficulty.",
                    list = eTable.Heist.Apartment.Presets
                },
                Player1 = {
                    hash = Utils.Joaat("SN_Apartment_Player1"),
                    name = "Player 1",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 1."
                },
                Player2 = {
                    hash = Utils.Joaat("SN_Apartment_Player2"),
                    name = "Player 2",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 2."
                },
                Player3 = {
                    hash = Utils.Joaat("SN_Apartment_Player3"),
                    name = "Player 3",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 3."
                },
                Player4 = {
                    hash = Utils.Joaat("SN_Apartment_Player4"),
                    name = "Player 4",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 4."
                },
                Apply = {
                    hash = Utils.Joaat("SN_Apartment_Apply"),
                    name = "Apply Cuts",
                    type = eFeatureType.Button,
                    desc = "Applies the selected cuts for players.",
                    func = function(team, receivers, cut1, cut2, cut3, cut4)
                        GUI.Toggle()
                        local function SetCuts()
                            eGlobal.Heist.Apartment.Cut.Player1.Global:Set(100 - (cut1 * team))
                            eGlobal.Heist.Apartment.Cut.Player2.Global:Set(cut2)
                            eGlobal.Heist.Apartment.Cut.Player3.Global:Set(cut3)
                            eGlobal.Heist.Apartment.Cut.Player4.Global:Set(cut4)
                            eNative.PAD.SET_CURSOR_POSITION(0.775, 0.175)
                            SimulatePlayerControl(237)
                            SimulateFrontendControl(202)
                            Script.Yield(1000)
                        end
                        if receivers == 0 and team ~= 1 then
                            SetCuts()
                            eGlobal.Heist.Apartment.Cut.Player1.Local:Set(cut1)
                        elseif receivers == 1 and team ~= 1 then
                            SetCuts()
                        elseif receivers == 2 or team == 1 then
                            eGlobal.Heist.Apartment.Cut.Player1.Local:Set(cut1)
                        end
                        GUI.Toggle()
                    end
                }
            }
        },
        CayoPerico = {
            Preps = {
                Difficulty = {
                    hash = Utils.Joaat("SN_CayoPerico_Difficulty"),
                    name = "Difficulty",
                    type = eFeatureType.Combo,
                    desc = "Select the desired difficulty.",
                    list = eTable.Heist.CayoPerico.Difficulties
                },
                Approach = {
                    hash = Utils.Joaat("SN_CayoPerico_Approach"),
                    name = "Approach",
                    type = eFeatureType.Combo,
                    desc = "Select the desired approach.",
                    list = eTable.Heist.CayoPerico.Approaches
                },
                Loadout = {
                    hash = Utils.Joaat("SN_CayoPerico_Loadout"),
                    name = "Loadout",
                    type = eFeatureType.Combo,
                    desc = "Select the desired loadout.",
                    list = eTable.Heist.CayoPerico.Loadouts
                },
                Target = {
                    Primary = {
                        hash = Utils.Joaat("SN_CayoPerico_PrimaryTarget"),
                        name = "Target",
                        type = eFeatureType.Combo,
                        desc = "Select the desired primary target.",
                        list = eTable.Heist.CayoPerico.Targets.Primary
                    },
                    Secondary = {
                        Compound = {
                            hash = Utils.Joaat("SN_CayoPerico_CompoundTarget"),
                            name = "Com. Target",
                            type = eFeatureType.Combo,
                            desc = "Select the desired compound target.",
                            list = eTable.Heist.CayoPerico.Targets.Secondary
                        },
                        Island = {
                            hash = Utils.Joaat("SN_CayoPerico_IslandTarget"),
                            name = "Isl. Target",
                            type = eFeatureType.Combo,
                            desc = "Select the desired island target.",
                            list = eTable.Heist.CayoPerico.Targets.Secondary
                        }                    
                    },
                    Amount = {
                        Compound = {
                            hash = Utils.Joaat("SN_CayoPerico_CompoundAmount"),
                            name = "Com. Amount",
                            type = eFeatureType.Combo,
                            desc = "Select the desired compound target amount.",
                            list = eTable.Heist.CayoPerico.Targets.Amounts.Compound
                        },
                        Island = {
                            hash = Utils.Joaat("SN_CayoPerico_IslandAmount"),
                            name = "Isl. Amount",
                            type = eFeatureType.Combo,
                            desc = "Select the desired island target amount.",
                            list = eTable.Heist.CayoPerico.Targets.Amounts.Island
                        },
                        Arts = {
                            hash = Utils.Joaat("SN_CayoPerico_ArtsAmount"),
                            name = "Arts Amount",
                            type = eFeatureType.Combo,
                            desc = "Select the desired compound arts amount.",
                            list = eTable.Heist.CayoPerico.Targets.Amounts.Arts
                        }
                    }
                },
                Complete = {
                    hash = Utils.Joaat("SN_CayoPerico_Complete"),
                    name = "Apply & Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Applies all changes and completes all preparations. Also, reloads the planning screen.",
                    func = function(difficulty, approach, loadout, primaryTarget, compoundTarget, compoundAmount, artsAmount, islandTarget, islandAmount)
                        eStat.MPX_H4_PROGRESS:Set(difficulty)
                        eStat.MPX_H4_MISSIONS:Set(approach)
                        eStat.MPX_H4CNF_WEAPONS:Set(loadout)
                        eStat.MPX_H4CNF_TARGET:Set(primaryTarget)
                        eStat.MPX_H4LOOT_CASH_C:Set((eStat.MPX_H4LOOT_CASH_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_CASH_C_SCOPED:Set((eStat.MPX_H4LOOT_CASH_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_WEED_C:Set((eStat.MPX_H4LOOT_WEED_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_WEED_C_SCOPED:Set((eStat.MPX_H4LOOT_WEED_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_COKE_C:Set((eStat.MPX_H4LOOT_COKE_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_COKE_C_SCOPED:Set((eStat.MPX_H4LOOT_COKE_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_GOLD_C:Set((eStat.MPX_H4LOOT_GOLD_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_GOLD_C_SCOPED:Set((eStat.MPX_H4LOOT_GOLD_C.stat:find(compoundTarget)) and compoundAmount or 0)
                        eStat.MPX_H4LOOT_PAINT:Set((artsAmount ~= 0) and artsAmount or 0)
                        eStat.MPX_H4LOOT_PAINT_SCOPED:Set((artsAmount ~= 0) and artsAmount or 0)
                        eStat.MPX_H4LOOT_CASH_I:Set((eStat.MPX_H4LOOT_CASH_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_CASH_I_SCOPED:Set((eStat.MPX_H4LOOT_CASH_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_WEED_I:Set((eStat.MPX_H4LOOT_WEED_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_WEED_I_SCOPED:Set((eStat.MPX_H4LOOT_WEED_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_COKE_I:Set((eStat.MPX_H4LOOT_COKE_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_COKE_I_SCOPED:Set((eStat.MPX_H4LOOT_COKE_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_GOLD_I:Set((eStat.MPX_H4LOOT_GOLD_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_GOLD_I_SCOPED:Set((eStat.MPX_H4LOOT_GOLD_I.stat:find(islandTarget)) and islandAmount or 0)
                        eStat.MPX_H4LOOT_CASH_V:Set((compoundTarget ~= 0 or islandTarget ~= 0) and 83250 or 0)
                        eStat.MPX_H4LOOT_WEED_V:Set((compoundTarget ~= 0 or islandTarget ~= 0) and 135000 or 0)
                        eStat.MPX_H4LOOT_COKE_V:Set((compoundTarget ~= 0 or islandTarget ~= 0) and 202500 or 0)
                        eStat.MPX_H4LOOT_GOLD_V:Set((compoundTarget ~= 0 or islandTarget ~= 0) and 333333 or 0)
                        eStat.MPX_H4LOOT_PAINT_V:Set((artsAmount ~= 0) and 180000 or 0)
                        eStat.MPX_H4CNF_UNIFORM:Set(-1)
                        eStat.MPX_H4CNF_GRAPPEL:Set(-1)
                        eStat.MPX_H4CNF_TROJAN:Set(5)
                        eStat.MPX_H4CNF_WEP_DISRP:Set(3)
                        eStat.MPX_H4CNF_ARM_DISRP:Set(3)
                        eStat.MPX_H4CNF_HEL_DISRP:Set(3)
                        eStat.MPX_H4_PLAYTHROUGH_STATUS:Set(10)
                        eLocal.Heist.CayoPerico.Reload:Set(2)
                    end
                },
                Reload = {
                    hash = Utils.Joaat("SN_CayoPerico_Reload"),
                    name = "Reload Screen",
                    type = eFeatureType.Button,
                    desc = "Reloads the planning screen.",
                    func = function()
                        eLocal.Heist.CayoPerico.Reload:Set(2)
                    end
                }
            },
            Misc = {
                Cooldown = {
                    Solo = {
                        hash = Utils.Joaat("SN_CayoPerico_SoloCooldown"),
                        name = "Kill Cooldown (after solo)",
                        type = eFeatureType.Button,
                        desc = "Skips the heist's cooldown after you have played solo.",
                        func = function()
                            eStat.MPX_H4_TARGET_POSIX:Set(1659643454)
                            eStat.MPX_H4_COOLDOWN:Set(0)
                            eStat.MPX_H4_COOLDOWN_HARD:Set(0)
                        end
                    },
                    Team = {
                        hash = Utils.Joaat("SN_CayoPerico_TeamCooldown"),
                        name = "Kill Cooldown (after team)",
                        type = eFeatureType.Button,
                        desc = "Skips the heist's cooldown after you have played with a team.",
                        func = function()
                            eStat.MPX_H4_TARGET_POSIX:Set(1659429119)
                            eStat.MPX_H4_COOLDOWN:Set(0)
                            eStat.MPX_H4_COOLDOWN_HARD:Set(0)
                        end
                    }
                },
                Finish = {
                    hash = Utils.Joaat("SN_CayoPerico_Finish"),
                    name = "Instant Finish",
                    type = eFeatureType.Button,
                    desc = "Finishes the heist instantly. Use after the heist has started.",
                    func = function()
                        eLocal.Heist.CayoPerico.Finish1:Set(9)
                        eLocal.Heist.CayoPerico.Finish2:Set(50)
                    end
                },
                FingerprintHack = {
                    hash = Utils.Joaat("SN_CayoPerico_FingerprintHack"),
                    name = "Bypass Fingerprint Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the hacking process.",
                    func = function()
                        eLocal.Heist.CayoPerico.Bypass.FingerprintHack:Set(5)
                    end
                },
                PlasmaCutterCut = {
                    hash = Utils.Joaat("SN_CayoPerico_PlasmaCutterCut"),
                    name = "Bypass Plasma Cutter Cut",
                    type = eFeatureType.Button,
                    desc = "Skips the cutting process.",
                    func = function()
                        eLocal.Heist.CayoPerico.Bypass.PlasmaCutterCut:Set(100)
                    end
                },
                DrainagePipeCut = {
                    hash = Utils.Joaat("SN_CayoPerico_DrainagePipeCut"),
                    name = "Bypass Drainage Pipe Cut",
                    type = eFeatureType.Button,
                    desc = "Skips the cutting process.",
                    func = function()
                        eLocal.Heist.CayoPerico.Bypass.DrainagePipeCut:Set(6)
                    end
                },
                Bag = {
                    hash = Utils.Joaat("SN_CayoPerico_Bag"),
                    name = "Woman's Bag",
                    type = eFeatureType.Button,
                    desc = "Increases the size of the bag for the current run. Use with caution.",
                    func = function()
                        eTunable.Heist.CayoPerico.Bag.MaxCapacity:Set(99999)
                    end
                },
                Unlock = {
                    hash = Utils.Joaat("SN_CayoPerico_Unlock"),
                    name = "Unlock All POI",
                    type = eFeatureType.Button,
                    desc = "Unlocks all points of interest.",
                    func = function()
                        eStat.MPX_H4CNF_BS_GEN:Set(-1)
                        eStat.MPX_H4CNF_BS_ENTR:Set(63)
                        eStat.MPX_H4CNF_BS_ABIL:Set(63)
                        eStat.MPX_H4CNF_APPROACH:Set(-1)
                        eLocal.Heist.CayoPerico.Reload:Set(2)
                    end
                }
            },
            Cuts = {
                Team = {
                    hash = Utils.Joaat("SN_CayoPerico_Team"),
                    name = "Team",
                    type = eFeatureType.Combo,
                    desc = "Select your number of players.",
                    list = eTable.Heist.Generic.Team
                },
                Presets = {
                    hash = Utils.Joaat("SN_CayoPerico_Presets"),
                    name = "Presets",
                    type = eFeatureType.Combo,
                    desc = "Select one of the ready-made presets.",
                    list = eTable.Heist.Generic.Presets
                },
                Player1 = {
                    hash = Utils.Joaat("SN_CayoPerico_Player1"),
                    name = "Player 1",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 1."
                },
                Player2 = {
                    hash = Utils.Joaat("SN_CayoPerico_Player2"),
                    name = "Player 2",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 2."
                },
                Player3 = {
                    hash = Utils.Joaat("SN_CayoPerico_Player3"),
                    name = "Player 3",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 3."
                },
                Player4 = {
                    hash = Utils.Joaat("SN_CayoPerico_Player4"),
                    name = "Player 4",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 4."
                },
                Apply = {
                    hash = Utils.Joaat("SN_CayoPerico_Apply"),
                    name = "Apply Cuts",
                    type = eFeatureType.Button,
                    desc = "Applies the selected cuts for players.",
                    func = function(cut1, cut2, cut3, cut4)
                        eGlobal.Heist.CayoPerico.Cut.Player1:Set(cut1)
                        eGlobal.Heist.CayoPerico.Cut.Player2:Set(cut2)
                        eGlobal.Heist.CayoPerico.Cut.Player3:Set(cut3)
                        eGlobal.Heist.CayoPerico.Cut.Player4:Set(cut4)
                    end
                }
            }
        },
        DiamondCasino = {
            Preps = {
                Difficulty = {
                    hash = Utils.Joaat("SN_DiamondCasino_Difficulty"),
                    name = "Difficulty",
                    type = eFeatureType.Combo,
                    desc = "Select the desired difficulty.",
                    list = eTable.Heist.DiamondCasino.Difficulties
                },
                Approach = {
                    hash = Utils.Joaat("SN_DiamondCasino_Approach"),
                    name = "Approach",
                    type = eFeatureType.Combo,
                    desc = "Select the desired approach.",
                    list = eTable.Heist.DiamondCasino.Approaches
                },
                Gunman = {
                    hash = Utils.Joaat("SN_DiamondCasino_Gunman"),
                    name = "Gunman",
                    type = eFeatureType.Combo,
                    desc = "Select the desired gunman.",
                    list = eTable.Heist.DiamondCasino.Gunmans
                },
                Loadout = {
                    hash = Utils.Joaat("SN_DiamondCasino_Loadout"),
                    name = "Loadout",
                    type = eFeatureType.Combo,
                    desc = "Select the desired loadout.",
                    list = eTable.Heist.DiamondCasino.Loadouts
                },
                Driver = {
                    hash = Utils.Joaat("SN_DiamondCasino_Driver"),
                    name = "Driver",
                    type = eFeatureType.Combo,
                    desc = "Select the desired driver.",
                    list = eTable.Heist.DiamondCasino.Drivers
                },
                Vehicles = {
                    hash = Utils.Joaat("SN_DiamondCasino_Vehicles"),
                    name = "Vehicles",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicles.",
                    list = eTable.Heist.DiamondCasino.Vehicles
                },
                Hacker = {
                    hash = Utils.Joaat("SN_DiamondCasino_Hacker"),
                    name = "Hacker",
                    type = eFeatureType.Combo,
                    desc = "Select the desired hacker.",
                    list = eTable.Heist.DiamondCasino.Hackers
                },
                Masks = {
                    hash = Utils.Joaat("SN_DiamondCasino_Masks"),
                    name = "Masks",
                    type = eFeatureType.Combo,
                    desc = "Select the desired masks.",
                    list = eTable.Heist.DiamondCasino.Masks
                },
                Target = {
                    hash = Utils.Joaat("SN_DiamondCasino_Target"),
                    name = "Target",
                    type = eFeatureType.Combo,
                    desc = "Select the desired target.",
                    list = eTable.Heist.DiamondCasino.Targets
                },
                Complete = {
                    hash = Utils.Joaat("SN_DiamondCasino_Complete"),
                    name = "Apply & Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Applies all changes and completes all preparations. Also, redraws the planning board.",
                    func = function(difficulty, approach, gunman, loadout, driver, vehicles, hacker, masks, target)
                        local function SetApproach(lastApproach, hardApproach, normalApproach)
                            eStat.MPX_H3_LAST_APPROACH:Set(lastApproach)
                            eStat.MPX_H3_HARD_APPROACH:Set(hardApproach)
                            eStat.MPX_H3_APPROACH:Set(normalApproach)
                            eStat.MPX_H3OPT_APPROACH:Set(approach)
                        end
                        local normalApproaches = {
                            [1] = { 3, 2, 1 },
                            [2] = { 3, 1, 2 },
                            [3] = { 1, 2, 3 }
                        }                
                        local hardApproaches = {
                            [1] = { 2, 1, 3 },
                            [2] = { 1, 2, 3 },
                            [3] = { 2, 3, 1 }
                        }
                        if difficulty == 0 then
                            SetApproach(table.unpack(normalApproaches[approach]))
                        else
                            SetApproach(table.unpack(hardApproaches[approach]))
                        end
                        eStat.MPX_H3OPT_CREWWEAP:Set(gunman)
                        eStat.MPX_H3OPT_WEAPS:Set(loadout)
                        eStat.MPX_H3OPT_CREWDRIVER:Set(driver)
                        eStat.MPX_H3OPT_VEHS:Set(vehicles)
                        eStat.MPX_H3OPT_CREWHACKER:Set(hacker)
                        eStat.MPX_H3OPT_MASKS:Set(masks)
                        eStat.MPX_H3OPT_TARGET:Set(target)
                        eLocal.Heist.DiamondCasino.Reload:Set(2)
                    end
                },
                Reload = {
                    hash = Utils.Joaat("SN_DiamondCasino_Reload"),
                    name = "Redraw Board",
                    type = eFeatureType.Button,
                    desc = "Redraws the planning board.",
                    func = function()
                        eLocal.Heist.DiamondCasino.Reload:Set(2)
                    end
                }
            },
            Misc = {
                Cooldown = {
                    hash = Utils.Joaat("SN_DiamondCasino_Cooldown"),
                    name = "Kill Cooldown",
                    type = eFeatureType.Button,
                    desc = "Skips the heist's cooldown.",
                    func = function()
                        eStat.MPX_H3_COMPLETEDPOSIX:Set(-1)
                        eStat.MPPLY_H3_COOLDOWN:Set(-1)
                    end
                },
                FingerprintHack = {
                    hash = Utils.Joaat("SN_DiamondCasino_FingerprintHack"),
                    name = "Bypass Fingerprint Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the fingerprint hacking process.",
                    func = function()
                        eLocal.Heist.DiamondCasino.Bypass.FingerprintHack:Set(5)
                    end
                },
                KeypadHack = {
                    hash = Utils.Joaat("SN_DiamondCasino_KeypadHack"),
                    name = "Bypass Keypad Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the keypad hacking process.",
                    func = function()
                        eLocal.Heist.DiamondCasino.Bypass.KeypadHack:Set(5)
                    end
                },
                VaultDoorDrill = {
                    hash = Utils.Joaat("SN_DiamondCasino_VaultDoorDrill"),
                    name = "Bypass Vault Door Drill",
                    type = eFeatureType.Button,
                    desc = "Skips the vault door drilling process.",
                    func = function()
                        eLocal.Heist.DiamondCasino.Bypass.VaultDrill1:Set(eLocal.Heist.DiamondCasino.Bypass.VaultDrill2:Get())
                    end
                },
                Autograbber = {
                    hash = Utils.Joaat("SN_DiamondCasino_Autograbber"),
                    name = "Autograbber",
                    type = eFeatureType.Toggle,
                    desc = "Grabs cash/gold/diamonds automatically. Might be slower than manually.",
                    func = function()
                        if eLocal.Heist.DiamondCasino.Autograbber.Grab:Get() == 3 then
                            eLocal.Heist.DiamondCasino.Autograbber.Grab:Set(4)
                        elseif eLocal.Heist.DiamondCasino.Autograbber.Grab:Get() == 4 then
                            eLocal.Heist.DiamondCasino.Autograbber.Speed:Set(2)
                        end
                    end
                },
                Unlock = {
                    hash = Utils.Joaat("SN_DiamondCasino_Unlock"),
                    name = "Unlock All POI",
                    type = eFeatureType.Button,
                    desc = "Unlocks all points of interest.",
                    func = function()
                        eStat.MPX_H3OPT_POI:Set(-1)
                        eStat.MPX_H3OPT_ACCESSPOINTS:Set(-1)
                        eStat.MPX_CAS_HEIST_NOTS:Set(-1)
                        eStat.MPX_CAS_HEIST_FLOW:Set(-1)
                    end
                }
            },
            Cuts = {
                Team = {
                    hash = Utils.Joaat("SN_DiamondCasino_Team"),
                    name = "Team",
                    type = eFeatureType.Combo,
                    desc = "Select your number of players.",
                    list = eTable.Heist.Generic.Team
                },
                Presets = {
                    hash = Utils.Joaat("SN_DiamondCasino_Presets"),
                    name = "Presets",
                    type = eFeatureType.Combo,
                    desc = "Select one of the ready-made presets.",
                    list = eTable.Heist.Generic.Presets
                },
                Player1 = {
                    hash = Utils.Joaat("SN_DiamondCasino_Player1"),
                    name = "Player 1",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 1."
                },
                Player2 = {
                    hash = Utils.Joaat("SN_DiamondCasino_Player2"),
                    name = "Player 2",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 2."
                },
                Player3 = {
                    hash = Utils.Joaat("SN_DiamondCasino_Player3"),
                    name = "Player 3",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 3."
                },
                Player4 = {
                    hash = Utils.Joaat("SN_DiamondCasino_Player4"),
                    name = "Player 4",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 4."
                },
                Apply = {
                    hash = Utils.Joaat("SN_DiamondCasino_Apply"),
                    name = "Apply Cuts",
                    type = eFeatureType.Button,
                    desc = "Applies the selected cuts for players.",
                    func = function(cut1, cut2, cut3, cut4)
                        eGlobal.Heist.DiamondCasino.Cut.Player1:Set(cut1)
                        eGlobal.Heist.DiamondCasino.Cut.Player2:Set(cut2)
                        eGlobal.Heist.DiamondCasino.Cut.Player3:Set(cut3)
                        eGlobal.Heist.DiamondCasino.Cut.Player4:Set(cut4)
                    end
                }
            }
        },
        Doomsday = {
            Preps = {
                Act = {
                    hash = Utils.Joaat("SN_Doomsday_Act"),
                    name = "Act",
                    type = eFeatureType.Combo,
                    desc = "Select the desired doomsday act.",
                    list = eTable.Heist.Doomsday.Acts
                },
                Complete = {
                    hash = Utils.Joaat("SN_Doomsday_Complete"),
                    name = "Apply & Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Applies all changes and completes all preparations. Also, reloads the planning screen.",
                    func = function(act)
                        local acts = {
                            [1] = { 503, 229383   },
                            [2] = { 240, 229378   },
                            [3] = { 16368, 229380 },
                        }
                        eStat.MPX_GANGOPS_FLOW_MISSION_PROG:Set(acts[act][1])
                        eStat.MPX_GANGOPS_HEIST_STATUS:Set(acts[act][2])
                        eStat.MPX_GANGOPS_FLOW_NOTIFICATIONS:Set(1557)
                        eLocal.Heist.Doomsday.Reload:Set(6)
                    end
                },
                Reset = {
                    hash = Utils.Joaat("SN_Doomsday_Reset"),
                    name = "Reset Preps",
                    type = eFeatureType.Button,
                    desc = "Resets all preparations. Also, reloads the planning screen.",
                    func = function()
                        eStat.MPX_GANGOPS_FLOW_MISSION_PROG:Set(503)
                        eStat.MPX_GANGOPS_HEIST_STATUS:Set(0)
                        eStat.MPX_GANGOPS_FLOW_NOTIFICATIONS:Set(1557)
                        eLocal.Heist.Doomsday.Reload:Set(6)
                    end
                },
                Reload = {
                    hash = Utils.Joaat("SN_Doomsday_Reload"),
                    name = "Reload Screen",
                    type = eFeatureType.Button,
                    desc = "Reloads the planning screen.",
                    func = function()
                        eLocal.Heist.Doomsday.Reload:Set(6)
                    end
                }
            },
            Misc = {
                Finish = {
                    hash = Utils.Joaat("SN_Doomsday_Finish"),
                    name = "Instant Finish",
                    type = eFeatureType.Button,
                    desc = "Finishes the heist instantly. Use after the heist has started.",
                    func = function()
                        eLocal.Heist.Doomsday.Finish1:Set(12)
                        eLocal.Heist.Doomsday.Finish2:Set(150)
                        eLocal.Heist.Doomsday.Finish3:Set(99999)
                        eLocal.Heist.Doomsday.Finish4:Set(99999)
                        eLocal.Heist.Doomsday.Finish5:Set(80)
                    end
                },
                DataHack = {
                    hash = Utils.Joaat("SN_Doomsday_DataHack"),
                    name = "Bypass Data Breaches Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the hacking process of The Data Breaches.",
                    func = function()
                        eLocal.Heist.Doomsday.Bypass.DataHack:Set(2)
                    end
                },
                DoomsdayHack = {
                    hash = Utils.Joaat("SN_Doomsday_DoomsdayHack"),
                    name = "Bypass Doomsday Scen. Hack",
                    type = eFeatureType.Button,
                    desc = "Skips the hacking process of The Doomsday Scenario.",
                    func = function()
                        eLocal.Heist.Doomsday.Bypass.DoomsdayHack:Set(3)
                    end
                }
            },
            Cuts = {
                Team = {
                    hash = Utils.Joaat("SN_Doomsday_Team"),
                    name = "Team",
                    type = eFeatureType.Combo,
                    desc = "Select your number of players.",
                    list = eTable.Heist.Generic.Team
                },
                Presets = {
                    hash = Utils.Joaat("SN_Doomsday_Presets"),
                    name = "Presets",
                    type = eFeatureType.Combo,
                    desc = "Select one of the ready-made presets.",
                    list = eTable.Heist.Generic.Presets
                },
                Player1 = {
                    hash = Utils.Joaat("SN_DoomsdayDoomsday_Player1"),
                    name = "Player 1",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 1."
                },
                Player2 = {
                    hash = Utils.Joaat("SN_Doomsday_Player2"),
                    name = "Player 2",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 2."
                },
                Player3 = {
                    hash = Utils.Joaat("SN_Doomsday_Player3"),
                    name = "Player 3",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 3."
                },
                Player4 = {
                    hash = Utils.Joaat("SN_Doomsday_Player4"),
                    name = "Player 4",
                    type = eFeatureType.InputInt,
                    desc = "Select the cut for Player 4."
                },
                Apply = {
                    hash = Utils.Joaat("SN_Doomsday_Apply"),
                    name = "Apply Cuts",
                    type = eFeatureType.Button,
                    desc = "Applies the selected cuts for players.",
                    func = function(cut1, cut2, cut3, cut4)
                        eGlobal.Heist.Doomsday.Cut.Player1:Set(cut1)
                        eGlobal.Heist.Doomsday.Cut.Player2:Set(cut2)
                        eGlobal.Heist.Doomsday.Cut.Player3:Set(cut3)
                        eGlobal.Heist.Doomsday.Cut.Player4:Set(cut4)
                    end
                }
            }
        },
        SalvageYard = {
            Slot1 = {
                Robbery = {
                    hash = Utils.Joaat("SN_SalvageYard_RobberySlot1"),
                    name = "Robbery",
                    type = eFeatureType.Combo,
                    desc = "Select the desired robbery type for slot 1.",
                    list = eTable.Heist.SalvageYard.Robberies
                },
                Vehicle = {
                    hash = Utils.Joaat("SN_SalvageYard_VehicleSlot1"),
                    name = "Vehicle",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicle type for slot 1.",
                    list = eTable.Heist.SalvageYard.Vehicles
                },
                Modification = {
                    hash = Utils.Joaat("SN_SalvageYard_ModificationSlot1"),
                    name = "Modification",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicle modification for slot 1.",
                    list = eTable.Heist.SalvageYard.Modifications
                },
                Keep = {
                    hash = Utils.Joaat("SN_SalvageYard_KeepSlot1"),
                    name = "Status",
                    type = eFeatureType.Combo,
                    desc = "Select whether you can keep the vehicle for slot 1.",
                    list = eTable.Heist.SalvageYard.Keeps
                },
                Apply = {
                    hash = Utils.Joaat("SN_SalvageYard_ApplySlot1"),
                    name = "Apply Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes for the slot 1. Also, reloads the planning screen. Use before you start the preparation.",
                    func = function(robbery, vehicle, modification, keep)
                        eGlobal.Heist.SalvageYard.Robbery.Slot1.Type:Set(robbery)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot1.Type:Set(vehicle + modification * 100)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot1.CanKeep:Set(keep)
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                }
            },
            Slot2 = {
                Robbery = {
                    hash = Utils.Joaat("SN_SalvageYard_RobberySlot2"),
                    name = "Robbery",
                    type = eFeatureType.Combo,
                    desc = "Select the desired robbery type for slot 2.",
                    list = eTable.Heist.SalvageYard.Robberies
                },
                Vehicle = {
                    hash = Utils.Joaat("SN_SalvageYard_VehicleSlot2"),
                    name = "Vehicle",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicle type for slot 2.",
                    list = eTable.Heist.SalvageYard.Vehicles
                },
                Modification = {
                    hash = Utils.Joaat("SN_SalvageYard_ModificationSlot2"),
                    name = "Modification",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicle modification for slot 2.",
                    list = eTable.Heist.SalvageYard.Modifications
                },
                Keep = {
                    hash = Utils.Joaat("SN_SalvageYard_KeepSlot2"),
                    name = "Status",
                    type = eFeatureType.Combo,
                    desc = "Select whether you can keep the vehicle for slot 2.",
                    list = eTable.Heist.SalvageYard.Keeps
                },
                Apply = {
                    hash = Utils.Joaat("SN_SalvageYard_ApplySlot2"),
                    name = "Apply Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes for the slot 2. Also, reloads the planning screen. Use before you start the preparation.",
                    func = function(robbery, vehicle, modification, keep)
                        eGlobal.Heist.SalvageYard.Robbery.Slot2.Type:Set(robbery)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot2.Type:Set(vehicle + modification * 100)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot2.CanKeep:Set(keep)
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                }
            },
            Slot3 = {
                Robbery = {
                    hash = Utils.Joaat("SN_SalvageYard_RobberySlot3"),
                    name = "Robbery",
                    type = eFeatureType.Combo,
                    desc = "Select the desired robbery type for slot 3.",
                    list = eTable.Heist.SalvageYard.Robberies
                },
                Vehicle = {
                    hash = Utils.Joaat("SN_SalvageYard_VehicleSlot3"),
                    name = "Vehicle",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicle type for slot 3.",
                    list = eTable.Heist.SalvageYard.Vehicles
                },
                Modification = {
                    hash = Utils.Joaat("SN_SalvageYard_ModificationSlot3"),
                    name = "Modification",
                    type = eFeatureType.Combo,
                    desc = "Select the desired vehicle modification for slot 3.",
                    list = eTable.Heist.SalvageYard.Modifications
                },
                Keep = {
                    hash = Utils.Joaat("SN_SalvageYard_KeepSlot3"),
                    name = "Status",
                    type = eFeatureType.Combo,
                    desc = "Select whether you can keep the vehicle for slot 3.",
                    list = eTable.Heist.SalvageYard.Keeps
                },
                Apply = {
                    hash = Utils.Joaat("SN_SalvageYard_ApplySlot3"),
                    name = "Apply Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes for the slot 3. Also, reloads the planning screen. Use before you start the preparation.",
                    func = function(robbery, vehicle, modification, keep)
                        eGlobal.Heist.SalvageYard.Robbery.Slot3.Type:Set(robbery)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot3.Type:Set(vehicle + modification * 100)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot3.CanKeep:Set(keep)
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                }
            },
            Preps = {
                Apply = {
                    hash = Utils.Joaat("SN_SalvageYard_ApplyAll"),
                    name = "Apply All Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes. Also, reloads the planning screen.",
                    func = function(robbery1, vehicle1, modification1, keep1, robbery2, vehicle2, modification2, keep2, robbery3, vehicle3, modification3, keep3)
                        eGlobal.Heist.SalvageYard.Robbery.Slot1.Type:Set(robbery1)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot1.Type:Set(vehicle1 + modification1 * 100)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot1.CanKeep:Set(keep1)
                        eGlobal.Heist.SalvageYard.Robbery.Slot2.Type:Set(robbery2)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot2.Type:Set(vehicle2 + modification2 * 100)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot2.CanKeep:Set(keep2)
                        eGlobal.Heist.SalvageYard.Robbery.Slot3.Type:Set(robbery3)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot3.Type:Set(vehicle3 + modification3 * 100)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot3.CanKeep:Set(keep3)
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                },
                Complete = {
                    hash = Utils.Joaat("SN_SalvageYard_Complete"),
                    name = "Complete Preps",
                    type = eFeatureType.Button,
                    desc = "Completes all preparations.",
                    func = function()
                        eStat.MPX_SALV23_GEN_BS:Set(-1)
                        eStat.MPX_SALV23_SCOPE_BS:Set(-1)
                        eStat.MPX_SALV23_FM_PROG:Set(-1)
                        eStat.MPX_SALV23_INST_PROG:Set(-1)
                    end
                }, 
                Reset = {
                    hash = Utils.Joaat("SN_SalvageYard_Reset"),
                    name = "Reset Preps",
                    type = eFeatureType.Button,
                    desc = "Resets all preparations.",
                    func = function()
                        eStat.MPX_SALV23_GEN_BS:Set(0)
                        eStat.MPX_SALV23_SCOPE_BS:Set(0)
                        eStat.MPX_SALV23_FM_PROG:Set(0)
                        eStat.MPX_SALV23_INST_PROG:Set(0)
                    end
                },
                Reload = {
                    hash = Utils.Joaat("SN_SalvageYard_Reload"),
                    name = "Reload Screen",
                    type = eFeatureType.Button,
                    desc = "Reloads the planning screen.",
                    func = function()
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                }
            },
            Misc = {
                Cooldown = {
                    Kill = {
                        hash = Utils.Joaat("SN_SalvageYard_Cooldown"),
                        name = "Kill Cooldowns",
                        type = eFeatureType.Button,
                        desc = "Skips the heist's cooldowns.",
                        func = function()
                            eTunable.Heist.SalvageYard.Cooldown.Robbery:Set(0)
                            eTunable.Heist.SalvageYard.Cooldown.Cfr:Set(0)
                        end
                    },
                    Skip = {
                        hash = Utils.Joaat("SN_SalvageYard_Weekly"),
                        name = "Skip Weekly Cooldown",
                        type = eFeatureType.Button,
                        desc = "Skips the heist's weekly cooldown. Also, reloads the planning screen.",
                        func = function()
                            eTunable.Heist.SalvageYard.Cooldown.Weekly:Set(eStat.MPX_SALV23_WEEK_SYNC:Get() + 1)
                            eLocal.Heist.SalvageYard.Reload:Set(2)
                        end
                    }
                },
                Availability = {
                    Slot1 = {
                        hash = Utils.Joaat("SN_SalvageYard_AvailableSlot1"),
                        name = "Make Slot 1 Available",
                        type = eFeatureType.Button,
                        desc = "Makes the slot 1 «Available».",
                        func = function()
                            eStat.MPX_SALV23_VEHROB_STATUS0:Set(0)
                        end
                    },
                    Slot2 = {
                        hash = Utils.Joaat("SN_SalvageYard_AvailableSlot2"),
                        name = "Make Slot 2 Available",
                        type = eFeatureType.Button,
                        desc = "Makes the slot 2 «Available».",
                        func = function()
                            eStat.MPX_SALV23_VEHROB_STATUS1:Set(0)
                        end
                    },
                    Slot3 = {
                        hash = Utils.Joaat("SN_SalvageYard_AvailableSlot3"),
                        name = "Make Slot 3 Available",
                        type = eFeatureType.Button,
                        desc = "Makes the slot 3 «Available».",
                        func = function()
                            eStat.MPX_SALV23_VEHROB_STATUS2:Set(0)
                        end
                    }
                },
                Free = {
                    Setup = {
                        hash = Utils.Joaat("SN_SalvageYard_Setup"),
                        name = "Free Setup",
                        type = eFeatureType.Toggle,
                        desc = "Allows setuping the heist for free.",
                        func = function(bool)
                            eTunable.Heist.SalvageYard.Robbery.SetupPrice:Set((bool) and 0 or 20000)
                        end
                    },
                    Claim = {
                        hash = Utils.Joaat("SN_SalvageYard_Claim"),
                        name = "Free Claim",
                        type = eFeatureType.Toggle,
                        desc = "Allows claiming the vehicles for free.",
                        func = function(bool)
                            eTunable.Heist.SalvageYard.Vehicle.ClaimPrice.Standard:Set((bool) and 0 or 20000)
                            eTunable.Heist.SalvageYard.Vehicle.ClaimPrice.Discounted:Set((bool) and 0 or 10000)
                        end
                    }
                }
            },
            Payout = {
                Salvage = {
                    hash = Utils.Joaat("SN_SalvageYard_Salvage"),
                    name = "Salvage Value Multiplier",
                    type = eFeatureType.InputFloat,
                    desc = "Select the desired salvage value multiplier."
                },
                Slot1 = {
                    hash = Utils.Joaat("SN_SalvageYard_SelectSlot1"),
                    name = "Sell Value Slot 1",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sell value for the vehicle in slot 1."
                },
                Slot2 = {
                    hash = Utils.Joaat("SN_SalvageYard_SelectSlot2"),
                    name = "Sell Value Slot 2",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sell value for the vehicle in slot 2."
                },
                Slot3 = {
                    hash = Utils.Joaat("SN_SalvageYard_SelectSlot3"),
                    name = "Sell Value Slot 3",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sell value for the vehicle in slot 3."
                },
                Apply = {
                    hash = Utils.Joaat("SN_SalvageYard_Apply"),
                    name = "Apply Sell Values",
                    type = eFeatureType.Button,
                    desc = "Applies the selected sell values for the vehicles. Also, reloads the planning screen. Use before you start the preparation.",
                    func = function(salvageMultiplier, sellValue1, sellValue2, sellValue3)
                        eGlobal.Heist.SalvageYard.Vehicle.SalvageValueMultiplier:Set(salvageMultiplier)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot1.Value:Set(sellValue1)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot2.Value:Set(sellValue2)
                        eGlobal.Heist.SalvageYard.Vehicle.Slot3.Value:Set(sellValue3)
                        eLocal.Heist.SalvageYard.Reload:Set(2)
                    end
                }
            }
        }
    },
    Money = {
        Bunker = {
            Sale = {
                Price = {
                    hash = Utils.Joaat("SN_Bunker_Price"),
                    name = "Maximize Price",
                    type = eFeatureType.Button,
                    desc = "Applies the maximum price for your stock.",
                    func = function(price)
                        eTunable.Business.Bunker.Price:Set(math.floor(2300000 / eStat.MPX_PRODTOTALFORFACTORY5:Get()))
                        eTunable.Business.Bunker.Multiplier.ProductLocal:Set(1.0)
                        eTunable.Business.Bunker.Multiplier.ProductFar:Set(1.0)
                    end
                },
                Reset = {
                    hash = Utils.Joaat("SN_Bunker_Reset"),
                    name = "Reset Price",
                    type = eFeatureType.Button,
                    desc = "Resets the price for your stock.",
                    func = function()
                        eTunable.Business.Bunker.Price:Reset()
                        eTunable.Business.Bunker.Multiplier.ProductLocal:Reset()
                        eTunable.Business.Bunker.Multiplier.ProductFar:Reset()
                    end
                },
                Sell = {
                    hash = Utils.Joaat("SN_Bunker_Sell"),
                    name = "Instant Sell",
                    type = eFeatureType.Button,
                    desc = "Finishes the sell mission instantly. Use after the mission has started.",
                    func = function()
                        eLocal.Business.Bunker.Sell.Finish:Set(0)
                    end
                }
            },
            Misc = {
                Open = {
                    hash = Utils.Joaat("SN_Bunker_Open"),
                    name = "Open Laptop",
                    type = eFeatureType.Button,
                    desc = "Opens the bunker's laptop screen.",
                    func = function()
                        StartScript(eScript.Business.Bunker.name, eScript.Business.Bunker.stack)
                    end
                },
                Supply = {
                    hash = Utils.Joaat("SN_Bunker_Supply"),
                    name = "Get Supplies",
                    type = eFeatureType.Button,
                    desc = "Gets supplies for your bunker.",
                    func = function()
                        eGlobal.Business.Supplies.Bunker:Set(1)
                    end
                },
                Trigger = {
                    hash = Utils.Joaat("SN_Bunker_Trigger"),
                    name = "Trigger Production",
                    type = eFeatureType.Button,
                    desc = "Triggers production of your stock.",
                    func = function()
                        eGlobal.Business.Bunker.Production.Trigger1:Set(0)
                        eGlobal.Business.Bunker.Production.Trigger2:Set(true)
                    end
                },
                Supplier = {
                    hash = Utils.Joaat("SN_Bunker_Supplier"),
                    name = "Turkish Supplier",
                    type = eFeatureType.Toggle,
                    desc = "Fills your bunker stock. Also, gets supplies for your bunker repeatedly.",
                    func = function()
                        eGlobal.Business.Supplies.Bunker:Set(1)
                        eGlobal.Business.Bunker.Production.Trigger1:Set(0)
                        eGlobal.Business.Bunker.Production.Trigger2:Set(true)
                    end
                }
            },
            Stats = {
                Made = {
                    hash = Utils.Joaat("SN_Bunker_Made"),
                    name = "Sell Made",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales made."
                },
                Undertaken = {
                    hash = Utils.Joaat("SN_Bunker_Undertaken"),
                    name = "Sell Undertaken",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales undertaken."
                },
                Earnings = {
                    hash = Utils.Joaat("SN_Bunker_Earnings"),
                    name = "Earnings",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired earnings."
                },
                NoSell = {
                    hash = Utils.Joaat("SN_Bunker_NoSell"),
                    name = "Don't Apply Sell",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new sell missions or not."
                },
                NoEarnings = {
                    hash = Utils.Joaat("SN_Bunker_NoEarnings"),
                    name = "Don't Apply Earnings",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new earnings or not."
                },
                Apply = {
                    hash = Utils.Joaat("SN_Bunker_Apply"),
                    name = "Apply All Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes.",
                    func = function(bool1, bool2, sellMade, sellUndertaken, earnings)
                        if not bool1 then
                            eStat.MPX_LIFETIME_BKR_SEL_COMPLETBC5:Set(sellMade)
                            eStat.MPX_LIFETIME_BKR_SEL_UNDERTABC5:Set(sellUndertaken)
                            eStat.MPX_BUNKER_UNITS_MANUFAC:Set(sellMade * 100)
                        end
                        if not bool2 then
                            eStat.MPX_LIFETIME_BKR_SELL_EARNINGS5:Set(earnings)
                        end
                    end
                }
            }
        },
        Casino = {
            LuckyWheel = {
                Select = {
                    hash = Utils.Joaat("SN_Casino_LuckyWheelSelect"),
                    name = "Prize",
                    type = eFeatureType.Combo,
                    desc = "Select the desired prize.",
                    list = eTable.World.Casino.Prizes
                },
                Give = {
                    hash = Utils.Joaat("SN_Casino_LuckyWheelGive"),
                    name = "Give Prize",
                    type = eFeatureType.Button,
                    desc = "Gives the selected prize instantly. Use once per day.",
                    func = function(prize)
                        eLocal.World.Casino.LuckyWheel.WinState:Set(prize)
                        eLocal.World.Casino.LuckyWheel.PrizeState:Set(11)
                    end
                }
            },
            Slots = {
                Win = {
                    hash = Utils.Joaat("SN_Casino_SlotsWin"),
                    name = "Rig Slots",
                    type = eFeatureType.Button,
                    desc = "Forces the slots to give you the jackpot. Might be unsafe.",
                    func = function()
                        local randomResultTable = eLocal.World.Casino.Slots.RandomResultTable.vLocal
                        for i = 3, 196 do
                            if i ~= 67 and i ~= 132 then
                                ScriptLocal.SetInt(eScript.World.Casino.Slots.hash, randomResultTable + i, 6)
                            end
                        end
                    end
                },
                Lose = {
                    hash = Utils.Joaat("SN_Casino_SlotsLoose"),
                    name = "Lose Slots",
                    type = eFeatureType.Button,
                    desc = "Forces the slots to always lose.",
                    func = function()
                        local randomResultTable = eLocal.World.Casino.Slots.RandomResultTable.vLocal
                        for i = 3, 196 do
                            if i ~= 67 and i ~= 132 then
                                ScriptLocal.SetInt(eScript.World.Casino.Slots.hash, randomResultTable + i, 0)
                            end
                        end
                    end
                }
            },
            Roulette = {
                Land13 = {
                    hash = Utils.Joaat("SN_Casino_RouletteLand13"),
                    name = "Land On Black 13",
                    type = eFeatureType.Button,
                    desc = "Forces the ball to land on black 13. Use after the betting is finished.",
                    func = function()
                        local masterTable   = eLocal.World.Casino.Roulette.MasterTable.vLocal
                        local outcomesTable = eLocal.World.Casino.Roulette.OutcomesTable.vLocal
                        local ballTable     = eLocal.World.Casino.Roulette.BallTable.vLocal
                        for i = 0, 5 do
                            ScriptLocal.SetInt(eScript.World.Casino.Roulette.hash, masterTable + outcomesTable + ballTable + i, 13)
                        end
                    end
                },
                Land16 = {
                    hash = Utils.Joaat("SN_Casino_RouletteLand16"),
                    name = "Land On Red 16",
                    type = eFeatureType.Button,
                    desc = "Forces the ball to land on red 16. Use after the betting is finished.",
                    func = function()
                        local masterTable   = eLocal.World.Casino.Roulette.MasterTable.vLocal
                        local outcomesTable = eLocal.World.Casino.Roulette.OutcomesTable.vLocal
                        local ballTable     = eLocal.World.Casino.Roulette.BallTable.vLocal
                        for i = 0, 5 do
                            ScriptLocal.SetInt(eScript.World.Casino.Roulette.hash, masterTable + outcomesTable + ballTable + i, 16)
                        end
                    end
                }
            },
            Blackjack = {
                Card = {
                    hash = Utils.Joaat("SN_Casino_BlackjackCard"),
                    name = "Dealer's Face Down Card",
                    type = eFeatureType.InputText,
                    desc = "Shows the dealer's face down card."
                },
                Reveal = {
                    hash = Utils.Joaat("SN_Casino_BlackjackReveal"),
                    name = "Reveal Card",
                    type = eFeatureType.Button,
                    desc = "Reveals the dealer's face down card.",
                    func = function()
                        if IsScriptRunning(eScript.World.Casino.Blackjack.name) then
                            if eLocal.World.Casino.Blackjack.CurrentTable:Get() ~= -1 then
                                dealersCard = eLocal.World.Casino.Blackjack.Dealer.FirstCard:Get()
                                FeatureMgr.GetFeature(casinoBlackjackCard.hash):SetStringValue(GetCardName(dealersCard))
                            else
                                FeatureMgr.GetFeature(casinoBlackjackCard.hash):SetStringValue("Not at a table!")
                            end
                        else
                            FeatureMgr.GetFeature(casinoBlackjackCard.hash):SetStringValue("Not in Casino!")
                        end
                    end
                },
                Trick = {
                    hash = Utils.Joaat("SN_Casino_BlackjackTrick"),
                    name = "Trick The Dealer",
                    type = eFeatureType.Button,
                    desc = "Forces the dealer's hand to lose. Also, reveals the dealer's cards.",
                    func = function()
                        if eLocal.World.Casino.Blackjack.CurrentTable:Get() ~= -1 then
                            eLocal.World.Casino.Blackjack.Dealer.FirstCard:Set(11)
                            eLocal.World.Casino.Blackjack.Dealer.SecondCard:Set(12)
                            eLocal.World.Casino.Blackjack.Dealer.ThirdCard:Set(13)
                            eLocal.World.Casino.Blackjack.VisibleCards:Set(3)
                        end
                    end
                }
            },
            Poker = {
                MyCards = {
                    hash = Utils.Joaat("SN_Casino_PokerMyCards"),
                    name = "Your Cards",
                    type = eFeatureType.InputText,
                    desc = "Shows your cards."
                },
                Cards = {
                    hash = Utils.Joaat("SN_Casino_PokerCards"),
                    name = "Dealer's Cards",
                    type = eFeatureType.InputText,
                    desc = "Shows the dealer's cards."
                },
                Reveal = {
                    hash = Utils.Joaat("SN_Casino_PokerReveal"),
                    name = "Reveal Cards",
                    type = eFeatureType.Button,
                    desc = "Reveals your and the dealer's cards.",
                    func = function()
                        if IsScriptRunning(eScript.World.Casino.Poker.name) then
                            if eLocal.World.Casino.Poker.CurrentTable:Get() ~= -1 then
                                myCards      = GetPokerCards(PLAYER_ID)
                                dealersCards = GetPokerCards(GetPokerPlayersCount() + 1)
                                FeatureMgr.GetFeature(casinoPokerMyCards.hash):SetStringValue(myCards)
                                FeatureMgr.GetFeature(casinoPokerCards.hash):SetStringValue(dealersCards)
                            else
                                FeatureMgr.GetFeature(casinoPokerMyCards.hash):SetStringValue("Not at a table!")
                                FeatureMgr.GetFeature(casinoPokerCards.hash):SetStringValue("Not at a table!")
                            end
                        else
                            FeatureMgr.GetFeature(casinoPokerMyCards.hash):SetStringValue("Not in Casino!")
                            FeatureMgr.GetFeature(casinoPokerCards.hash):SetStringValue("Not in Casino!")
                        end
                    end
                },
                Give = {
                    hash = Utils.Joaat("SN_Casino_PokerGive"),
                    name = "Give Straight Flush",
                    type = eFeatureType.Button,
                    desc = "Forces your hand to win. Also, reveals your and the dealer's cards.",
                    func = function()
                        local id = 0
                        SetPokerCards(id, 50, 51, 52)
                    end
                },
                GiveAll = {
                    hash = Utils.Joaat("SN_Casino_PokerGiveAll"),
                    name = "Give All Straight Flush",
                    type = eFeatureType.Button,
                    desc = "Forces all hands at the current table (except dealer's) to win. Also, reveals your and the dealer's cards.",
                    func = function()
                        if eLocal.World.Casino.Poker.CurrentTable:Get() ~= -1 then
                            for i = 0, GetPokerPlayersCount() do
                                SetPokerCards(i, 50, 51, 52)
                            end
                        end
                    end
                },
                Trick = {
                    hash = Utils.Joaat("SN_Casino_PokerTrick"),
                    name = "Trick The Dealer",
                    type = eFeatureType.Button,
                    desc = "Forces the dealer's hand to lose. Also, reveals your and the dealer's cards.",
                    func = function()
                        if eLocal.World.Casino.Poker.CurrentTable:Get() ~= -1 then
                            local id = GetPokerPlayersCount() + 1
                            SetPokerCards(id, 2, 17, 32)
                        end
                    end
                }
            },
            Misc = {
                Bypass = {
                    hash = Utils.Joaat("SN_Casino_Bypass"),
                    name = "Bypass Casino Limits",
                    type = eFeatureType.Button,
                    desc = "Bypasses the casino limits. Might be unsafe if used to earn more chips.",
                    func = function()
                        eStat.MPPLY_CASINO_CHIPS_WON_GD:Set(0)
                        eStat.MPPLY_CASINO_CHIPS_WONTIM:Set(0)
                        eStat.MPPLY_CASINO_GMBLNG_GD:Set(0)
                        eStat.MPPLY_CASINO_BAN_TIME:Set(0)
                        eStat.MPPLY_CASINO_CHIPS_PURTIM:Set(0)
                        eStat.MPPLY_CASINO_CHIPS_PUR_GD:Set(0)
                    end 
                },
                AcquireLimit = {
                    Select = {
                        hash = Utils.Joaat("SN_Casino_Select"),
                        name = "Acquire Chips Limit",
                        type = eFeatureType.InputInt,
                        desc = "Select the desired acquire chips limit."
                    },
                    Apply = {
                        hash = Utils.Joaat("SN_Casino_Apply"),
                        name = "Apply Acquire Chips Limit",
                        type = eFeatureType.Button,
                        desc = "Applies the selected acquire chips limit.",
                        func = function(limit)
                            eTunable.World.Casino.Chips.AcquireLimit:Set(limit)
                            eTunable.World.Casino.Chips.AcquireLimitPenthouse:Set(limit)
                        end
                    }
                }
            }
        },
        Hangar = {
            Sale = {
                Cargo = {
                    hash = Utils.Joaat("SN_Hangar_Cargo"),
                    name = "Cargo",
                    type = eFeatureType.Combo,
                    desc = "Select the cargo you want to edit price per crate for.",
                    list = eTable.Business.Hangar.Cargoes
                },
                Select = {
                    hash = Utils.Joaat("SN_Hangar_Select"),
                    name = "Price per Crate",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired price per crate for the selected cargo."
                },
                Apply = {
                    hash = Utils.Joaat("SN_Hangar_PriceApply"),
                    name = "Apply Price",
                    type = eFeatureType.Button,
                    desc = "Applies the price per selected crate.",
                    func = function(cargo, price)
                        local price   = eTunable.Business.Hangar.Price
                        local cargoes = { price.Animals, price.Arts, price.Chemicals, price.Counterfeit, price.Jewelry, price.Medicals, price.Narcotics, price.Tobacco }
                        cargoes[cargo]:Set(price)
                    end
                },
                Reset = {
                    hash = Utils.Joaat("SN_Hangar_Reset"),
                    name = "Reset Prices",
                    type = eFeatureType.Button,
                    desc = "Resets all the prices per crate.",
                    func = function()
                        eTunable.Business.Hangar.Price.Animals:Reset()
                        eTunable.Business.Hangar.Price.Arts:Reset()
                        eTunable.Business.Hangar.Price.Chemicals:Reset()
                        eTunable.Business.Hangar.Price.Counterfeit:Reset()
                        eTunable.Business.Hangar.Price.Jewelry:Reset()
                        eTunable.Business.Hangar.Price.Medicals:Reset()
                        eTunable.Business.Hangar.Price.Narcotics:Reset()
                        eTunable.Business.Hangar.Price.Tobacco:Reset()
                    end
                },
                Delivered = {
                    hash = Utils.Joaat("SN_Hangar_Delivered"),
                    name = "Total Delivered",
                    type = eFeatureType.InputInt,
                    desc = "Select the number of «Total Delivered»."
                },
                Sell = {
                    hash = Utils.Joaat("SN_Hangar_Sell"),
                    name = "Instant Air Cargo Sell",
                    type = eFeatureType.Button,
                    desc = "Finishes the air cargo sell mission instantly. Select total delivered value first.",
                    func = function(delivered)
                        eLocal.Business.Hangar.Sell.Delivered:Set(delivered)
                        eLocal.Business.Hangar.Sell.Finish:Set(-1)
                    end
                }
            },
            Misc = {
                Open = {
                    hash = Utils.Joaat("SN_Hangar_Open"),
                    name = "Open Laptop",
                    type = eFeatureType.Button,
                    desc = "Opens the hangar's laptop screen.",
                    func = function()
                        StartScript(eScript.Business.Hangar.name, eScript.Business.Hangar.stack)
                    end
                },
                Supply = {
                    hash = Utils.Joaat("SN_Hangar_Supply"),
                    name = "Get Cargo",
                    type = eFeatureType.Button,
                    desc = "Gets cargo for your hangar.",
                    func = function()
                        ePackedBool.Business.Hangar.Cargo:Set(true)
                    end
                },
                Supplier = {
                    hash = Utils.Joaat("SN_Hangar_Supplier"),
                    name = "Turkish Supplier",
                    type = eFeatureType.Toggle,
                    desc = "Fills your hangar stock repeatedly.",
                    func = function()
                        ePackedBool.Business.Hangar.Cargo:Set(true)
                    end
                }
            },
            Stats = {
                BuyMade = {
                    hash = Utils.Joaat("SN_Hangar_BuyMade"),
                    name = "Buy Made",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired buy made."
                },
                BuyUndertaken = {
                    hash = Utils.Joaat("SN_Hangar_BuyUndertaken"),
                    name = "Buy Undertaken",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired buy undertaken."
                },
                SellMade = {
                    hash = Utils.Joaat("SN_Hangar_SellMade"),
                    name = "Sell Made",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales made."
                },
                SellUndertaken = {
                    hash = Utils.Joaat("SN_Hangar_SellUndertaken"),
                    name = "Sell Undertaken",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales undertaken."
                },
                Earnings = {
                    hash = Utils.Joaat("SN_Hangar_Earnings"),
                    name = "Earnings",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired earnings."
                },
                NoBuy = {
                    hash = Utils.Joaat("SN_Hangar_NoBuy"),
                    name = "Don't Apply Buy",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new buy missions or not."
                },
                NoSell = {
                    hash = Utils.Joaat("SN_Hangar_NoSell"),
                    name = "Don't Apply Sell",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new sell missions or not."
                },
                NoEarnings = {
                    hash = Utils.Joaat("SN_Hangar_NoEarnings"),
                    name = "Don't Apply Earnings",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new earnings or not."
                },
                Apply = {
                    hash = Utils.Joaat("SN_Hangar_Apply"),
                    name = "Apply All Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes.",
                    func = function(bool1, bool2, bool3, buyMade, buyUndertaken, sellMade, sellUndertaken, earnings)
                        if not bool1 then
                            eStat.MPX_LFETIME_HANGAR_BUY_COMPLET:Set(buyMade)
                            eStat.MPX_LFETIME_HANGAR_BUY_UNDETAK:Set(buyUndertaken)
                        end
                        if not bool2 then
                            eStat.MPX_LFETIME_HANGAR_SEL_COMPLET:Set(sellMade)
                            eStat.MPX_LFETIME_HANGAR_SEL_UNDETAK:Set(sellUndertaken)
                        end
                        if not bool3 then
                            eStat.MPX_LFETIME_HANGAR_EARNINGS:Set(earnings)
                        end
                    end
                }
            }
        },
        Nightclub = {
            Sale = {
                Price = {
                    hash = Utils.Joaat("SN_Nightclub_Price"),
                    name = "Maximize Prices",
                    type = eFeatureType.Button,
                    desc = "Applies the maximum price for cargoes.",
                    func = function()
                        eTunable.Business.Nightclub.Price.Weapons:Set(math.floor(4000000 / eStat.MPX_HUB_PROD_TOTAL_1:Get()))
                        eTunable.Business.Nightclub.Price.Coke:Set(math.floor(4000000 / eStat.MPX_HUB_PROD_TOTAL_2:Get()))
                        eTunable.Business.Nightclub.Price.Meth:Set(math.floor(4000000 / eStat.MPX_HUB_PROD_TOTAL_3:Get()))
                        eTunable.Business.Nightclub.Price.Weed:Set(math.floor(4000000 / eStat.MPX_HUB_PROD_TOTAL_4:Get()))
                        eTunable.Business.Nightclub.Price.Documents:Set(math.floor(4000000 / eStat.MPX_HUB_PROD_TOTAL_5:Get()))
                        eTunable.Business.Nightclub.Price.Cash:Set(math.floor(4000000 / eStat.MPX_HUB_PROD_TOTAL_6:Get()))
                        eTunable.Business.Nightclub.Price.Cargo:Set(math.floor(4000000 / eStat.MPX_HUB_PROD_TOTAL_0:Get()))
                    end
                },
                Reset = {
                    hash = Utils.Joaat("SN_Nightclub_Reset"),
                    name = "Reset Prices",
                    type = eFeatureType.Button,
                    desc = "Resets all the prices for cargoes.",
                    func = function()
                        eTunable.Business.Nightclub.Price.Weapons:Reset()
                        eTunable.Business.Nightclub.Price.Coke:Reset()
                        eTunable.Business.Nightclub.Price.Meth:Reset()
                        eTunable.Business.Nightclub.Price.Weed:Reset()
                        eTunable.Business.Nightclub.Price.Documents:Reset()
                        eTunable.Business.Nightclub.Price.Cash:Reset()
                        eTunable.Business.Nightclub.Price.Cargo:Reset()
                    end
                }
            },
            Misc = {
                Open = {
                    hash = Utils.Joaat("SN_Nightclub_Open"),
                    name = "Open Computer",
                    type = eFeatureType.Button,
                    desc = "Opens the nightclub's computer screen.",
                    func = function()
                        StartScript(eScript.Business.Nightclub.name, eScript.Business.Nightclub.stack)
                    end
                },
                Cooldown = {
                    hash = Utils.Joaat("SN_Nighclub_Cooldown"),
                    name = "Kill Cooldowns",
                    type = eFeatureType.Button,
                    desc = "Skips almost all cooldowns.",
                    func = function()
                        eTunable.Business.Nightclub.Cooldown.ClubManagement:Set(0)
                        eTunable.Business.Nightclub.Cooldown.Sell:Set(0)
                        eTunable.Business.Nightclub.Cooldown.SellDelivery:Set(0)
                    end
                },
                Trigger = {
                    hash = Utils.Joaat("SN_Nightclub_Trigger"),
                    name = "(!) Trigger Production",
                    type = eFeatureType.Button,
                    desc = "Triggers production of your stock.",
                    func = function()
                        
                    end
                },
                Supplier = {
                    hash = Utils.Joaat("SN_Nightclub_Supplier"),
                    name = "(!) Turkish Supplier",
                    type = eFeatureType.Toggle,
                    desc = "Fills your nightclub stock repeatedly.",
                    func = function()
                        
                    end
                }
            },
            Stats = {
                SellMade = {
                    hash = Utils.Joaat("SN_Nightclub_SellMade"),
                    name = "Sell Made",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales made."
                },
                Earnings = {
                    hash = Utils.Joaat("SN_Nightclub_Earnings"),
                    name = "Earnings",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired earnings."
                },
                NoSell = {
                    hash = Utils.Joaat("SN_Nightclub_NoSell"),
                    name = "Don't Apply Sell",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new sell missions or not."
                },
                NoEarnings = {
                    hash = Utils.Joaat("SN_Nightclub_NoEarnings"),
                    name = "Don't Apply Earnings",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new earnings or not."
                },
                Apply = {
                    hash = Utils.Joaat("SN_Nightclub_Apply"),
                    name = "Apply All Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes.",
                    func = function(bool1, bool2, buyMade, earnings)
                        if not bool1 then
                            eStat.MPX_HUB_SALES_COMPLETED:Set(buyMade)
                        end
                        if not bool2 then
                            eStat.MPX_HUB_EARNINGS:Set(earnings)
                        end
                    end
                }
            },
            Safe = {
                Fill = {
                    hash = Utils.Joaat("SN_Nightclub_Fill"),
                    name = "(!) Fill Safe",
                    type = eFeatureType.Button,
                    desc = "Fills your Nightclub safe with money.",
                    func = function()
                        local top5     = eGlobal.Business.Nightclub.Safe.Income.Top5.global
                        local top100   = eGlobal.Business.Nightclub.Safe.Income.Top100.global
                        local maxValue = 300000
                        eTunable.Business.Nightclub.Safe.MaxCapacity:Set(maxValue)
                        for i = top5, top100 do
                            ScriptGlobal.SetInt(i, maxValue)
                        end
                        eStat.MPX_CLUB_PAY_TIME_LEFT:Set(-1)
                    end
                },
                Collect = {
                    hash = Utils.Joaat("SN_Nightclub_Collect"),
                    name = "Collect Safe",
                    type = eFeatureType.Button,
                    desc = "Collects money from your safe. Use inside the nightclub.",
                    func = function()
                        eLocal.Business.Nightclub.Safe.Collect:Set(1)
                    end
                }
            },
            Popularity = {
                Max = {
                    hash = Utils.Joaat("SN_Nightclub_Max"),
                    name = "Max Popularity",
                    type = eFeatureType.Button,
                    desc = "Makes your nightclub popular.",
                    func = function()
                        eStat.MPX_CLUB_POPULARITY:Set(1000)
                    end
                },
                Min = {
                    hash = Utils.Joaat("SN_Nightclub_Min"),
                    name = "Min Populatiry",
                    type = eFeatureType.Button,
                    desc = "Makes your nightclub unpopular.",
                    func = function()
                        eStat.MPX_CLUB_POPULARITY:Set(0)
                    end
                }
            }
        },
        CrateWarehouse = {
            Sale = {
                Select = {
                    hash = Utils.Joaat("SN_CrateWarehouse_PriceSelect"),
                    name = "Price",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired price for your crates."
                },
                Apply = {
                    hash = Utils.Joaat("SN_CrateWarehouse_PriceApply"),
                    name = "Apply Price",
                    type = eFeatureType.Button,
                    desc = "Applies the price for your crates.",
                    func = function(price)
                        eTunable.Business.CrateWarehouse.Price.Threshold1:Set(price)
                        eTunable.Business.CrateWarehouse.Price.Threshold2:Set(math.floor(price / 2))
                        eTunable.Business.CrateWarehouse.Price.Threshold3:Set(math.floor(price / 3))
                        eTunable.Business.CrateWarehouse.Price.Threshold4:Set(math.floor(price / 5))
                        eTunable.Business.CrateWarehouse.Price.Threshold5:Set(math.floor(price / 7))
                        eTunable.Business.CrateWarehouse.Price.Threshold6:Set(math.floor(price / 9))
                        eTunable.Business.CrateWarehouse.Price.Threshold7:Set(math.floor(price / 14))
                        eTunable.Business.CrateWarehouse.Price.Threshold8:Set(math.floor(price / 19))
                        eTunable.Business.CrateWarehouse.Price.Threshold9:Set(math.floor(price / 24))
                        eTunable.Business.CrateWarehouse.Price.Threshold10:Set(math.floor(price / 29))
                        eTunable.Business.CrateWarehouse.Price.Threshold11:Set(math.floor(price / 34))
                        eTunable.Business.CrateWarehouse.Price.Threshold12:Set(math.floor(price / 39))
                        eTunable.Business.CrateWarehouse.Price.Threshold13:Set(math.floor(price / 44))
                        eTunable.Business.CrateWarehouse.Price.Threshold14:Set(math.floor(price / 49))
                        eTunable.Business.CrateWarehouse.Price.Threshold15:Set(math.floor(price / 59))
                        eTunable.Business.CrateWarehouse.Price.Threshold16:Set(math.floor(price / 69))
                        eTunable.Business.CrateWarehouse.Price.Threshold17:Set(math.floor(price / 79))
                        eTunable.Business.CrateWarehouse.Price.Threshold18:Set(math.floor(price / 89))
                        eTunable.Business.CrateWarehouse.Price.Threshold19:Set(math.floor(price / 99))
                        eTunable.Business.CrateWarehouse.Price.Threshold20:Set(math.floor(price / 110))
                        eTunable.Business.CrateWarehouse.Price.Threshold21:Set(math.floor(price / 111))
                    end
                },
                Reset = {
                    hash = Utils.Joaat("SN_CrateWarehouse_Reset"),
                    name = "Reset Price",
                    type = eFeatureType.Button,
                    desc = "Resets the price for your crates.",
                    func = function()
                        for i = 1, 21 do
                            eTunable.Business.CrateWarehouse.Price["Threshold" .. i]:Reset()
                        end
                    end
                },
                NoXp = {
                    hash = Utils.Joaat("SN_CrateWarehouse_NoXp"),
                    name = "No XP Gain",
                    type = eFeatureType.Toggle,
                    desc = "Disables the xp gain for sell missions."
                },
                NoCrateback = {
                    hash = Utils.Joaat("SN_CrateWarehouse_NoCrateback"),
                    name = "No CrateBack",
                    type = eFeatureType.Toggle,
                    desc = "Disables auto refill of the crates after «Instant Sell»."
                },
                Sell = {
                    hash = Utils.Joaat("SN_CrateWarehouse_Sell"),
                    name = "Instant Sell",
                    type = eFeatureType.Button,
                    desc = "Finishes the sell mission instantly. Use after the mission has started.",
                    func = function(bool1, bool2)
                        if not bool2 then
                            if IsScriptRunning(eScript.Business.CrateWarehouse.Sell.name) then
                                ePackedBool.Business.CrateWarehouse.Cargo:Set(true)
                            end
                        end
                        eGlobal.World.Multiplier.Xp:Set((bool1) and 0.0 or 1.0)
                        eLocal.Business.CrateWarehouse.Sell.Type:Set(7)
                        eLocal.Business.CrateWarehouse.Sell.Finish:Set(99999)
                        Script.Yield(2000)
                        eLocal.Business.CrateWarehouse.Sell.Finish:Set(99999)
                    end
                }
            },
            Misc = {
                Open = {
                    hash = Utils.Joaat("SN_CrateWarehouse_Open"),
                    name = "Open Laptop",
                    type = eFeatureType.Button,
                    desc = "Opens the laptop's screen.",
                    func = function()
                        if not IsScriptRunning(eScript.Business.CrateWarehouse.Warehouse.name) then
                            if StartScript(eScript.Business.CrateWarehouse.Warehouse.name, eScript.Business.CrateWarehouse.Warehouse.stack) then
                                local warehouseSlot = eGlobal.Business.CrateWarehouse.Slot:Get()
                                local x, y, z       = eNative.ENTITY.GET_ENTITY_COORDS(GTA.GetLocalPed())
                                eGlobal.Player.Property:Set(warehouseSlot - 1)
                                eLocal.Business.CrateWarehouse.Bitset:Set(13)
                                eLocal.Business.CrateWarehouse.Property:Set(warehouseSlot)
                                eLocal.Business.CrateWarehouse.Position.X:Set(x)
                                eLocal.Business.CrateWarehouse.Position.Y:Set(y)
                                eLocal.Business.CrateWarehouse.Position.Z:Set(z)
                            end
                        end
                    end
                },
                Cooldown = {
                    hash = Utils.Joaat("SN_CrateWarehouse_Cooldown"),
                    name = "Kill Cooldowns",
                    type = eFeatureType.Button,
                    desc = "Skips almost all cooldowns.",
                    func = function()
                        eTunable.Business.CrateWarehouse.Cooldown.Buy:Set(0)
                        eTunable.Business.CrateWarehouse.Cooldown.Sell:Set(0)
                    end
                },
                Supply = {
                    hash = Utils.Joaat("SN_CrateWarehouse_Supply"),
                    name = "Get Crates",
                    type = eFeatureType.Button,
                    desc = "Gets crates for your bunker.",
                    func = function()
                        ePackedBool.Business.CrateWarehouse.Cargo:Set(true)
                    end
                },
                Supplier = {
                    hash = Utils.Joaat("SN_CrateWarehouse_Supplier"),
                    name = "Turkish Supplier",
                    type = eFeatureType.Toggle,
                    desc = "Fills your crate warehouse stock repeatedly.",
                    func = function()
                        ePackedBool.Business.CrateWarehouse.Cargo:Set(true)
                    end
                },
                Select = {
                    hash = Utils.Joaat("SN_CrateWarehouse_Select"),
                    name = "Crates Amount",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired crates amount to buy."
                },
                Buy = {
                    hash = Utils.Joaat("SN_CrateWarehouse_Buy"),
                    name = "Instant Buy",
                    type = eFeatureType.Button,
                    desc = "Finishes the buy mission instantly. Use after the mission has started.",
                    func = function(amount)
                        eLocal.Business.CrateWarehouse.Buy.Amount:Set(amount)
                        eLocal.Business.CrateWarehouse.Buy.Finish1:Set(1)
                        eLocal.Business.CrateWarehouse.Buy.Finish2:Set(6)
                        eLocal.Business.CrateWarehouse.Buy.Finish3:Set(4)
                    end
                }
            },
            Stats = {
                BuyMade = {
                    hash = Utils.Joaat("SN_CrateWarehouse_BuyMade"),
                    name = "Buy Made",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired buy made."
                },
                BuyUndertaken = {
                    hash = Utils.Joaat("SN_CrateWarehouse_BuyUndertaken"),
                    name = "Buy Undertaken",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired buy undertaken."
                },
                SellMade = {
                    hash = Utils.Joaat("SN_CrateWarehouse_SellMade"),
                    name = "Sell Made",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales made."
                },
                SellUndertaken = {
                    hash = Utils.Joaat("SN_CrateWarehouse_SellUndertaken"),
                    name = "Sell Undertaken",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired sales undertaken."
                },
                Earnings = {
                    hash = Utils.Joaat("SN_CrateWarehouse_Earnings"),
                    name = "Earnings",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired earnings."
                },
                NoBuy = {
                    hash = Utils.Joaat("SN_CrateWarehouse_NoBuy"),
                    name = "Don't Apply Buy",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new buy missions or not."
                },
                NoSell = {
                    hash = Utils.Joaat("SN_CrateWarehouse_NoSell"),
                    name = "Don't Apply Sell",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new sell missions or not."
                },
                NoEarnings = {
                    hash = Utils.Joaat("SN_CrateWarehouse_NoEarnings"),
                    name = "Don't Apply Earnings",
                    type = eFeatureType.Toggle,
                    desc = "Decides whether you want to apply new earnings or not."
                },
                Apply = {
                    hash = Utils.Joaat("SN_CrateWarehouse_Apply"),
                    name = "Apply All Changes",
                    type = eFeatureType.Button,
                    desc = "Applies all changes.",
                    func = function(bool1, bool2, bool3, buyMade, buyUndertaken, sellMade, sellUndertaken, earnings)
                        print("Called func with values:", bool1, bool2, bool3, buyMade, buyUndertaken, sellMade, sellUndertaken, earnings)
                        if not bool1 then
                            eStat.MPX_LIFETIME_BUY_COMPLETE:Set(buyMade)
                            eStat.MPX_LIFETIME_BUY_UNDERTAKEN:Set(buyUndertaken)
                        end
                        if not bool2 then
                            eStat.MPX_LIFETIME_SELL_COMPLETE:Set(sellMade)
                            eStat.MPX_LIFETIME_SELL_UNDERTAKEN:Set(sellUndertaken)
                        end
                        if not bool3 then
                            eStat.MPX_LIFETIME_CONTRA_EARNINGS:Set(earnings)
                        end
                    end
                }
            }
        },
        EasyMoney = {
            Instant = {
                Give40m = {
                    hash = Utils.Joaat("SN_EasyMoney_40m"),
                    name = "Give 40mil",
                    type = eFeatureType.Button,
                    desc = "Gives 40mil dollars in a few seconds. Has a cooldown of about 1 hour.",
                    func = function()
                        TriggerTransaction(0x176D9D54)
                        Script.Yield(3000)
                        TriggerTransaction(0xA174F633)
                        Script.Yield(3000)
                        TriggerTransaction(0xED97AFC1)
                        Script.Yield(3000)
                        TriggerTransaction(0x4B6A869C)
                        Script.Yield(3000)
                        TriggerTransaction(0x314FB8B0)
                    end
                }
            },
            Freeroam = {
                Loop5k = {
                    hash = Utils.Joaat("SN_EasyMoney_5k"),
                    name = "5k Loop",
                    type = eFeatureType.Toggle,
                    desc = "Toggles the 50k dollars loop.",
                    func = function()
                        eGlobal.World.Casino.Chips.Bonus:Set(1)
                    end
                },
                Loop50k = {
                    hash = Utils.Joaat("SN_EasyMoney_50k"),
                    name = "50k Loop",
                    type = eFeatureType.Toggle,
                    desc = "Toggles the 50k dollars loop.",
                    func = function()
                        TriggerTransaction(0x610F9AB4)
                    end
                },
                Loop180k = {
                    hash = Utils.Joaat("SN_EasyMoney_180k"),
                    name = "180k Loop",
                    type = eFeatureType.Toggle,
                    desc = "Toggles the 180k dollars loop.",
                    func = function()
                        TriggerTransaction(0x615762F1)
                    end
                }
            },
            Property = {
                Loop300k = {
                    hash = Utils.Joaat("SN_EasyMoney_300k"),
                    name = "300k Loop",
                    type = eFeatureType.Toggle,
                    desc = "Toggles the 300k dollars loop. Use inside your Nightclub.",
                    func = function()
                        local top5      = eGlobal.Business.Nightclub.Safe.Income.Top5.global
                        local top100    = eGlobal.Business.Nightclub.Safe.Income.Top100.global
                        local safeValue = eGlobal.Business.Nightclub.Safe.Value:Get()
                        local maxValue  = 300000
                        eTunable.Business.Nightclub.Safe.MaxCapacity:Set(maxValue)
                        for i = top5, top100 do
                            ScriptGlobal.SetInt(i, maxValue)
                        end
                        if safeValue <= maxValue and safeValue ~= 0 then
                            eLocal.Business.Nightclub.Safe.Collect:Set(1)
                        elseif safeValue == 0 then
                            eStat.MPX_CLUB_PAY_TIME_LEFT:Set(-1)
                        end
                    end
                }
            }
        },
        Misc = {
            Edit = {
                Select = {
                    hash = Utils.Joaat("SN_Misc_EditSelect"),
                    name = "Money Amount",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired money amount."
                },
                Deposit = {
                    hash = Utils.Joaat("SN_Misc_EditDeposit"),
                    name = "Deposit",
                    type = eFeatureType.Button,
                    desc = "Deposits the selected money amount to your bank.",
                    func = function(amount)
                        local charSlot = eStat.MPPLY_LAST_MP_CHAR:Get()
                        local amount   = (amount > eNative.MONEY.NETWORK_GET_VC_WALLET_BALANCE()) and eNative.MONEY.NETWORK_GET_VC_WALLET_BALANCE() or amount
                        eNative.NETSHOPPING.NET_GAMESERVER_TRANSFER_WALLET_TO_BANK(charSlot, amount)
                    end
                },
                Withdraw = {
                    hash = Utils.Joaat("SN_Misc_EditWithdraw"),
                    name = "Withdraw",
                    type = eFeatureType.Button,
                    desc = "Withdraws the selected money amount from your bank.",
                    func = function(amount)
                        local charSlot = eStat.MPPLY_LAST_MP_CHAR:Get()
                        local amount   = (amount > eNative.MONEY.NETWORK_GET_VC_BANK_BALANCE()) and eNative.MONEY.NETWORK_GET_VC_BANK_BALANCE() or amount
                        eNative.NETSHOPPING.NET_GAMESERVER_TRANSFER_BANK_TO_WALLET(charSlot, amount)
                    end
                },
                Remove = {
                    hash = Utils.Joaat("SN_Misc_EditorRemove"),
                    name = "Remove",
                    type = eFeatureType.Button,
                    desc = "Removes the selected money amount from your character.",
                    func = function(amount)
                        local charSlot = eStat.MPPLY_LAST_MP_CHAR:Get()
                        local amount   = (amount > eNative.MONEY.NETWORK_GET_VC_BANK_BALANCE() + eNative.MONEY.NETWORK_GET_VC_WALLET_BALANCE()) and eNative.MONEY.NETWORK_GET_VC_BANK_BALANCE() + eNative.MONEY.NETWORK_GET_VC_WALLET_BALANCE() or amount
                        eGlobal.Player.Cash.Remove:Set(amount)
                    end
                }
            },
            Story = {
                Character = {
                    hash = Utils.Joaat("SN_Misc_StoryCharacter"),
                    name = "Character",
                    type = eFeatureType.Combo,
                    desc = "Select the desired story character.",
                    list = eTable.Story.Characters
                },
                Select = {
                    hash = Utils.Joaat("SN_Misc_StorySelect"),
                    name = "Money Amount",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired money amount."
                },
                Apply = {
                    hash = Utils.Joaat("SN_Misc_StoryApply"),
                    name = "Apply Money Amount",
                    type = eFeatureType.Button,
                    desc = "Applies the selected money amount to the selected story character.",
                    func = function(characterIndex, amount)
                        eStat["SP" .. characterIndex .. "_TOTAL_CASH"]:Set(amount)
                    end
                }
            },
            Stats = {
                Earned = {
                    hash = Utils.Joaat("SN_Misc_StatsEarned"),
                    name = "Earned",
                    type = eFeatureType.Combo,
                    desc = "Select the desired «Earned» stat.",
                    list = eTable.Cash.Stats.Earneds
                },
                Spent = {
                    hash = Utils.Joaat("SN_Misc_StatsSpent"),
                    name = "Spent",
                    type = eFeatureType.Combo,
                    desc = "Select the desired «Spent» stat.",
                    list = eTable.Cash.Stats.Spents
                },
                Select = {
                    hash = Utils.Joaat("SN_Misc_StatsSelect"),
                    name = "Money Amount",
                    type = eFeatureType.InputInt,
                    desc = "Select the desired money amount."
                },
                Apply = {
                    hash = Utils.Joaat("SN_Misc_StatsApply"),
                    name = "Apply Money Amount",
                    type = eFeatureType.Button,
                    desc = "Applies the selected money amount to the selected stat.",
                    func = function(earnedStat, spentStat, amount)
                        if earnedStat ~= 0 then
                            earnedStat:Set(amount)
                        end
                        if spentStat ~= 0 then
                            spentStat:Set(amount)
                        end
                    end
                }
            }
        }
    },
    Unlock = {
        
    }
}
