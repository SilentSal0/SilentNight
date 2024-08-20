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
            Reload = { type = "int", global = 1928993                             },
            Jobs   = { type = "int", global = 1877285 + (PLAYER_ID * 77 + 1) + 76 }
        },
        CayoPerico = {
            Cut = {
                Player1 = { type = "int", global = 1971648 + 831 + 56 + 1 },
                Player2 = { type = "int", global = 1971648 + 831 + 56 + 2 },
                Player3 = { type = "int", global = 1971648 + 831 + 56 + 3 },
                Player4 = { type = "int", global = 1971648 + 831 + 56 + 4 }
            }
        },
        DiamondCasino = {
            Cut = {
                Player1 = { type = "int", global = 1964849 + 1497 + 736 + 92 + 1 },
                Player2 = { type = "int", global = 1964849 + 1497 + 736 + 92 + 2 },
                Player3 = { type = "int", global = 1964849 + 1497 + 736 + 92 + 3 },
                Player4 = { type = "int", global = 1964849 + 1497 + 736 + 92 + 4 }
            }
        },
        Doomsday = {
            Cut = {
                Player1 = { type = "int", global = 1960755 + 812 + 50 + 1 },
                Player2 = { type = "int", global = 1960755 + 812 + 50 + 2 },
                Player3 = { type = "int", global = 1960755 + 812 + 50 + 3 },
                Player4 = { type = "int", global = 1960755 + 812 + 50 + 4 }
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
    Vehicle = {
        Dripfeed = {
            Bypass          = { type = "int",  global = 2707347        },
            Envisage        = { type = "bool", global = 262145 + 35629 },
            EuroSX32        = { type = "bool", global = 262145 + 35630 },
            PolImpaler5     = { type = "bool", global = 262145 + 35631 },
            PolGreenwood    = { type = "bool", global = 262145 + 35632 },
            Pipistrello     = { type = "bool", global = 262145 + 35633 },
            PolImpaler6     = { type = "bool", global = 262145 + 35634 },
            Castigator      = { type = "bool", global = 262145 + 35635 },
            Dominator10     = { type = "bool", global = 262145 + 35636 },
            Vorschlaghammer = { type = "bool", global = 262145 + 35637 },
            Paragon3        = { type = "bool", global = 262145 + 35638 },
            PolDorado       = { type = "bool", global = 262145 + 35639 },
            PolDominator10  = { type = "bool", global = 262145 + 35640 },
            Niobe           = { type = "bool", global = 262145 + 35641 },
            Coquette5       = { type = "bool", global = 262145 + 35642 },
            Pizzaboy        = { type = "bool", global = 262145 + 35643 },
        },
        Removed = {
            Z190         = { type = "bool", global = 262145 + 22565 },
            Pfister811   = { type = "bool", global = 262145 + 14708 },
            Ninef        = { type = "bool", global = 262145 + 34371 },
            Ninef2       = { type = "bool", global = 262145 + 34373 },
            Akuma        = { type = "bool", global = 262145 + 34451 },
            Alpha        = { type = "bool", global = 262145 + 34349 },
            Asea         = { type = "bool", global = 262145 + 34527 },
            Asterope     = { type = "bool", global = 262145 + 34533 },
            Avarus       = { type = "bool", global = 262145 + 17355 },
            Bagger       = { type = "bool", global = 262145 + 17372 },
            Baller       = { type = "bool", global = 262145 + 34589 },
            Baller2      = { type = "bool", global = 262145 + 34413 },
            Baller3      = { type = "bool", global = 262145 + 34415 },
            Baller5      = { type = "bool", global = 262145 + 34417 },
            Bati2        = { type = "bool", global = 262145 + 34465 },
            Bjxl         = { type = "bool", global = 262145 + 34573 },
            Bfinjection  = { type = "bool", global = 262145 + 34499 },
            Bifta        = { type = "bool", global = 262145 + 34495 },
            Blade        = { type = "bool", global = 262145 + 34493 },
            Blazer       = { type = "bool", global = 262145 + 34511 },
            Blazer2      = { type = "bool", global = 262145 + 28191 },
            Bodhi2       = { type = "bool", global = 262145 + 34501 },
            Brawler      = { type = "bool", global = 262145 + 34333 },
            Buffalo      = { type = "bool", global = 262145 + 34551 },
            Buffalo2     = { type = "bool", global = 262145 + 34553 },
            Bullet       = { type = "bool", global = 262145 + 34409 },
            Carbonizzare = { type = "bool", global = 262145 + 34365 },
            Cavalcade    = { type = "bool", global = 262145 + 34569 },
            Cavalcade2   = { type = "bool", global = 262145 + 34571 },
            Cheburek     = { type = "bool", global = 262145 + 23726 },
            Cheetah      = { type = "bool", global = 262145 + 34401 },
            Cliffhanger  = { type = "bool", global = 262145 + 17230 },
            Clique       = { type = "bool", global = 262145 + 25367 },
            Cognoscenti  = { type = "bool", global = 262145 + 34335 },
            Cognoscenti2 = { type = "bool", global = 262145 + 34337 },
            Cog55        = { type = "bool", global = 262145 + 34339 },
            Cog552       = { type = "bool", global = 262145 + 34341 },
            Cogcabrio    = { type = "bool", global = 262145 + 34325 },
            Comet2       = { type = "bool", global = 262145 + 18947 },
            Comet3       = { type = "bool", global = 262145 + 18948 },
            Comet5       = { type = "bool", global = 262145 + 22564 },
            Contender    = { type = "bool", global = 262145 + 17229 },
            Coquette     = { type = "bool", global = 262145 + 34367 },
            Coquette3    = { type = "bool", global = 262145 + 34331 },
            Cyclone      = { type = "bool", global = 262145 + 21603 },
            Daemon2      = { type = "bool", global = 262145 + 17364 },
            Deviant      = { type = "bool", global = 262145 + 25369 },
            Dilettante   = { type = "bool", global = 262145 + 34431 },
            Double       = { type = "bool", global = 262145 + 34453 },
            Dune         = { type = "bool", global = 262145 + 34497 },
            Dynasty      = { type = "bool", global = 262145 + 25387 },
            Enduro       = { type = "bool", global = 262145 + 34455 },
            EntityXF     = { type = "bool", global = 262145 + 34403 },
            Esskey       = { type = "bool", global = 262145 + 17355 },
            Sheava       = { type = "bool", global = 262145 + 34399 },
            Exemplar     = { type = "bool", global = 262145 + 34323 },
            F620         = { type = "bool", global = 262145 + 34437 },
            Fagaloa      = { type = "bool", global = 262145 + 23717 },
            Faggio       = { type = "bool", global = 262145 + 17358 },
            Faggio3      = { type = "bool", global = 262145 + 17370 },
            Faggio2      = { type = "bool", global = 262145 + 34467 },
            Felon        = { type = "bool", global = 262145 + 34433 },
            Felon2       = { type = "bool", global = 262145 + 34435 },
            Feltzer2     = { type = "bool", global = 262145 + 34351 },
            FMJ          = { type = "bool", global = 262145 + 34411 },
            FQ2          = { type = "bool", global = 262145 + 34587 },
            BType2       = { type = "bool", global = 262145 + 34565 },
            Fugitive     = { type = "bool", global = 262145 + 34523 },
            FuroreGT     = { type = "bool", global = 262145 + 34369 },
            Fusilade     = { type = "bool", global = 262145 + 34563 },
            Futo         = { type = "bool", global = 262145 + 34559 },
            Gauntlet     = { type = "bool", global = 262145 + 34481 },
            GP1          = { type = "bool", global = 262145 + 19951 },
            Granger      = { type = "bool", global = 262145 + 34581 },
            Gresley      = { type = "bool", global = 262145 + 34577 },
            GT500        = { type = "bool", global = 262145 + 22556 },
            Habanero     = { type = "bool", global = 262145 + 34585 },
            Hakuchou     = { type = "bool", global = 262145 + 34473 },
            Hellion      = { type = "bool", global = 262145 + 25386 },
            Hermes       = { type = "bool", global = 262145 + 22563 },
            Hexer        = { type = "bool", global = 262145 + 34457 },
            Blazer3      = { type = "bool", global = 262145 + 34513 },
            Hustler      = { type = "bool", global = 262145 + 22557 },
            Imorgen      = { type = "bool", global = 262145 + 28201 },
            Infernus     = { type = "bool", global = 262145 + 34405 },
            Ingot        = { type = "bool", global = 262145 + 34541 },
            Innovation   = { type = "bool", global = 262145 + 34459 },
            Intruder     = { type = "bool", global = 262145 + 34535 },
            Issi2        = { type = "bool", global = 262145 + 34429 },
            Issi7        = { type = "bool", global = 262145 + 25383 },
            Jackal       = { type = "bool", global = 262145 + 34439 },
            JB700        = { type = "bool", global = 262145 + 34387 },
            Jester       = { type = "bool", global = 262145 + 34361 },
            Jester2      = { type = "bool", global = 262145 + 34557 },
            Kalahari     = { type = "bool", global = 262145 + 34503 },
            Landstalker  = { type = "bool", global = 262145 + 34583 },
            Landstalker2 = { type = "bool", global = 262145 + 28830 },
            Lguard       = { type = "bool", global = 262145 + 28190 },
            Locust       = { type = "bool", global = 262145 + 25379 },
            Lynx         = { type = "bool", global = 262145 + 17232 },
            Massacro     = { type = "bool", global = 262145 + 34353 },
            Massacro2    = { type = "bool", global = 262145 + 34555 },
            Mesa3        = { type = "bool", global = 262145 + 34597 },
            Michelli     = { type = "bool", global = 262145 + 23729 },
            Minivan      = { type = "bool", global = 262145 + 14703 },
            Nebula       = { type = "bool", global = 262145 + 25385 },
            Nemesis      = { type = "bool", global = 262145 + 34471 },
            Neo          = { type = "bool", global = 262145 + 25396 },
            Oracle       = { type = "bool", global = 262145 + 34443 },
            Oracle2      = { type = "bool", global = 262145 + 34441 },
            Paragon      = { type = "bool", global = 262145 + 25397 },
            Patriot      = { type = "bool", global = 262145 + 34591 },
            PCJ          = { type = "bool", global = 262145 + 34475 },
            Penumbra     = { type = "bool", global = 262145 + 34561 },
            Peyote2      = { type = "bool", global = 262145 + 25389 },
            Picador      = { type = "bool", global = 262145 + 34485 },
            Pigalle      = { type = "bool", global = 262145 + 34567 },
            Prairie      = { type = "bool", global = 262145 + 34427 },
            Premier      = { type = "bool", global = 262145 + 34529 },
            Radi         = { type = "bool", global = 262145 + 34595 },
            Raiden       = { type = "bool", global = 262145 + 22560 },
            RancherXL    = { type = "bool", global = 262145 + 34505 },
            RapidGT      = { type = "bool", global = 262145 + 34355 },
            RapidGT2     = { type = "bool", global = 262145 + 34357 },
            RapidGT3     = { type = "bool", global = 262145 + 21607 },
            Raptor       = { type = "bool", global = 262145 + 17363 },
            Ratbike      = { type = "bool", global = 262145 + 17373 },
            Ratloader    = { type = "bool", global = 262145 + 34483 },
            LE7B         = { type = "bool", global = 262145 + 17223 },
            Rebel2       = { type = "bool", global = 262145 + 34507 },
            Regina       = { type = "bool", global = 262145 + 34531 },
            Retinue      = { type = "bool", global = 262145 + 21606 },
            Revolter     = { type = "bool", global = 262145 + 22558 },
            Riata        = { type = "bool", global = 262145 + 22562 },
            Rocoto       = { type = "bool", global = 262145 + 34593 },
            Romero       = { type = "bool", global = 262145 + 34521 },
            BType        = { type = "bool", global = 262145 + 34377 },
            BType3       = { type = "bool", global = 262145 + 34393 },
            Ruffian      = { type = "bool", global = 262145 + 34469 },
            Ruiner       = { type = "bool", global = 262145 + 34489 },
            Ruston       = { type = "bool", global = 262145 + 19953 },
            Rebel        = { type = "bool", global = 262145 + 34509 },
            S80          = { type = "bool", global = 262145 + 25393 },
            Sanchez2     = { type = "bool", global = 262145 + 34463 },
            Sanchez      = { type = "bool", global = 262145 + 34461 },
            Sanctus      = { type = "bool", global = 262145 + 17366 },
            Sandking2    = { type = "bool", global = 262145 + 34515 },
            Savestra     = { type = "bool", global = 262145 + 22561 },
            SC1          = { type = "bool", global = 262145 + 22554 },
            Schafter2    = { type = "bool", global = 262145 + 34519 },
            Schafter4    = { type = "bool", global = 262145 + 34345 },
            Schafter6    = { type = "bool", global = 262145 + 34347 },
            Schwartzer   = { type = "bool", global = 262145 + 34547 },
            Seminole     = { type = "bool", global = 262145 + 34579 },
            Seminole2    = { type = "bool", global = 262145 + 28831 },
            Sentinel2    = { type = "bool", global = 262145 + 34445 },
            Serrano      = { type = "bool", global = 262145 + 34575 },
            Seven70      = { type = "bool", global = 262145 + 34359 },
            Sovereign    = { type = "bool", global = 262145 + 34479 },
            Stafford     = { type = "bool", global = 262145 + 23781 },
            Stanier      = { type = "bool", global = 262145 + 34539 },
            Stinger      = { type = "bool", global = 262145 + 34383 },
            StingerGT    = { type = "bool", global = 262145 + 34381 },
            Feltzer3     = { type = "bool", global = 262145 + 34379 },
            Stratum      = { type = "bool", global = 262145 + 34545 },
            Streiter     = { type = "bool", global = 262145 + 22551 },
            Superd       = { type = "bool", global = 262145 + 34343 },
            Surano       = { type = "bool", global = 262145 + 34549 },
            Surge        = { type = "bool", global = 262145 + 34525 },
            Swinger      = { type = "bool", global = 262145 + 23780 },
            Tailgater    = { type = "bool", global = 262145 + 34537 },
            Thrust       = { type = "bool", global = 262145 + 34327 },
            Tigon        = { type = "bool", global = 262145 + 29156 },
            Torero       = { type = "bool", global = 262145 + 20830 },
            Tornado6     = { type = "bool", global = 262145 + 17371 },
            Tulip        = { type = "bool", global = 262145 + 25370 },
            Tyrus        = { type = "bool", global = 262145 + 17221 },
            Vacca        = { type = "bool", global = 262145 + 34407 },
            Vader        = { type = "bool", global = 262145 + 34477 },
            Vamos        = { type = "bool", global = 262145 + 26330 },
            Verlierer2   = { type = "bool", global = 262145 + 34375 },
            Verus        = { type = "bool", global = 262145 + 29605 },
            Vigero       = { type = "bool", global = 262145 + 34487 },
            Viseris      = { type = "bool", global = 262145 + 22566 },
            Voltic       = { type = "bool", global = 262145 + 34397 },
            Warrener     = { type = "bool", global = 262145 + 34543 },
            Washington   = { type = "bool", global = 262145 + 34517 },
            Wolfsbane    = { type = "bool", global = 262145 + 17369 },
            XA21         = { type = "bool", global = 262145 + 20828 },
            XLS          = { type = "bool", global = 262145 + 34423 },
            XLS2         = { type = "bool", global = 262145 + 34425 },
            ZType        = { type = "bool", global = 262145 + 34395 },
            Zion         = { type = "bool", global = 262145 + 34447 },
            Zion2        = { type = "bool", global = 262145 + 34449 },
            Zion3        = { type = "bool", global = 262145 + 25384 },
            ZombieA      = { type = "bool", global = 262145 + 17354 },
            Zorrusso     = { type = "bool", global = 262145 + 25381 },
            Monster      = { type = "bool", global = 262145 + 34599 }
        }
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
