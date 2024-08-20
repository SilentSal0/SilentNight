eTunable = {
    HAS_PARSED = false,
    Business = {
        Bunker = {
            Price = { type = "int", tunable = "GR_MANU_PRODUCT_VALUE", defaultValue = 5000 },
            Research = {
                Capacity       = { type = "int", tunable = "GR_RESEARCH_CAPACITY",        defaultValue = 60     },
                ProductionTime = { type = "int", tunable = "GR_RESEARCH_PRODUCTION_TIME", defaultValue = 300000 },
                ReductionTime = {
                    EquipmentUpgraded = { type = "int", tunable = "GR_RESEARCH_UPGRADE_EQUIPMENT_REDUCTION_TIME", defaultValue = 45000 },
                    StaffUpgraded     = { type = "int", tunable = "GR_RESEARCH_UPGRADE_STAFF_REDUCTION_TIME",     defaultValue = 45000 }
                },
                MaterialProduct = 
                {
                    Cost         = { type = "int", tunable = "GR_RESEARCH_MATERIAL_PRODUCT_COST",                   defaultValue = 2 },
                    CostUpgraded = { type = "int", tunable = "GR_RESEARCH_MATERIAL_PRODUCT_COST_UPGRADE_REDUCTION", defaultValue = 1 }
                }
            },
            Multiplier = {
                ProductLocal = { type = "float", tunable = "BIKER_SELL_PRODUCT_LOCAL_MODIFIER", defaultValue = 1.0 },
                ProductFar   = { type = "float", tunable = "BIKER_SELL_PRODUCT_FAR_MODIFIER",   defaultValue = 1.5 }
            }
        },
        CrateWarehouse = { 
            Price = { 
                Threshold1  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1",  defaultValue = 10000 },
                Threshold2  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD2",  defaultValue = 11000 },
                Threshold3  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD3",  defaultValue = 12000 },
                Threshold4  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD4",  defaultValue = 13000 },
                Threshold5  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD5",  defaultValue = 13500 },
                Threshold6  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD6",  defaultValue = 14000 },
                Threshold7  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD7",  defaultValue = 14500 },
                Threshold8  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD8",  defaultValue = 15000 },
                Threshold9  = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD9",  defaultValue = 15500 },
                Threshold10 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD10", defaultValue = 16000 },
                Threshold11 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD11", defaultValue = 16500 },
                Threshold12 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD12", defaultValue = 17000 },
                Threshold13 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD13", defaultValue = 17500 },
                Threshold14 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD14", defaultValue = 17750 },
                Threshold15 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD15", defaultValue = 18000 },
                Threshold16 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD16", defaultValue = 18250 },
                Threshold17 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD17", defaultValue = 18500 },
                Threshold18 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD18", defaultValue = 18750 },
                Threshold19 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD19", defaultValue = 19000 },
                Threshold20 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD20", defaultValue = 19500 },
                Threshold21 = { type = "int", tunable = "EXEC_CONTRABAND_SALE_VALUE_THRESHOLD21", defaultValue = 20000 }
            },
            Cooldown = {
                Buy  = { type = "int", tunable = "EXEC_BUY_COOLDOWN",  defaultValue = 300000  },
                Sell = { type = "int", tunable = "EXEC_SELL_COOLDOWN", defaultValue = 1800000 }
            },
            HighDemand = { type = "float", tunable = "EXEC_CONTRABAND_HIGH_DEMAND_BONUS_PERCENTAGE", defaultValue = 2.5 }
        },
        Hangar = {
            Price = { 
                Mixed       = { type = "int", tunable = "SMUG_SELL_PRICE_PER_CRATE_MIXED",                 defaultValue = 30000 },
                Animals     = { type = "int", tunable = "SMUG_SELL_PRICE_PER_CRATE_ANIMAL_MATERIALS",      defaultValue = 30000 },
                Arts        = { type = "int", tunable = "SMUG_SELL_PRICE_PER_CRATE_ART_AND_ANTIQUES",      defaultValue = 30000 },
                Chemicals   = { type = "int", tunable = "SMUG_SELL_PRICE_PER_CRATE_CHEMICALS",             defaultValue = 30000 },
                Counterfeit = { type = "int", tunable = "SMUG_SELL_PRICE_PER_CRATE_COUNTERFEIT_GOODS",     defaultValue = 30000 },
                Jewelry     = { type = "int", tunable = "SMUG_SELL_PRICE_PER_CRATE_JEWELRY_AND_GEMSTONES", defaultValue = 30000 },
                Medicals    = { type = "int", tunable = "SMUG_SELL_PRICE_PER_CRATE_MEDICAL_SUPPLIES",      defaultValue = 30000 },
                Narcotics   = { type = "int", tunable = "SMUG_SELL_PRICE_PER_CRATE_NARCOTICS",             defaultValue = 30000 },
                Tobacco     = { type = "int", tunable = "SMUG_SELL_PRICE_PER_CRATE_TOBACCO_AND_ALCOHOL",   defaultValue = 30000 }
            },
            RonsCut = { type = "float", tunable = "SMUG_SELL_RONS_CUT", defaultValue = 0.025 }
        },
        Nightclub = {
            Price = {
                Weapons   = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_WEAPONS",          defaultValue = 5000  },
                Coke      = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_COKE",             defaultValue = 27000 },
                Meth      = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_METH",             defaultValue = 11475 },
                Weed      = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_WEED",             defaultValue = 2025  },
                Documents = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_FORGED_DOCUMENTS", defaultValue = 1350  },
                Cash      = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_COUNTERFEIT_CASH", defaultValue = 4725  },
                Cargo     = { type = "int", tunable = "BB_BUSINESS_BASIC_VALUE_CARGO",            defaultValue = 10000 }
            },
            Safe = {
                Income = {
                    Top5   = { type = "int", tunable = "NIGHTCLUBINCOMEUPTOPOP5",   defaultValue = 1500  },
                    Top100 = { type = "int", tunable = "NIGHTCLUBINCOMEUPTOPOP100", defaultValue = 50000 }
                },
                MaxCapacity = { type = "int", tunable = "NIGHTCLUBMAXSAFEVALUE", defaultValue = 250000 },
            },
            Cooldown = {
                ClubManagement = { type = "int", tunable = "BB_CLUB_MANAGEMENT_CLUB_MANAGEMENT_MISSION_COOLDOWN",           defaultValue  = 300000 },
                Sell           = { type = "int", tunable = "BB_SELL_MISSIONS_MISSION_COOLDOWN",                             defaultValue  = 300000 },
                SellDelivery   = { type = "int", tunable = "BB_SELL_MISSIONS_DELIVERY_VEHICLE_COOLDOWN_AFTER_SELL_MISSION", defaultValue  = 300000 }
            }
        }
    },
    Heist = {
        Agency = {
            Payout   = { type = "int", tunable = "FIXER_FINALE_LEADER_CASH_REWARD", defaultValue = 1000000 },
            Cooldown = { type = "int", tunable = "FIXER_STORY_COOLDOWN_POSIX",      defaultValue = 1800    }
        },
        Apartment = {
            RootIdHash = {
                Fleeca  = { type = "int", tunable = "ROOT_ID_HASH_THE_FLECCA_JOB",           defaultValue = Utils.sJoaat("33TxqLipLUintwlU_YDzMg") },
                Prison  = { type = "int", tunable = "ROOT_ID_HASH_THE_PRISON_BREAK",         defaultValue = Utils.sJoaat("A6UBSyF61kiveglc58lm2Q") },
                Humane  = { type = "int", tunable = "ROOT_ID_HASH_THE_HUMANE_LABS_RAID",     defaultValue = Utils.sJoaat("a_hWnpMUz0-7Yd_Rc5pJ4w") },
                Series  = { type = "int", tunable = "ROOT_ID_HASH_SERIES_A_FUNDING",         defaultValue = Utils.sJoaat("7r5AKL5aB0qe9HiDy3nW8w") },
                Pacific = { type = "int", tunable = "ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB", defaultValue = Utils.sJoaat("hKSf9RCT8UiaZlykyGrMwg") }
            }
        },
        AutoShop = {
            Payout = {
                First   = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD0", defaultValue = 300000 },
                Second  = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD1", defaultValue = 185000 },
                Third   = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD2", defaultValue = 178000 },
                Fourth  = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD3", defaultValue = 172000 },
                Fifth   = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD4", defaultValue = 175000 },
                Sixth   = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD5", defaultValue = 182000 },
                Seventh = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD6", defaultValue = 180000 },
                Eight   = { type = "int",   tunable = "TUNER_ROBBERY_LEADER_CASH_REWARD7", defaultValue = 170000 },
                Fee     = { type = "float", tunable = "TUNER_ROBBERY_CONTACT_FEE",         defaultValue = 0.1    }
            },
            Cooldown = { type = "int", tunable = "TUNER_ROBBERY_COOLDOWN_TIME", defaultValue = 3600 }
        },
        CayoPerico = {
            Bag = {
                MaxCapacity = { type = "int", tunable = "HEIST_BAG_MAX_CAPACITY", defaultValue = 1800 }
            }
        },
        SalvageYard = {
            Robbery = {
                Slot1 = {
                    --Type = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_0", defaultValue = -1 }
                },
                Slot2 = {
                    --Type = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_1", defaultValue = -1 }
                },
                Slot3 = {
                    --Type = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_2", defaultValue = -1 }
                },
                SetupPrice = { type = "int", tunable = 71522671, defaultValue = 20000 }
            },
            Vehicle = {
                Slot1 = {
                    --Type    = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_ID_0",       defaultValue = 0  },
                    --Value   = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_VALUE_0",    defaultValue = -1 },
                    --CanKeep = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_CAN_KEEP_0", defaultValue = 0  }
                },
                Slot2 = {
                    --Type    = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_ID_1",       defaultValue = 0  },
                    --Value   = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_VALUE_1",    defaultValue = -1 },
                    --CanKeep = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_CAN_KEEP_1", defaultValue = 0  }
                },
                Slot3 = {
                    --Type    = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_ID_2",       defaultValue = 0  },
                    --Value   = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_VALUE_2",    defaultValue = -1 },
                    --CanKeep = { type = "int", tunable = "SALV23_VEHICLE_ROBBERY_CAN_KEEP_2", defaultValue = 0  }
                },
                ClaimPrice = {
                    Standard   = { type = "int", tunable = "SALV23_VEHICLE_CLAIM_PRICE",                  defaultValue = 20000 },
                    Discounted = { type = "int", tunable = "SALV23_VEHICLE_CLAIM_PRICE_FORGERY_DISCOUNT", defaultValue = 10000 },
                },
                --SalvageValueMultiplier = { type = "float", tunable = "SALV23_VEHICLE_SALVAGE_VALUE_MULTIPLIER", defaultValue = 0.8 },
            },
            Cooldown = {
                Weekly  = { type = "int", tunable = "SALV23_VEH_ROBBERY_WEEK_ID",   defaultValue = 0    },
                Robbery = { type = "int", tunable = "SALV23_VEH_ROB_COOLDOWN_TIME", defaultValue = 300  },
                Cfr     = { type = "int", tunable = "SALV23_CFR_COOLDOWN_TIME",     defaultValue = 3600 }
            }
        },
    },
    Player = {
        Appearance = {
            Cooldown = { type = "int", tunable = "CHARACTER_APPEARANCE_COOLDOWN", defaultValue = 2880000}
        }
    },
    Vehicle = {
        Dripfeed = {
            Envisage        = { type = "int", tunable = "ENABLE_VEHICLE_ENVISAGE",        defaultValue = 0 },
            EuroSX32        = { type = "int", tunable = "ENABLE_VEHICLE_EUROSX32",        defaultValue = 0 },
            PolImpaler5     = { type = "int", tunable = "ENABLE_VEHICLE_POLIMPALER5",     defaultValue = 0 },
            PolGreenwood    = { type = "int", tunable = "ENABLE_VEHICLE_POLGREENWOOD",    defaultValue = 0 },
            Pipistrello     = { type = "int", tunable = "ENABLE_VEHICLE_PIPISTRELLO",     defaultValue = 0 },
            PolImpaler6     = { type = "int", tunable = "ENABLE_VEHICLE_POLIMPALER6",     defaultValue = 0 },
            Castigator      = { type = "int", tunable = "ENABLE_VEHICLE_CASTIGATOR",      defaultValue = 0 },
            Dominator10     = { type = "int", tunable = "ENABLE_VEHICLE_DOMINATOR10",     defaultValue = 0 },
            Vorschlaghammer = { type = "int", tunable = "ENABLE_VEHICLE_VORSCHLAGHAMMER", defaultValue = 0 },
            Paragon3        = { type = "int", tunable = "ENABLE_VEHICLE_PARAGON3",        defaultValue = 0 },
            PolDorado       = { type = "int", tunable = "ENABLE_VEHICLE_POLDORADO",       defaultValue = 0 },
            PolDominator10  = { type = "int", tunable = "ENABLE_VEHICLE_POLDOMINATOR10",  defaultValue = 0 },
            Niobe           = { type = "int", tunable = "ENABLE_VEHICLE_NIOBE",           defaultValue = 0 },
            Coquette5       = { type = "int", tunable = "ENABLE_VEHICLE_COQUETTE5",       defaultValue = 0 },
            Pizzaboy        = { type = "int", tunable = "ENABLE_VEHICLE_PIZZABOY",        defaultValue = 0 }
        },
        Removed = {
            Z190         = { type = "int", tunable = "ENABLE_Z190",                 defaultValue = 0 },
            Pfister811   = { type = "int", tunable = "ENABLEEXEC1_PFISTER",         defaultValue = 0 },
            Ninef        = { type = "int", tunable = "ENABLE_VEHICLE_NINEF",        defaultValue = 0 },
            Ninef2       = { type = "int", tunable = "ENABLE_VEHICLE_NINEF2",       defaultValue = 0 },
            Akuma        = { type = "int", tunable = "ENABLE_VEHICLE_AKUMA",        defaultValue = 0 },
            Alpha        = { type = "int", tunable = "ENABLE_VEHICLE_ALPHA",        defaultValue = 0 },
            Asea         = { type = "int", tunable = "ENABLE_VEHICLE_ASEA",         defaultValue = 0 },
            Asterope     = { type = "int", tunable = "ENABLE_VEHICLE_ASTEROPE",     defaultValue = 0 },
            Avarus       = { type = "int", tunable = "ENABLE_BIKER_AVARUS",         defaultValue = 0 },
            Bagger       = { type = "int", tunable = "ENABLE_BIKER_BAGGER",         defaultValue = 0 },
            Baller       = { type = "int", tunable = "ENABLE_VEHICLE_BALLER",       defaultValue = 0 },
            Baller2      = { type = "int", tunable = "ENABLE_VEHICLE_BALLER2",      defaultValue = 0 },
            Baller3      = { type = "int", tunable = "ENABLE_VEHICLE_BALLER3",      defaultValue = 0 },
            Baller5      = { type = "int", tunable = "ENABLE_VEHICLE_BALLER5",      defaultValue = 0 },
            Bati2        = { type = "int", tunable = "ENABLE_VEHICLE_BATI2",        defaultValue = 0 },
            Bjxl         = { type = "int", tunable = "ENABLE_VEHICLE_BJXL",         defaultValue = 0 },
            Bfinjection  = { type = "int", tunable = "ENABLE_VEHICLE_BFINJECTION",  defaultValue = 0 },
            Bifta        = { type = "int", tunable = "ENABLE_VEHICLE_BIFTA",        defaultValue = 0 },
            Blade        = { type = "int", tunable = "ENABLE_VEHICLE_BLADE",        defaultValue = 0 },
            Blazer       = { type = "int", tunable = "ENABLE_VEHICLE_BLAZER",       defaultValue = 0 },
            Blazer2      = { type = "int", tunable = "ENABLE_VEHICLE_BODHI2",       defaultValue = 0 },
            Bodhi2       = { type = "int", tunable = "ENABLE_VEHICLE_BRAWLER",      defaultValue = 0 },
            Brawler      = { type = "int", tunable = "ENABLE_VEHICLE_BRAWLER",      defaultValue = 0 },
            Buffalo      = { type = "int", tunable = "ENABLE_VEHICLE_BUFFALO",      defaultValue = 0 },
            Buffalo2     = { type = "int", tunable = "ENABLE_VEHICLE_BUFFALO2",     defaultValue = 0 },
            Bullet       = { type = "int", tunable = "ENABLE_VEHICLE_BULLET",       defaultValue = 0 },
            Carbonizzare = { type = "int", tunable = "ENABLE_VEHICLE_CARBONIZZARE", defaultValue = 0 },
            Cavalcade    = { type = "int", tunable = "ENABLE_VEHICLE_CAVALCADE",    defaultValue = 0 },
            Cavalcade2   = { type = "int", tunable = "ENABLE_VEHICLE_CAVALCADE2",   defaultValue = 0 },
            Cheburek     = { type = "int", tunable = "ENABLE_CHEBUREK",             defaultValue = 0 },
            Cheetah      = { type = "int", tunable = "ENABLE_VEHICLE_CHEETAH",      defaultValue = 0 },
            Cliffhanger  = { type = "int", tunable = "ENABLESTUNT_CLIFFHANGER",     defaultValue = 0 },
            Clique       = { type = "int", tunable = "ENABLE_VEHICLE_CLIQUE",       defaultValue = 0 },
            Cognoscenti  = { type = "int", tunable = "ENABLE_VEHICLE_COGNOSCENTI",  defaultValue = 0 },
            Cognoscenti2 = { type = "int", tunable = "ENABLE_VEHICLE_COGNOSCENTI2", defaultValue = 0 },
            Cog55        = { type = "int", tunable = "ENABLE_VEHICLE_COG55",        defaultValue = 0 },
            Cog552       = { type = "int", tunable = "ENABLE_VEHICLE_COG552",       defaultValue = 0 },
            Cogcabrio    = { type = "int", tunable = "ENABLE_VEHICLE_COGCABRIO",    defaultValue = 0 },
            Comet2       = { type = "int", tunable = "ENABLE_IE_COMET2",            defaultValue = 0 },
            Comet3       = { type = "int", tunable = "ENABLE_IE_COMET3",            defaultValue = 0 },
            Comet5       = { type = "int", tunable = "ENABLE_COMET5",               defaultValue = 0 },
            Contender    = { type = "int", tunable = "ENABLESTUNT_CONTENDER",       defaultValue = 0 },
            Coquette     = { type = "int", tunable = "ENABLE_VEHICLE_COQUETTE",     defaultValue = 0 },
            Coquette3    = { type = "int", tunable = "ENABLE_VEHICLE_COQUETTE3",    defaultValue = 0 },
            Cyclone      = { type = "int", tunable = "ENABLE_CYCLONE",              defaultValue = 0 },
            Daemon2      = { type = "int", tunable = "ENABLE_BIKER_WESTERNDAEMON",  defaultValue = 0 },
            Deviant      = { type = "int", tunable = "ENABLE_VEHICLE_DEVIANT",      defaultValue = 0 },
            Dilettante   = { type = "int", tunable = "ENABLE_VEHICLE_DILETTANTE",   defaultValue = 0 },
            Double       = { type = "int", tunable = "ENABLE_VEHICLE_DOUBLE",       defaultValue = 0 },
            Dune         = { type = "int", tunable = "ENABLE_VEHICLE_DUNE",         defaultValue = 0 },
            Dynasty      = { type = "int", tunable = "ENABLE_VEHICLE_DYNASTY",      defaultValue = 0 },
            Enduro       = { type = "int", tunable = "ENABLE_VEHICLE_ENDURO",       defaultValue = 0 },
            EntityXF     = { type = "int", tunable = "ENABLE_VEHICLE_ENTITYXF",     defaultValue = 0 },
            Esskey       = { type = "int", tunable = "ENABLE_BIKER_ESSKEY",         defaultValue = 0 },
            Sheava       = { type = "int", tunable = "ENABLE_VEHICLE_SHEAVA",       defaultValue = 0 },
            Exemplar     = { type = "int", tunable = "ENABLE_VEHICLE_EXEMPLAR",     defaultValue = 0 },
            F620         = { type = "int", tunable = "ENABLE_VEHICLE_F620",         defaultValue = 0 },
            Fagaloa      = { type = "int", tunable = "ENABLE_FAGALOA",              defaultValue = 0 },
            Faggio       = { type = "int", tunable = "ENABLE_BIKER_FAGGIO",         defaultValue = 0 },
            Faggio3      = { type = "int", tunable = "ENABLE_BIKER_FAGGIO3",        defaultValue = 0 },
            Faggio2      = { type = "int", tunable = "ENABLE_VEHICLE_FAGGIO2",      defaultValue = 0 },
            Felon        = { type = "int", tunable = "ENABLE_VEHICLE_FELON",        defaultValue = 0 },
            Felon2       = { type = "int", tunable = "ENABLE_VEHICLE_FELON2",       defaultValue = 0 },
            Feltzer2     = { type = "int", tunable = "ENABLE_VEHICLE_FELTZER2",     defaultValue = 0 },
            FMJ          = { type = "int", tunable = "ENABLE_VEHICLE_FMJ",          defaultValue = 0 },
            FQ2          = { type = "int", tunable = "ENABLE_VEHICLE_FQ2",          defaultValue = 0 },
            BType2       = { type = "int", tunable = "ENABLE_VEHICLE_BTYPE2",       defaultValue = 0 },
            Fugitive     = { type = "int", tunable = "ENABLE_VEHICLE_FUGITIVE",     defaultValue = 0 },
            FuroreGT     = { type = "int", tunable = "ENABLE_VEHICLE_FUROREGT",     defaultValue = 0 },
            Fusilade     = { type = "int", tunable = "ENABLE_VEHICLE_FUSILADE",     defaultValue = 0 },
            Futo         = { type = "int", tunable = "ENABLE_VEHICLE_FUTO",         defaultValue = 0 },
            Gauntlet     = { type = "int", tunable = "ENABLE_VEHICLE_GAUNTLET",     defaultValue = 0 },
            GP1          = { type = "int", tunable = "ENABLEGP1",                   defaultValue = 0 },
            Granger      = { type = "int", tunable = "ENABLE_VEHICLE_GRANGER",      defaultValue = 0 },
            Gresley      = { type = "int", tunable = "ENABLE_VEHICLE_GRESLEY",      defaultValue = 0 },
            GT500        = { type = "int", tunable = "ENABLE_GT500",                defaultValue = 0 },
            Habanero     = { type = "int", tunable = "ENABLE_VEHICLE_HABANERO",     defaultValue = 0 },
            Hakuchou     = { type = "int", tunable = "ENABLE_VEHICLE_HAKUCHOU",     defaultValue = 0 },
            Hellion      = { type = "int", tunable = "ENABLE_VEHICLE_HELLION",      defaultValue = 0 },
            Hermes       = { type = "int", tunable = "ENABLE_HERMES",               defaultValue = 0 },
            Hexer        = { type = "int", tunable = "ENABLE_VEHICLE_HEXER",        defaultValue = 0 },
            Blazer3      = { type = "int", tunable = "ENABLE_VEHICLE_BLAZER3",      defaultValue = 0 },
            Hustler      = { type = "int", tunable = "ENABLE_HUSTLER",              defaultValue = 0 },
            Imorgen      = { type = "int", tunable = "ENABLE_VEHICLE_IMORGEN",      defaultValue = 0 },
            Infernus     = { type = "int", tunable = "ENABLE_VEHICLE_INFERNUS",     defaultValue = 0 },
            Ingot        = { type = "int", tunable = "ENABLE_VEHICLE_INGOT",        defaultValue = 0 },
            Innovation   = { type = "int", tunable = "ENABLE_VEHICLE_INNOVATION",   defaultValue = 0 },
            Intruder     = { type = "int", tunable = "ENABLE_VEHICLE_INTRUDER",     defaultValue = 0 },
            Issi2        = { type = "int", tunable = "ENABLE_VEHICLE_ISSI2",        defaultValue = 0 },
            Issi7        = { type = "int", tunable = "ENABLE_VEHICLE_ISSI7",        defaultValue = 0 },
            Jackal       = { type = "int", tunable = "ENABLE_VEHICLE_JACKAL",       defaultValue = 0 },
            JB700        = { type = "int", tunable = "ENABLE_VEHICLE_JB700",        defaultValue = 0 },
            Jester       = { type = "int", tunable = "ENABLE_VEHICLE_JESTER",       defaultValue = 0 },
            Jester2      = { type = "int", tunable = "ENABLE_VEHICLE_JESTER2",      defaultValue = 0 },
            Kalahari     = { type = "int", tunable = "ENABLE_VEHICLE_KALAHARI",     defaultValue = 0 },
            Landstalker  = { type = "int", tunable = "ENABLE_VEHICLE_LANDSTALKER",  defaultValue = 0 },
            Landstalker2 = { type = "int", tunable = "ENABLE_VEH_LANDSTALKER2",     defaultValue = 0 },
            Lguard       = { type = "int", tunable = "ENABLE_VEHICLE_LGUARD",       defaultValue = 0 },
            Locust       = { type = "int", tunable = "ENABLE_VEHICLE_LOCUST",       defaultValue = 0 },
            Lynx         = { type = "int", tunable = "ENABLESTUNT_LYNX",            defaultValue = 0 },
            Massacro     = { type = "int", tunable = "ENABLE_VEHICLE_MASSACRO",     defaultValue = 0 },
            Massacro2    = { type = "int", tunable = "ENABLE_VEHICLE_MASSACRO2",    defaultValue = 0 },
            Mesa3        = { type = "int", tunable = "ENABLE_VEHICLE_MESA3",        defaultValue = 0 },
            Michelli     = { type = "int", tunable = "ENABLE_MICHELLI",             defaultValue = 0 },
            Minivan      = { type = "int", tunable = "ENABLE_LOWRIDER2_MINIVAN",    defaultValue = 0 },
            Nebula       = { type = "int", tunable = "ENABLE_VEHICLE_NEBULA",       defaultValue = 0 },
            Nemesis      = { type = "int", tunable = "ENABLE_VEHICLE_NEMESIS",      defaultValue = 0 },
            Neo          = { type = "int", tunable = "ENABLE_VEHICLE_NEO",          defaultValue = 0 },
            Oracle       = { type = "int", tunable = "ENABLE_VEHICLE_ORACLE",       defaultValue = 0 },
            Oracle2      = { type = "int", tunable = "ENABLE_VEHICLE_ORACLE2",      defaultValue = 0 },
            Paragon      = { type = "int", tunable = "ENABLE_VEHICLE_PARAGON",      defaultValue = 0 },
            Patriot      = { type = "int", tunable = "ENABLE_VEHICLE_PATRIOT",      defaultValue = 0 },
            PCJ          = { type = "int", tunable = "ENABLE_VEHICLE_PCJ",          defaultValue = 0 },
            Penumbra     = { type = "int", tunable = "ENABLE_VEHICLE_PENUMBRA",     defaultValue = 0 },
            Peyote2      = { type = "int", tunable = "ENABLE_VEHICLE_PEYOTE2",      defaultValue = 0 },
            Picador      = { type = "int", tunable = "ENABLE_VEHICLE_PICADOR",      defaultValue = 0 },
            Pigalle      = { type = "int", tunable = "ENABLE_VEHICLE_PIGALLE",      defaultValue = 0 },
            Prairie      = { type = "int", tunable = "ENABLE_VEHICLE_PRAIRIE",      defaultValue = 0 },
            Premier      = { type = "int", tunable = "ENABLE_VEHICLE_PREMIER",      defaultValue = 0 },
            Radi         = { type = "int", tunable = "ENABLE_VEHICLE_RADI",         defaultValue = 0 },
            Raiden       = { type = "int", tunable = "ENABLE_RAIDEN",               defaultValue = 0 },
            RancherXL    = { type = "int", tunable = "ENABLE_VEHICLE_RANCHERXL",    defaultValue = 0 },
            RapidGT      = { type = "int", tunable = "ENABLE_VEHICLE_RAPIDGT",      defaultValue = 0 },
            RapidGT2     = { type = "int", tunable = "ENABLE_VEHICLE_RAPIDGT2",     defaultValue = 0 },
            RapidGT3     = { type = "int", tunable = "ENABLE_RAPIDGT3",             defaultValue = 0 },
            Raptor       = { type = "int", tunable = "ENABLE_BIKER_RAPTOR",         defaultValue = 0 },
            Ratbike      = { type = "int", tunable = "ENABLE_BIKER_RATBIKE",        defaultValue = 0 },
            Ratloader    = { type = "int", tunable = "ENABLE_VEHICLE_RATLOADER",    defaultValue = 0 },
            LE7B         = { type = "int", tunable = "ENABLESTUNT_LE7B",            defaultValue = 0 },
            Rebel2       = { type = "int", tunable = "ENABLE_VEHICLE_REBEL2",       defaultValue = 0 },
            Regina       = { type = "int", tunable = "ENABLE_VEHICLE_REGINA",       defaultValue = 0 },
            Retinue      = { type = "int", tunable = "ENABLE_RETINUE",              defaultValue = 0 },
            Revolter     = { type = "int", tunable = "ENABLE_REVOLTER",             defaultValue = 0 },
            Riata        = { type = "int", tunable = "ENABLE_RIATA",                defaultValue = 0 },
            Rocoto       = { type = "int", tunable = "ENABLE_VEHICLE_ROCOTO",       defaultValue = 0 },
            Romero       = { type = "int", tunable = "ENABLE_VEHICLE_ROMERO",       defaultValue = 0 },
            BType        = { type = "int", tunable = "ENABLE_VEHICLE_BTYPE",        defaultValue = 0 },
            BType3       = { type = "int", tunable = "ENABLE_VEHICLE_BTYPE3",       defaultValue = 0 },
            Ruffian      = { type = "int", tunable = "ENABLE_VEHICLE_RUFFIAN",      defaultValue = 0 },
            Ruiner       = { type = "int", tunable = "ENABLE_VEHICLE_RUINER",       defaultValue = 0 },
            Ruston       = { type = "int", tunable = "ENABLERUSTON",                defaultValue = 0 },
            Rebel        = { type = "int", tunable = "ENABLE_VEHICLE_REBEL",        defaultValue = 0 },
            S80          = { type = "int", tunable = "ENABLE_VEHICLE_S80",          defaultValue = 0 },
            Sanchez2     = { type = "int", tunable = "ENABLE_VEHICLE_SANCHEZ2",     defaultValue = 0 },
            Sanchez      = { type = "int", tunable = "ENABLE_VEHICLE_SANCHEZ",      defaultValue = 0 },
            Sanctus      = { type = "int", tunable = "ENABLE_BIKER_SANCTUS",        defaultValue = 0 },
            Sandking2    = { type = "int", tunable = "ENABLE_VEHICLE_SANDKING2",    defaultValue = 0 },
            Savestra     = { type = "int", tunable = "ENABLE_SAVESTRA",             defaultValue = 0 },
            SC1          = { type = "int", tunable = "ENABLE_SC1",                  defaultValue = 0 },
            Schafter2    = { type = "int", tunable = "ENABLE_VEHICLE_SCHAFTER2",    defaultValue = 0 },
            Schafter4    = { type = "int", tunable = "ENABLE_VEHICLE_SCHAFTER4",    defaultValue = 0 },
            Schafter6    = { type = "int", tunable = "ENABLE_VEHICLE_SCHAFTER6",    defaultValue = 0 },
            Schwartzer   = { type = "int", tunable = "ENABLE_VEHICLE_SCHWARZER",    defaultValue = 0 },
            Seminole     = { type = "int", tunable = "ENABLE_VEHICLE_SEMINOLE",     defaultValue = 0 },
            Seminole2    = { type = "int", tunable = "ENABLE_VEH_SEMINOLE2",        defaultValue = 0 },
            Sentinel2    = { type = "int", tunable = "ENABLE_VEHICLE_SENTINEL2",    defaultValue = 0 },
            Serrano      = { type = "int", tunable = "ENABLE_VEHICLE_SERRANO",      defaultValue = 0 },
            Seven70      = { type = "int", tunable = "ENABLE_VEHICLE_SEVEN70",      defaultValue = 0 },
            Sovereign    = { type = "int", tunable = "ENABLE_VEHICLE_SOVEREIGN",    defaultValue = 0 },
            Stafford     = { type = "int", tunable = "ENABLE_STAFFORD",             defaultValue = 0 },
            Stanier      = { type = "int", tunable = "ENABLE_VEHICLE_STANIER",      defaultValue = 0 },
            Stinger      = { type = "int", tunable = "ENABLE_VEHICLE_STINGER",      defaultValue = 0 },
            StingerGT    = { type = "int", tunable = "ENABLE_VEHICLE_STINGERGT",    defaultValue = 0 },
            Feltzer3     = { type = "int", tunable = "ENABLE_VEHICLE_FELTZER3",     defaultValue = 0 },
            Stratum      = { type = "int", tunable = "ENABLE_VEHICLE_STRATUM",      defaultValue = 0 },
            Streiter     = { type = "int", tunable = "ENABLE_STREITER",             defaultValue = 0 },
            Superd       = { type = "int", tunable = "ENABLE_VEHICLE_SUPERD",       defaultValue = 0 },
            Surano       = { type = "int", tunable = "ENABLE_VEHICLE_SURANO",       defaultValue = 0 },
            Surge        = { type = "int", tunable = "ENABLE_VEHICLE_SURGE",        defaultValue = 0 },
            Swinger      = { type = "int", tunable = "ENABLE_SWINGER",              defaultValue = 0 },
            Tailgater    = { type = "int", tunable = "ENABLE_VEHICLE_TAILGATER",    defaultValue = 0 },
            Thrust       = { type = "int", tunable = "ENABLE_VEHICLE_THRUST",       defaultValue = 0 },
            Tigon        = { type = "int", tunable = "ENABLE_VEH_TIGON",            defaultValue = 0 },
            Torero       = { type = "int", tunable = "ENABLE_TORERO",               defaultValue = 0 },
            Tornado6     = { type = "int", tunable = "ENABLE_BIKER_TORNADO6",       defaultValue = 0 },
            Tulip        = { type = "int", tunable = "ENABLE_VEHICLE_TULIP",        defaultValue = 0 },
            Tyrus        = { type = "int", tunable = "ENABLESTUNT_TYRUS",           defaultValue = 0 },
            Vacca        = { type = "int", tunable = "ENABLE_VEHICLE_VACCA",        defaultValue = 0 },
            Vader        = { type = "int", tunable = "ENABLE_VEHICLE_VADER",        defaultValue = 0 },
            Vamos        = { type = "int", tunable = "ENABLE_VEHICLE_VAMOS",        defaultValue = 0 },
            Verlierer2   = { type = "int", tunable = "ENABLE_VEHICLE_VERLIERER2",   defaultValue = 0 },
            Verus        = { type = "int", tunable = "ENABLE_VEHICLE_VERUS",        defaultValue = 0 },
            Vigero       = { type = "int", tunable = "ENABLE_VEHICLE_VIGERO",       defaultValue = 0 },
            Viseris      = { type = "int", tunable = "ENABLE_VISERIS",              defaultValue = 0 },
            Voltic       = { type = "int", tunable = "ENABLE_VEHICLE_VOLTIC",       defaultValue = 0 },
            Warrener     = { type = "int", tunable = "ENABLE_VEHICLE_WARRENER",     defaultValue = 0 },
            Washington   = { type = "int", tunable = "ENABLE_VEHICLE_WASHINGTON",   defaultValue = 0 },
            Wolfsbane    = { type = "int", tunable = "ENABLE_BIKER_WOLFSBANE",      defaultValue = 0 },
            XA21         = { type = "int", tunable = "ENABLE_XA21",                 defaultValue = 0 },
            XLS          = { type = "int", tunable = "ENABLE_VEHICLE_XLS",          defaultValue = 0 },
            XLS2         = { type = "int", tunable = "ENABLE_VEHICLE_XLS2",         defaultValue = 0 },
            ZType        = { type = "int", tunable = "ENABLE_VEHICLE_ZTYPE",        defaultValue = 0 },
            Zion         = { type = "int", tunable = "ENABLE_VEHICLE_ZION",         defaultValue = 0 },
            Zion2        = { type = "int", tunable = "ENABLE_VEHICLE_ZION2",        defaultValue = 0 },
            Zion3        = { type = "int", tunable = "ENABLE_VEHICLE_ZION3",        defaultValue = 0 },
            ZombieA      = { type = "int", tunable = "ENABLE_BIKER_ZOMBIEA",        defaultValue = 0 },
            Zorrusso     = { type = "int", tunable = "ENABLE_VEHICLE_ZORRUSSO",     defaultValue = 0 },
            Monster      = { type = "int", tunable = "ENABLE_VEHICLE_MONSTER",      defaultValue = 0 }
        }
    },
    World = {
        Casino = {
            Chips = {
                AcquireLimit          = { type = "int", tunable = "VC_CASINO_CHIP_MAX_BUY",           defaultValue = 20000 },
                AcquireLimitPenthouse = { type = "int", tunable = "VC_CASINO_CHIP_MAX_BUY_PENTHOUSE", defaultValue = 50000 }
            }
        },
        GunVan = {
            Weapon = {
                Slot1 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_0",     defaultValue = Utils.sJoaat("WEAPON_BAT") },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_0", defaultValue = 0.0                        }
                },
                Slot2 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_1",     defaultValue = Utils.sJoaat("WEAPON_KNFIE") },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_1", defaultValue = 0.0                          }
                },
                Slot3 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_2",     defaultValue = Utils.sJoaat("WEAPON_RAILGUNXM3") },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_2", defaultValue = 0.0                               }
                },
                Slot4 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_3",     defaultValue = Utils.sJoaat("WEAPON_MICROSMG") },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_3", defaultValue = 0.0                             }
                },
                Slot5 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_4",     defaultValue = Utils.sJoaat("WEAPON_PUMPSHOTGUN") },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_4", defaultValue = 0.0                                }
                },
                Slot6 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_5",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_5", defaultValue = 0.0 }
                },
                Slot7 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_6",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_6", defaultValue = 0.0 }
                },
                Slot8 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_7",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_7", defaultValue = 0.0 }
                },
                Slot9 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_8",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_8", defaultValue = 0.0 }
                },
                Slot10 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_WEAPON_TYPE_9",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_9", defaultValue = 0.0 }
                }
            },
            Throwable = {
                Slot1 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_THROWABLE_TYPE_0",     defaultValue = Utils.sJoaat("WEAPON_STICKYBOMB") },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_0", defaultValue = 0.0                               }
                },
                Slot2 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_THROWABLE_TYPE_1",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_1", defaultValue = 0.0 }
                },
                Slot3 = {
                    --Type     = { type = "int",   tunable = "XM22_GUN_VAN_SLOT_THROWABLE_TYPE_1",     defaultValue = 0   },
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_1", defaultValue = 0.0 }
                }
            },
            Armour = {
                Slot1 = {
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_0", defaultValue = 0.0 }
                },
                Slot2 = {
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_1", defaultValue = 0.0 }
                },
                Slot3 = {
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_2", defaultValue = 0.0 }
                },
                Slot4 = {
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_3", defaultValue = 0.0 }
                },
                Slot5 = {
                    --Discount = { type = "float", tunable = "XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_4", defaultValue = 0.0 }
                }
            },
            --MeleeSkins = { type = "int", tunable = 1490225691, defaultValue = 0 }
        },
        LSCarMeet = {
            XpMultiplier = {
                FirstTime = {
                    Bonus = {
                        Sprint          = { type = "float", tunable = "TUNER_SPRINT_FIRST_TIME_BONUS_XP_MULTIPLIER",           defaultValue = 1.0 },
                        Street          = { type = "float", tunable = "TUNER_STREET_FIRST_TIME_BONUS_XP_MULTIPLIER",           defaultValue = 1.0 },
                        Pursuit         = { type = "float", tunable = "TUNER_PURSUIT_FIRST_TIME_BONUS_XP_MULTIPLIER",          defaultValue = 1.0 },
                        Mod             = { type = "float", tunable = "TUNER_MOD_FIRST_TIME_BONUS_XP_MULTIPLIER",              defaultValue = 1.0 },
                        Sandbox         = { type = "float", tunable = "TUNER_SANDBOX_TEST_FIRST_TIME_BONUS_XP_MULTIPLIER",     defaultValue = 1.0 },
                        TimeTrial       = { type = "float", tunable = "TUNER_TIMETRIAL_FIRST_TIME_BONUS_XP_MULTIPLIER",        defaultValue = 1.0 },
                        Checkpoint      = { type = "float", tunable = "TUNER_CHECKPOINT_FIRST_TIME_BONUS_XP_MULTIPLIER",       defaultValue = 1.0 },
                        HeadToHead      = { type = "float", tunable = "TUNER_HEADTOHEAD_FIRST_TIME_BONUS_XP_MULTIPLIER",       defaultValue = 1.0 },
                        PrivateInstance = { type = "float", tunable = "TUNER_PRIVATE_INSTANCE_FIRST_TIME_BONUS_XP_MULTIPLIER", defaultValue = 1.0 }
                    },
                    Daily = {
                        CarClub         = { type = "float", tunable = "TUNER_CARCLUB_FIRST_TIME_DAILY_XP_MULTIPLIER",          defaultValue = 1.0 },
                        CarClubPv       = { type = "float", tunable = "TUNER_CARCLUB_PV_FIRST_TIME_DAILY_XP_MULTIPLIER",       defaultValue = 1.0 },
                        Sprint          = { type = "float", tunable = "TUNER_SPRINT_FIRST_TIME_DAILY_XP_MULTIPLIER",           defaultValue = 1.0 },
                        Street          = { type = "float", tunable = "TUNER_STREET_FIRST_TIME_DAILY_XP_MULTIPLIER",           defaultValue = 1.0 },
                        Pursuit         = { type = "float", tunable = "TUNER_PURSUIT_FIRST_TIME_DAILY_XP_MULTIPLIER",          defaultValue = 1.0 },
                        Mod             = { type = "float", tunable = "TUNER_MOD_FIRST_TIME_DAILY_XP_MULTIPLIER",              defaultValue = 1.0 },
                        Sandbox         = { type = "float", tunable = "TUNER_SANDBOX_TEST_FIRST_TIME_DAILY_XP_MULTIPLIERER",   defaultValue = 1.0 },
                        SandboxPv       = { type = "float", tunable = "TUNER_SANDBOX_PV_FIRST_TIME_DAILY_XP_MULTIPLIER",       defaultValue = 1.0 },
                        TimeTrial       = { type = "float", tunable = "TUNER_TIMETRIAL_FIRST_TIME_DAILY_XP_MULTIPLIER",        defaultValue = 1.0 },
                        Checkpoint      = { type = "float", tunable = "TUNER_CHECKPOINT_FIRST_TIME_DAILY_XP_MULTIPLIER",       defaultValue = 1.0 },
                        HeadToHead      = { type = "float", tunable = "TUNER_HEADTOHEAD_FIRST_TIME_DAILY_XP_MULTIPLIER",       defaultValue = 1.0 },
                        PrivateInstance = { type = "float", tunable = "TUNER_PRIVATE_INSTANCE_FIRST_TIME_DAILY_XP_MULTIPLIER", defaultValue = 1.0 }
                    }
                },
                Time = {
                    CarClub = { type = "float", tunable = "TUNER_CARCLUB_TIME_XP_MULTIPLIER", defaultValue = 1.0 },
                    Sandbox = { type = "float", tunable = "TUNER_SANDBOX_TIME_XP_MULTIPLIER", defaultValue = 1.0 },
                },
                Place = {
                    Sprint     = { type = "float", tunable = "TUNER_SPRINT_RACE_PLACE_XP_MULTIPLIER",     defaultValue = 1.0 },
                    Street     = { type = "float", tunable = "TUNER_STREET_RACE_PLACE_XP_MULTIPLIER",     defaultValue = 1.2 },
                    Pursuit    = { type = "float", tunable = "TUNER_PURSUIT_RACE_PLACE_XP_MULTIPLIER",    defaultValue = 1.2 },
                    Checkpoint = { type = "float", tunable = "TUNER_CHECKPOINT_RACE_PLACE_XP_MULTIPLIER", defaultValue = 1.0 },
                    HeadToHead = { type = "float", tunable = "TUNER_HEADTOHEAD_RACE_PLACE_XP_MULTIPLIER", defaultValue = 1.0 },
                },
                VisitsStreak  = { type = "float", tunable = "TUNER_CARCLUB_VISITS_STREAK_XP_MULTIPLIER", defaultValue = 1.0 },
                MerchPurchase = { type = "float", tunable = "TUNER_MERCH_PURCHASE_XP_MULTIPLIER",        defaultValue = 1.0 }
            }
        },
        Multiplier = {
            --Cash = { type = "float", tunable = "CASH_MULTIPLIER", defaultValue = 1.0 },
            --Xp   = { type = "float", tunable = "XP_MULTIPLIER",   defaultValue = 1.0 }
        }
    }
}
