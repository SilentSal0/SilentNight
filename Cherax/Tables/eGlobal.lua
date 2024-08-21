eGlobal = {
    HAS_PARSED = false,
    Business = {
        Base = {
            OrbitalCannon = {
                Refund = { type = "int", global = 1962237 }
            }
        },
        Bunker = {
            Production = {
                Trigger1 = { type = "int",  global = 2707577 + 1 + 5 * 2     },
                Trigger2 = { type = "bool", global = 2707577 + 1 + 5 * 2 + 1 }
            },
            Multiplier = { type = "float", global = 262145 + 18875 }
        },
        CrateWarehouse = {
            Slot = { type = "int", global = 1845281 + 1 + (PLAYER_ID * 883) + 268 + 120 + 1 + (0 * 3) }
        },
        Nightclub = {
            Safe = {
                Income = {
                    Top5   = { type = "int", global = 262145 + 23657 },
                    Top100 = { type = "int", global = 262145 + 23676 }
                },
                Value = { type = "int", global = 1845281 + 1 + (PLAYER_ID * 883) + 268 + 358 + 5 },
            }
        },
        Supplies = {
            Cash      = { type = "int", global = 1663174 + 1 },
            Coke      = { type = "int", global = 1663174 + 2 },
            Weed      = { type = "int", global = 1663174 + 3 },
            Meth      = { type = "int", global = 1663174 + 4 },
            Documents = { type = "int", global = 1663174 + 5 },
            Bunker    = { type = "int", global = 1663174 + 6 },
            Acid      = { type = "int", global = 1663174 + 7 },
        }
    },
    Heist = {
        Generic = {
            Launch1 = { type = "int", global = 4718592 + 3526       },
            Launch2 = { type = "int", global = 4718592 + 3527       },
            Launch3 = { type = "int", global = 4718592 + 3259 + 1   },
            Launch4 = { type = "int", global = 4718592 + 178821 + 1 },
            Cut     = { type = "int", global = 2685444 + 6639       }
        },
        Apartment = {
            Cut = {
                Player1 = {
                    Global = { type = "int", global = 1928958 + 1 + 1    },
                    Local  = { type = "int", global = 1930926 + 3008 + 1 }
                },
                Player2 = {
                    Global = { type = "int", global = 1928958 + 1 + 2    },
                    Local  = { type = "int", global = 1930926 + 3008 + 2 }
                },
                Player3 = {
                    Global = { type = "int", global = 1928958 + 1 + 3    },
                    Local  = { type = "int", global = 1930926 + 3008 + 3 }
                },
                Player4 = {
                    Global = { type = "int", global = 1928958 + 1 + 4    },
                    Local  = { type = "int", global = 1930926 + 3008 + 4 }
                }
            },
            Ready  = { 
                Player1 = { type = "int", global = 2657971 + 1 + (0 * 465) + 267 },
                Player2 = { type = "int", global = 2657971 + 1 + (1 * 465) + 267 },
                Player3 = { type = "int", global = 2657971 + 1 + (2 * 465) + 267 },
                Player4 = { type = "int", global = 2657971 + 1 + (3 * 465) + 267 }
            },
            Reload = { type = "int", global = 1928993                             },
            Jobs   = { type = "int", global = 1877285 + (PLAYER_ID * 77 + 1) + 76 }
        },
        CayoPerico = {
            Cut = {
                Player1 = { type = "int", global = 1971648 + 831 + 56 + 1 },
                Player2 = { type = "int", global = 1971648 + 831 + 56 + 2 },
                Player3 = { type = "int", global = 1971648 + 831 + 56 + 3 },
                Player4 = { type = "int", global = 1971648 + 831 + 56 + 4 }
            },
            Ready  = { 
                Player1 = { type = "int", global = 1972761 + (0 * 27) + 7 + 1 },
                Player2 = { type = "int", global = 1972761 + (1 * 27) + 7 + 2 },
                Player3 = { type = "int", global = 1972761 + (2 * 27) + 7 + 3 },
                Player4 = { type = "int", global = 1972761 + (3 * 27) + 7 + 4 }
            }
        },
        DiamondCasino = {
            Cut = {
                Player1 = { type = "int", global = 1964849 + 1497 + 736 + 92 + 1 },
                Player2 = { type = "int", global = 1964849 + 1497 + 736 + 92 + 2 },
                Player3 = { type = "int", global = 1964849 + 1497 + 736 + 92 + 3 },
                Player4 = { type = "int", global = 1964849 + 1497 + 736 + 92 + 4 }
            },
            Ready  = { 
                Player1 = { type = "int", global = 1969213 + (0 * 68) + 7 + 1 },
                Player2 = { type = "int", global = 1969213 + (1 * 68) + 7 + 2 },
                Player3 = { type = "int", global = 1969213 + (2 * 68) + 7 + 3 },
                Player4 = { type = "int", global = 1969213 + (3 * 68) + 7 + 4 }
            }
        },
        Doomsday = {
            Cut = {
                Player1 = { type = "int", global = 1960755 + 812 + 50 + 1 },
                Player2 = { type = "int", global = 1960755 + 812 + 50 + 2 },
                Player3 = { type = "int", global = 1960755 + 812 + 50 + 3 },
                Player4 = { type = "int", global = 1960755 + 812 + 50 + 4 }
            },
            Ready  = { 
                Player1 = { type = "int", global = 1882633 + (0 * 146) + 43 + 11 + 1 },
                Player2 = { type = "int", global = 1882633 + (1 * 146) + 43 + 11 + 2 },
                Player3 = { type = "int", global = 1882633 + (2 * 146) + 43 + 11 + 3 },
                Player4 = { type = "int", global = 1882633 + (3 * 146) + 43 + 11 + 4 },
            }
        },
        SalvageYard = {
            Robbery = {
                Slot1 = {
                    Type = { type = "int", global = 262145 + 33023 + 1 }
                },
                Slot2 = {
                    Type = { type = "int", global = 262145 + 33023 + 2 }
                },
                Slot3 = {
                    Type = { type = "int", global = 262145 + 33023 + 3 }
                }
            },
            Vehicle = {
                Slot1 = {
                    Type    = { type = "int",  global = 262145 + 33031 + 1 },
                    Value   = { type = "int",  global = 262145 + 33035 + 1 },
                    CanKeep = { type = "bool", global = 262145 + 33027 + 1 }
                },
                Slot2 = {
                    Type    = { type = "int",  global = 262145 + 33031 + 2 },
                    Value   = { type = "int",  global = 262145 + 33035 + 2 },
                    CanKeep = { type = "bool", global = 262145 + 33027 + 2 }
                },
                Slot3 = {
                    Type    = { type = "int",  global = 262145 + 33031 + 3 },
                    Value   = { type = "int",  global = 262145 + 33035 + 3 },
                    CanKeep = { type = "bool", global = 262145 + 33027 + 3 }
                },
                SalvageValueMultiplier = { type = "float", global = 262145 + 33043 }
            }
        }
    },
    Player = {
        Cash = {
            Remove = { type = "int", global = 2707357 + 36 }
        },
        Collectible = {
            ActionFigures = { type = "int", global = 2708057 + 209 },
            LdOrganics    = { type = "int", global = 2708057 + 421 },
            PlayingCards  = { type = "int", global = 2708057 + 210 },
            SignalJammers = { type = "int", global = 2708057 + 211 },
            Snowmen       = { type = "int", global = 2708057 + 523 },
            MovieProps    = { type = "int", global = 2708057 + 418 },
            JackOLanterns = { type = "int", global = 2708057 + 514 }
        },
        Property = { type = "int", global = 2657971 + 1 + (PLAYER_ID * 465) + 322 + 8 }
    },
    Session = {
        Type   = { type = "int", global = 1575035     },
        Switch = { type = "int", global = 1574589     },
        Quit   = { type = "int", global = 1574589 + 2 }
    },
    World = {
        Casino = {
            Chips = {
                Bonus = { type = "int", global = 1964419 }
            }
        },
        GunVan = {
            Location = { type = "int", global = 2652592 + 2671 + 1 }
        },
        Multiplier = {
            Cash = { type = "float", global = 262145     },
            Xp   = { type = "float", global = 262145 + 1 }
        }
    }
}
