eLocal = {
    HAS_PARSED = false,
    Business = {
        Bunker = {
            Sell = {
                Finish = { type = "int", vLocal = 1211 + 774, script = "gb_gunrunning" }
            }
        },
        CrateWarehouse = {
            Buy = {
                Amount  = { type = "int", vLocal = 603 + 1,   script = "gb_contraband_buy" },
                Finish1 = { type = "int", vLocal = 603 + 5,   script = "gb_contraband_buy" },
                Finish2 = { type = "int", vLocal = 603 + 191, script = "gb_contraband_buy" },
                Finish3 = { type = "int", vLocal = 603 + 192, script = "gb_contraband_buy" }
            },
            Sell = {
                Type   = { type = "int", vLocal = 545 + 7, script = "gb_contraband_sell" },
                Finish = { type = "int", vLocal = 545 + 1, script = "gb_contraband_sell" }
            },
            Position = {
                X = { type = "int", vLocal = 758,     script = "appsecuroserv" },
                Y = { type = "int", vLocal = 758 + 1, script = "appsecuroserv" },
                Z = { type = "int", vLocal = 758 + 2, script = "appsecuroserv" }
            },
            Bitset   = { type = "int", vLocal = 561, script = "appsecuroserv" },
            Property = { type = "int", vLocal = 737, script = "appsecuroserv" }
        },
        Hangar = {
            Sell = {
                Delivered = { type = "int", vLocal = 1934 + 1078, script = "gb_smuggler" },
                Finish    = { type = "int", vLocal = 1934 + 768,  script = "gb_smuggler" }
            }
        },
        Nightclub = {
            Safe = {
                Collect = { type = "int", vLocal = 181 + 32 + 1, script = "am_mp_nightclub" }
            }
        }
    },
    Heist = {
        Generic = {
            Launch1 = { type = "int", vLocal = 19709 + 15, script = "fmmc_launcher" },
            Launch2 = { type = "int", vLocal = 19709 + 34, script = "fmmc_launcher" }
        },
        Agency = {
            Finish1 = { type = "int", vLocal = 38397, script = "fm_mission_controller" },
            Finish2 = { type = "int", vLocal = 39772, script = "fm_mission_controller" }
        },
        Apartment = {
            Bypass = {
                Fleeca = {
                    Hack  = { type = "int", vLocal = 11778 + 24, script = "fm_mission_controller" },
                    Drill = { type = "int", vLocal = 10069 + 11, script = "fm_mission_controller" }
                },
                Pacific = {
                    Hack = { type = "int", vLocal = 9775, script = "fm_mission_controller" }
                }
            },
            Finish1 = { type = "int", vLocal = 19746 + 1741,     script = "fm_mission_controller" },
            Finish2 = { type = "int", vLocal = 19746 + 2686,     script = "fm_mission_controller" },
            Finish3 = { type = "int", vLocal = 27489 + 859 + 18, script = "fm_mission_controller" },
            Finish4 = { type = "int", vLocal = 31621 + 69,       script = "fm_mission_controller" }
        },
        AutoShop = {
            Reload  = { type = "int", vLocal = 383,              script = "tuner_planning"             },
            Finish1 = { type = "int", vLocal = 50150 + 1,        script = "fm_mission_controller_2020" },
            Finish2 = { type = "int", vLocal = 50150 + 1770 + 1, script = "fm_mission_controller_2020" }
        },
        CayoPerico = {
            Bypass = {
                FingerprintHack = { type = "int",   vLocal = 24880,     script = "fm_mission_controller_2020" },
                PlasmaCutterCut = { type = "float", vLocal = 30939 + 3, script = "fm_mission_controller_2020" },
                DrainagePipeCut = { type = "int",   vLocal = 29700,     script = "fm_mission_controller_2020" },
            },
            Reload  = { type = "int", vLocal = 1546,             script = "heist_island_planning"      },
            Finish1 = { type = "int", vLocal = 50150,            script = "fm_mission_controller_2020" },
            Finish2 = { type = "int", vLocal = 50150 + 1770 + 1, script = "fm_mission_controller_2020" }
        },
        DiamondCasino = {
            Autograbber = {
                Grab  = { type =   "int", vLocal = 10255,      script = "fm_mission_controller" },
                Speed = { type = "float", vLocal = 10255 + 14, script = "fm_mission_controller" }
            },
            Bypass = {
                FingerprintHack = { type = "int", vLocal = 53019,      script = "fm_mission_controller" },
                KeypadHack      = { type = "int", vLocal = 54085,      script = "fm_mission_controller" },
                VaultDrill1     = { type = "int", vLocal = 10109 + 7,  script = "fm_mission_controller" },
                VaultDrill2     = { type = "int", vLocal = 10109 + 37, script = "fm_mission_controller" }
            },
            Reload = { type = "int", vLocal = 185, script = "gb_casino_heist_planning" }
        },
        Doomsday = {
            Bypass = {
                DataHack     = { type = "int", vLocal = 1514,       script = "fm_mission_controller" },
                DoomsdayHack = { type = "int", vLocal = 1271 + 135, script = "fm_mission_controller" }
            },
            Reload  = { type = "int", vLocal = 184,              script = "gb_gang_ops_planning"  },
            Finish1 = { type = "int", vLocal = 19746,            script = "fm_mission_controller" },
            Finish2 = { type = "int", vLocal = 19746 + 1741,     script = "fm_mission_controller" },
            Finish3 = { type = "int", vLocal = 27489 + 859 + 18, script = "fm_mission_controller" },
            Finish4 = { type = "int", vLocal = 31621 + 69,       script = "fm_mission_controller" },
            Finish5 = { type = "int", vLocal = 31621 + 97,       script = "fm_mission_controller" }
        },
        SalvageYard = {
            Reload = { type = "int", vLocal = 512, script = "vehrob_planning" }
        }
    },
    World = {
        AmmuNation = {
            Bypass = {
                Lock = { type = "int", vLocal = 142 + 747, script = "gunclub_shop" }
            }
        },
        Casino = {
            Blackjack = {
                Dealer = {
                    FirstCard  = { type = "int", vLocal = 116 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1776 + 1 + (PLAYER_ID * 8) + 4) * 13) + 1,  script = "blackjack" },
                    SecondCard = { type = "int", vLocal = 116 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1776 + 1 + (PLAYER_ID * 8) + 4) * 13) + 2,  script = "blackjack" },
                    ThirdCard  = { type = "int", vLocal = 116 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1776 + 1 + (PLAYER_ID * 8) + 4) * 13) + 3,  script = "blackjack" },
                },
                CurrentTable = { type = "int", vLocal = 1776 + 1 + (PLAYER_ID * 8) + 4,                                                                           script = "blackjack" },
                VisibleCards = { type = "int", vLocal = 116 + 846 + 1 + (ScriptLocal.GetInt(Utils.Joaat("blackjack"), 1776 + 1 + (PLAYER_ID * 8) + 4) * 13) + 12, script = "blackjack" }
            },
            LuckyWheel = {
                WinState    = { type = "int", vLocal = 280 + 14, script = "casino_lucky_wheel" },
                PrizeState  = { type = "int", vLocal = 280 + 45, script = "casino_lucky_wheel" }
            },
            Poker = {

                Table         = { type = "int", vLocal = 749,  script = "three_card_poker" },
                TableSize     = { type = "int", vLocal = 9,    script = "three_card_poker" },
                Cards         = { type = "int", vLocal = 116,  script = "three_card_poker" },
                CurrentDeck   = { type = "int", vLocal = 168,  script = "three_card_poker" },
                AntiCheat     = { type = "int", vLocal = 1038, script = "three_card_poker" },
                AntiCheatDeck = { type = "int", vLocal = 799,  script = "three_card_poker" },
                DeckSize      = { type = "int", vLocal = 55,   script = "three_card_poker" }
            },
            Roulette = {
                MasterTable   = { type = "int", vLocal = 124,  script = "casinoroulette" },
                OutcomesTable = { type = "int", vLocal = 1357, script = "casinoroulette" },
                BallTable     = { type = "int", vLocal = 153,  script = "casinoroulette" }
            },
            Slots = {
                RandomResultTable = { type = "int", vLocal = 1348, script = "casino_slots" }
            }
        }
    }
}
