-- Define MPX as a function that returns the appropriate prefix string
local function MPX()
    return "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR") .. "_"
end
-- Global Variables

-- Free Mode Global Variables
FMg = 262145 -- free mode global ("CASH_MULTIPLIER")
APg = FMg + 31084 -- agency payout global ("FIXER_FINALE_LEADER_CASH_REWARD")
XMg = FMg + 1 -- xp multiplier global ("XP_MULTIPLIER")
CSg1    = 1575035 						-- change session (type) 1 					// Guide:   NETWORK::UGC_SET_USING_OFFLINE_CONTENT(false);
CSg2    = 1574589 						-- change session (switch) 2 				// Guide:   MP_POST_MATCH_TRANSITION_SCENE
CSg3    = 1574589 + 2 					-- change session (quit) 3 					// Guide:   MP_POST_MATCH_TRANSITION_SCENE
-- Auto Shop variables
ASIFl1 = 50150 + 1 -- auto shop instant finish local 1 
ASIFl2 = 50150 + 1770 + 1 -- auto shop finish local 2 
ASRBl = 383 -- auto shop reload board local 
ASPg1 = FMg + 30338 + 1 -- auto shop payout global 1 ("TUNER_ROBBERY_LEADER_CASH_REWARD0")
ASPg2 = FMg + 30338 + 8 -- auto shop payout global 2 ("TUNER_ROBBERY_LEADER_CASH_REWARD7")
ASFg = FMg + 30334 -- auto shop fee global ("TUNER_ROBBERY_CONTACT_FEE")
ASCKg = FMg + 30357 -- auto shop cooldown global ("TUNER_ROBBERY_COOLDOWN_TIME")


-- Doomsday Heist Variables
DDSHl = 1271 + 135 -- doomsday doomsday scenario hack local
DCg1 = 1960755 + 812 + 50 + 1 -- doomsday player 1 cut global
DCg2 = 1960755 + 812 + 50 + 2 -- doomsday player 2 cut global
DCg3 = 1960755 + 812 + 50 + 3 -- doomsday player 3 cut global
DCg4 = 1960755 + 812 + 50 + 4 -- doomsday player 4 cut global
GCg = 2685249 + 6615 -- global cut global (value2 = value2 * (num / 100f);)

-- Cayo Perico Heist Variables
CPRSl = 1546 -- cayo perico reload screen local 
CPCg1 = 1971648 + 831 + 56 + 1 -- cayo perico player 1 cut global
CPCg2 = 1971648 + 831 + 56 + 2 -- cayo perico player 2 cut global
CPCg3 = 1971648 + 831 + 56 + 3 -- cayo perico player 3 cut global
CPCg4 = 1971648 + 831 + 56 + 4 -- cayo perico player 4 cut global
CPBg = FMg + 29211
CPFHl = 24880  -- cayo perico fingerprint hack local 
CPPCCl = 30939 + 3 -- cayo perico plasma cutter cut local ("DLC_H4_anims_glass_cutter_Sounds") 
CPSTCl = 29700 -- cayo perico drainage pipe cut local

-- Apartment Heist Variables
ACg1 = 1928958 + 1 + 1 -- global apartment player 1 cut global
ACg2 = 1928958 + 1 + 2 -- global apartment player 2 cut global
ACg3 = 1928958 + 1 + 3 -- global apartment player 3 cut global
ACg4 = 1928958 + 1 + 4 -- global apartment player 4 cut global
ACg5 = 1930926 + 3008 + 1 -- local apartment player 1 cut global
AUAJg1 = FMg + 9101 -- apartment unlock all jobs global 1 ("ROOT_ID_HASH_THE_FLECCA_JOB")
AUAJg2 = FMg + 9106 -- apartment unlock all jobs global 2 ("ROOT_ID_HASH_THE_PRISON_BREAK")
AUAJg3 = FMg + 9113 -- apartment unlock all jobs global 3 ("ROOT_ID_HASH_THE_HUMANE_LABS_RAID")
AUAJg4 = FMg + 9119 -- apartment unlock all jobs global 4 ("ROOT_ID_HASH_SERIES_A_FUNDING")
AUAJg5 = FMg + 9125 -- apartment unlock all jobs global 5 ("ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB")
AIFl3 = 19746 -- apartment instant finish local 1
AIFl4 = 28365 + 1 -- apartment instant finish local 2
AIFl5 = 31621 + 69 -- apartment instant finish local 3
AFHl = 11778 + 24 -- apartment fleeca hack local 
AFDl = 10069 + 11 -- apartment fleeca drill local

-- Diamond Casino Heist Variables
DCRBl = 185 -- diamond casino reload board local
DCCg1 = 1964849 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global
DCCg2 = 1964849 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global
DCCg3 = 1964849 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global
DCCg4 = 1964849 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global
DCCl = FMg +28313  -- Casino_Cut_Lester_offset
DCCh = FMg+28349-1 --Casino_Cut_Hacker_offset
DCCd = FMg+28344-1 --Casino_Cut_Driver_offset
DCCgun = FMg + 28339-1 --Casino_Cut_Gunman_offset
DCFHl = 53019      -- diamond casino fingerprint hack local
DCKHl = 54085      -- diamond casino keypad hack local
DCDVDl1 = 10109 + 7 -- diamond casino drill vault door local 1
DCDVDl2 = 10109 + 37 -- diamond casino drill vault door local 2

-- Bunker Variables
BUCg1 = FMg + 21018 -- bunker unlocker cooldown global 1 (946764522)
BUCg2 = FMg + 21264 -- bunker unlocker cooldown global 2 ("GR_RESEARCH_CAPACITY")
BUCg3 = FMg + 21265 -- bunker unlocker cooldown global 3 ("GR_RESEARCH_PRODUCTION_TIME")
BUCg4 = FMg + 21266 -- bunker unlocker cooldown global 4 ("GR_RESEARCH_UPGRADE_EQUIPMENT_REDUCTION_TIME")
BUAg1 = FMg + 21268 -- bunker unlocker additional global 1 (1485279815)
BUAg2 = FMg + 21269 -- bunker unlocker additional global 2 (2041812011)
GSIg = 1663174 		-- get supplies instantly global ("OR_PSUP_DEL)
BCISl = 1211 + 774 	-- bunker crash instant sell local
BCFp1 = FMg + 32359 -- bunker fast production (ENABLE_CONTROL_SUPPLY_GUNRUNNINGBUNKER_CARGO)
BCFp2 = FMg + 21249 -- bunker fast production (GR_MANU_PRODUCTION_TIME)
BCFp3 = FMg + 32366 -- bunker fast production (SPEED_SUPPLY_GUNRUNNINGBUNKER_CARGO)


-- Hangar Variables
HCVPg = FMg + 22492 -- hangar cargo vip payout global (-954321460)
HCVRCg = FMg + 22475 -- hangar cargo vip ron's cut (1232447926)
HCVISl1 = 1934 + 1078 -- hangar cargo vip instant sell local 1
HCVISl2 = 1934 + 768 -- hangar cargo vip instant sell local 2

-- Nightclub Variables
NHCNSg = FMg + 23969 -- nightclub helper cargo n shipments global (1162393585)
NHSGg = FMg + 23963 -- nightclub helper sporting goods global (-1523050891)
NHSAIg = FMg + 23964 -- nightclub helper s.a. imports global (147773667)
NHPRg = FMg + 24595 -- nightclub helper pharmaceutical reseacrh global (-1188700671)
NHOPg = FMg + 23965 -- nightclub helper organic produce global (-1188963032)
NHPNCg = FMg + 23967 -- nightclub helper printing n copying global (967514627)
NHCCg = FMg + 23968 -- nightclub helper cash creation global (1983962738)
NHCKg1 = FMg + 24026 -- nightclub helper cooldown killer global 1 (1763921019)
NHCKg2 = FMg + 24067 -- nightclub helper cooldown killer global 2 (-1004589438)
NHCKg3 = FMg + 24068 -- nightclub helper cooldown killer global 3 (464940095)
NLSCg = FMg + 23680 -- night loop safe capacity global ("NIGHTCLUBMAXSAFEVALUE")
NLISg = FMg + 23657 -- night loop income start global ("NIGHTCLUBINCOMEUPTOPOP5")
NLIEg = FMg + 23676 -- night loop income end global ("NIGHTCLUBINCOMEUPTOPOP100")
NLCl = 181 + 32 + 1 -- night loop collect local

-- Special Cargo Variables
SCVPg = FMg + 15732 	-- special cargo vip price global ("EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1")
SCVCKg1 = FMg + 15499 	-- special cargo vip cooldown global 1 ("EXEC_BUY_COOLDOWN")
SCVCKg2 = FMg + 15500 	-- special cargo vip cooldown global 2 ("EXEC_SELL_COOLDOWN")
SCVMTl = 545 + 7 		-- special cargo vip mission type local
SCVISl = 545 + 1 		-- special cargo vip instant sell local


-- Dripfeed Vehicles Variables
EDVg1 = FMg + 35629 -- enable dripfeed vehicles global 1 ("ENABLE_VEHICLE_ENVISAGE")
EDVg2 = FMg + 35630 -- enable dripfeed vehicles global 2 ("ENABLE_VEHICLE_EUROSX32")
EDVg3 = FMg + 35631 -- enable dripfeed vehicles global 3 ("ENABLE_VEHICLE_POLIMPALER5")
EDVg4 = FMg + 35632 -- enable dripfeed vehicles global 4 ("ENABLE_VEHICLE_POLGREENWOOD")
BEDVg5 = 2707347 -- enable dripfeed vehicles global 5 ("Bypass")
EDVg5 = FMg + 35633 -- enable dripfeed vehicles global 6 ("ENABLE_VEHICLE_PIPISTRELLO")
EDVg6 = FMg + 35634 -- enable dripfeed vehicles global 6 ("ENABLE_VEHICLE_POLIMPALER6")
EDVg7 = FMg + 35635 -- enable dripfeed vehicles global 7 ("ENABLE_VEHICLE_CASTIGATOR")
EDVg8 = FMg + 35636 -- enable dripfeed vehicles global 8 ("ENABLE_VEHICLE_DOMINATOR10")
EDVg9 = FMg + 35637 -- enable dripfeed vehicles global 9 ("ENABLE_VEHICLE_VORSCHLAGHAMMER")
EDVg10 = FMg + 35638 -- enable dripfeed vehicles global 10 ("ENABLE_VEHICLE_PARAGON3")
EDVg11 = FMg + 35639 -- enable dripfeed vehicles global 11 ("ENABLE_VEHICLE_POLDORADO")
EDVg12 = FMg + 35640 -- enable dripfeed vehicles global 12 ("ENABLE_VEHICLE_POLDOMINATOR10")
EDVg13 = FMg + 35641 -- enable dripfeed vehicles global 13 ("ENABLE_VEHICLE_NIOBE")
EDVg14 = FMg + 35642 -- enable dripfeed vehicles global 14 ("ENABLE_VEHICLE_COQUETTE5")
EDVg15 = FMg + 35643 -- enable dripfeed vehicles global 15 ("ENABLE_VEHICLE_PIZZABOY")
EVg1 = FMg + 34323 -- enables dripfeed vehicles ("ENABLE_VEHICLE_EXEMPLAR")

-- MC Business Variables
MCPwv = FMg + 17323   --  price of weed ("BIKER_WEED_PRODUCT_VALUE")
MCPmV = FMg + 17322   --  price of meth ("BIKER_METH_PRODUCT_VALUE")
MCPcockV = FMg + 17321   --  price of cocaine ("BIKER_CRACK_PRODUCT_VALUE")
MCPcashV = FMg + 17320   --  price of cash ("BIKER_COUNTERCASH_PRODUCT_VALUE")
MCPfakeV = FMg + 17319   --  price of fake ID ("BIKER_FAKEIDS_PRODUCT_VALUE")
MCPacidV = FMg + 17324   --  price of acid ("BIKER_ACID_PRODUCT_VALUE")

-- Collectibles Variables
CUg = 2708057 -- collectibles unlocker global ("cellphone_badger")
SJo = 211 -- signal jammers offset

-- Salvage Yard Variables
SYVVg = FMg + 33035 -- salvage yard vehicle value global ("SALV23_VEHICLE_ROBBERY_VALUE_0")
SYCKg = FMg + 33027 -- salvage yard can keep global ("SALV23_VEHICLE_ROBBERY_CAN_KEEP_0")
SYCg1 = FMg + 33064 --  salvage yard cooldown global ("SALV23_VEH_ROB_COOLDOWN_TIME")
SYCg2 = FMg + 3306 --  salvage yard cooldown global ("SALV23_CFR_COOLDOWN_TIME")
--GUN VAN VARIABLES
GVADg = FMg + 33303
GVWDg = FMg + 33284
GVTDg = FMg + 33295




-- Required Functions --

local function MoneyFormatter(n)
	n = tostring(n)
	return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

	stat_ranges = {
		{stat = "PSTAT_BOOL", start = 0, finish = 191},
		{stat = "???", start = 192, finish = 512},
		{stat = "MP_PSTAT_BOOL", start = 513, finish = 704},
		{stat = "???", start = 705, finish = 2918},
		{stat = "MP_TUPSTAT_BOOL", start = 2919, finish = 3110},
		{stat = "TUPSTAT_BOOL", start = 3111, finish = 3878},
		{stat = "???", start = 3879, finish = 4206},
		{stat = "NGPSTAT_BOOL", start = 4207, finish = 4334},
		{stat = "MP_NGPSTAT_BOOL", start = 4335, finish = 4398},
		{stat = "???", start = 4399, finish = 6028},
		{stat = "NGTATPSTAT_BOOL", start = 6029, finish = 6412},
		{stat = "???", start = 6413, finish = 7320},
		{stat = "MP_NGDLCPSTAT_BOOL", start = 7321, finish = 7384},
		{stat = "NGDLCPSTAT_BOOL", start = 7385, finish = 7640},
		{stat = "???", start = 7641, finish = 9360},
		{stat = "DLCBIKEPSTAT_BOOL", start = 9361, finish = 9552},
		{stat = "???", start = 9553, finish = 15368},
		{stat = "DLCGUNPSTAT_BOOL", start = 15369, finish = 15560},
		{stat = "???", start = 15561, finish = 15561},
		{stat = "GUNTATPSTAT_BOOL", start = 15562, finish = 15945},
		{stat = "DLCSMUGCHARPSTAT_BOOL", start = 15946, finish = 16009},
		{stat = "???", start = 16010, finish = 18097},
		{stat = "GANGOPSPSTAT_BOOL", start = 18098, finish = 18161},
		{stat = "???", start = 18162, finish = 22065},
		{stat = "BUSINESSBATPSTAT_BOOL", start = 22066, finish = 22193},
		{stat = "???", start = 22194, finish = 24961},
		{stat = "ARENAWARSPSTAT_BOOL", start = 24962, finish = 25537},
		{stat = "???", start = 25538, finish = 26809},
		{stat = "CASINOPSTAT_BOOL", start = 26810, finish = 27257},
		{stat = "???", start = 27256, finish = 28097},
		{stat = "CASINOHSTPSTAT_BOOL", start = 28098, finish = 28353},
		{stat = "???", start = 28354, finish = 28354},
		{stat = "HEIST3TATTOOSTAT_BOOL", start = 28355, finish = 28482},
		{stat = "???", start = 28483, finish = 30226},
		{stat = "SU20PSTAT_BOOL", start = 30227, finish = 30354},
		{stat = "SU20TATTOOSTAT_BOOL", start = 30355, finish = 30482},
		{stat = "???", start = 30483, finish = 30514},
		{stat = "HISLANDPSTAT_BOOL", start = 30515, finish = 30706},
		{stat = "???", start = 30707, finish = 31706},
		{stat = "TUNERPSTAT_BOOL", start = 31707, finish = 32282},
		{stat = "FIXERPSTAT_BOOL", start = 32283, finish = 32410},
		{stat = "FIXERTATTOOSTAT_BOOL", start = 32411, finish = 32474},
		{stat = "???", start = 32475, finish = 34122},
		{stat = "GEN9PSTAT_BOOL", start = 34123, finish = 34250},
		{stat = "DLC12022PSTAT_BOOL", start = 34251, finish = 34762},
		{stat = "???", start = 34763, finish = 36626},
		{stat = "DLC22022PSTAT_BOOL", start = 36627, finish = 36946},
		{stat = "???", start = 36947, finish = 41250},
		{stat = "DLC22022TATTOOSTAT_BOOL", start = 41251, finish = 41314},
		{stat = "DLC12023PSTAT_BOOL", start = 41315, finish = 42082},
		{stat = "???", start = 42083, finish = 42106},
		{stat = "DLC22023PSTAT_BOOL", start = 42107, finish = 42298},
		{stat = "???", start = 42299, finish = 51058},
		{stat = "DLC22023TATTOOSTAT_BOOL", start = 51059, finish = 51186}
	}

local function stats_set_packed_bools(packed_bool_start, packed_bool_finish, bool)
	for i = packed_bool_start, packed_bool_finish do
		stats.set_packed_stat_bool(i, bool)
	end
end

local function changeSession(session)
	globals.set_int(CSg1, session)
	if session == -1 then
		globals.set_int(CSg3, -1)
	end
	sleep(0.5)
	globals.set_int(CSg2, 1)
	sleep(0.5)
	globals.set_int(CSg2, 0)
end
local function globals_set_ints(global_start, global_finish, step, value)
	for i = global_start, global_finish, step do
		globals.set_int(i, value)
	end
end

local function null() end



-- Silent Night Tab
Silent = gui.get_tab("Silent Night 1.69")
Silent:add_text("Silent Night 1.69")
Silent:add_text("YOUR RP LEVEL IS " .. stats.get_int(joaat(MPX() .. "CHAR_RANK_FM")))
Silent:add_text("YOUR CREW RANK IS " .. stats.get_int(joaat("MPPLY_CURRENT_CREW_RANK")))

-- Stat  Editor --
local rp = {    
    0,
    800,
    2100,
    3800,
    6100,
    9500,
    12500,
    16000,
    19800,
    24000,
    28500,
    33400,
    38700,
    44200,
    50200,
    56400,
    63000,
    69900,
    77100,
    84700,
    92500,
    100700,
    109200,
    118000,
    127100,
    136500,
    146200,
    156200,
    166500,
    177100,
    188000,
    199200,
    210700,
    222400,
    234500,
    246800,
    259400,
    272300,
    285500,
    299000,
    312700,
    326800,
    341000,
    355600,
    370500,
    385600,
    401000,
    416600,
    432600,
    448800,
    465200,
    482000,
    499000,
    516300,
    533800,
    551600,
    569600,
    588000,
    606500,
    625400,
    644500,
    663800,
    683400,
    703300,
    723400,
    743800,
    764500,
    785400,
    806500,
    827900,
    849600,
    871500,
    893600,
    916000,
    938700,
    961600,
    984700,
    1008100,
    1031800,
    1055700,
    1079800,
    1104200,
    1128800,
    1153700,
    1178800,
    1204200,
    1229800,
    1255600,
    1281700,
    1308100,
    1334600,
    1361400,
    1388500,
    1415800,
    1443300,
    1471100,
    1499100,
    1527300,
}

local Manager = Silent:add_tab("Player Manager")
local player = Manager:add_tab("Player Rank")
player:add_text("Your current Rank is ".. stats.get_int(joaat(MPX() .. "CHAR_RANK_FM")))
local globalFix = player:add_checkbox("Fix Global Rank")
local rpLevel = player:add_input_int("Rank")
player:add_button("Set Rank",
function ()
	if rpLevel:get_value() > 8000 or rpLevel:get_value() < 0 then
		gui.show_message("ERROR", "YOUR RP LEVEL ".. rpLevel:get_value().." CANNOT BE SET BECAUSE IT IS ABOVE/BELOW LIMIT")
	else
		if rpLevel:get_value() >= 98 then
			STATS.STAT_SET_INT(joaat(MPX() .. "CHAR_SET_RP_GIFT_ADMIN"), 25 * (rpLevel:get_value() ^ 2) + 23575 * rpLevel:get_value() - 1023150, true)
			gui.show_message("Rank CORRECTION", "YOUR RANK WAS SET TO "..rpLevel:get_value()..", CHANGING SESSION...")
			changeSession(8)
		else
			STATS.STAT_SET_INT(joaat(MPX() .. "CHAR_SET_RP_GIFT_ADMIN"), rp[rpLevel:get_value()], true)
			changeSession(8)
		end
	end

	if globalFix:is_enabled() then
		stats.set_int("MPPLY_GLOBALXP", rp[rpLevel:get_value()])
	end
end)
local crew = Manager:add_tab("Crew Rank")
crew:add_text("Your current Crew Rank is ".. stats.get_int(joaat("MPPLY_CURRENT_CREW_RANK")))
local level = crew:add_input_int("Rank")
crew:add_button("Set Rank",
function()
	if not (level:get_value() > 0 and level:get_value() <= 8000) then
		gui.show_message("ERROR", "YOUR RP LEVEL ".. level:get_value() .. " CANNOT BE SET BECAUSE IT IS ABOVE LIMIT")
	else
		for i = 0, 4 do
			stats.set_int("MPPLY_CREW_LOCAL_XP_" .. i, ranks[level:get_value()])
		end
		gui.show_message("CREW RANK HAS BEEN SET TO " .. ranks[level:get_value()] .. " SUCCESSFULY", "CHANGING SESSION TO GET THE CREW RANK")
		changeSession(8)
	end
end)
local skills = Manager:add_tab("Skills")
skills:add_button("Max Player Skills",
function ()
	stats.set_int(MPX() .. "SCRIPT_INCREASE_DRIV", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_FLY", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_LUNG", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_SHO", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STAM", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STL", 100)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STRN", 100)
end)
skills:add_sameline()
skills:add_button("Reset Player Skills",
function ()
	stats.set_int(MPX() .. "SCRIPT_INCREASE_DRIV", 0)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_FLY", 0)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_LUNG", 0)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_SHO", 0)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STAM", 0)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STL", 0)
	stats.set_int(MPX() .. "SCRIPT_INCREASE_STRN", 0)
end)



-- Heist Editor tab
Heist_Editor = Silent:add_tab("Heist Editor")

-- Agency tab

local contract_id = {3, 4, 12, 28, 60, 124, 252, 508, 2044, 4095, -1}
local CONTRACT_ID = {
    NIGHTCLUB_LEAK = 3,
    HIGH_SOCIETY_LEAK = 4,
    SOUTH_CENTRAL_LEAK = 10,
    DONT_FUCK_WITH_DRE = 11
}
local function setAgencyContract(contractId)
    stats.set_int(MPX() .. "FIXER_STORY_BS", contract_id[contractId])
end
local Agency = Heist_Editor:add_tab("Agency")

Agency:add_button("Nightclub Leak", function() setAgencyContract(CONTRACT_ID.NIGHTCLUB_LEAK) end)
Agency:add_sameline()
Agency:add_button("High Society Leak", function() setAgencyContract(CONTRACT_ID.HIGH_SOCIETY_LEAK) end)
Agency:add_sameline()
Agency:add_button("South Central Leak", function() setAgencyContract(CONTRACT_ID.SOUTH_CENTRAL_LEAK) end)
Agency:add_sameline()
Agency:add_button("Don't Fuck With Dre", function() setAgencyContract(CONTRACT_ID.DONT_FUCK_WITH_DRE) end)
Agency:add_button("Complete Preps",
    function()
        stats.set_int(MPX() .. "FIXER_GENERAL_BS", -1)
        stats.set_int(MPX() .. "FIXER_COMPLETED_BS", -1)
        stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", -1)
    end)
Agency:add_separator()
Agency:add_text("Money")
local agencySafe = Agency:add_checkbox("Agency Safe Loop")
script.register_looped("agencyloop", function(script)
    script:yield()
    if agencySafe:is_enabled() == true then
        gui.show_message("Business Manager", "Supplying Agency Safe with money")
        STATS.STAT_SET_INT(joaat(MPX() .. "FIXER_COUNT"), 500, true)
        STATS.STAT_SET_INT(joaat(MPX() .. "FIXER_PASSIVE_PAY_TIME_LEFT"), -1, true)
        script:sleep(500)
    end
end)
Agency:add_separator()
Agency:add_text("Payouts:")
Agency:add_text("Set The Payout After The final mission starts:")
Agency:add_button("Max Payout", function() globals.set_int(APg, 2500000) end)
Agency:add_text("")
Agency:add_text("Custom Payout:")
local agencyPayout = Agency:add_input_int("Payout")
Agency:add_button("Set Payout", function() globals.set_int(APg, agencyPayout:get_value()) end)
Agency:add_separator()
Agency:add_text("After All choices and pressing Complete Preps wait for sometime")

-- Autoshop tab
local Autoshop = Heist_Editor:add_tab("Autoshop")
Autoshop:add_text("Missions")

-- Define a function to set the contract index
local function setContractIndex(index)
  stats.set_int(MPX() .. "TUNER_CURRENT", index - 1)
end

-- Create a table to store contract data
local contracts = {
  { name = "Union Repository", index = 1 },
  { name = "The Superdollar Deal", index = 2 },
  { name = "The Bank Contract", index = 3 },
  { name = "The ECU Job", index = 4 },
  { name = "The Prison Contract", index = 5 },
  { name = "The Agency Deal", index = 6 },
  { name = "The Lost Contract", index = 7 },
  { name = "The Data Contract", index = 8 },
}

-- Loop through the contracts table to create buttons
for _, contract in ipairs(contracts) do
	
  Autoshop:add_button(contract.name, function()
    setContractIndex(contract.index)
  end)
  if contract.index ~= 4 then
		Autoshop:add_sameline()
  end
end

-- Complete Preps button
Autoshop:add_button("Complete Preps", function()
  script.run_in_fiber(function(script)
    local currentMission = stats.get_int(MPX() .. "TUNER_CURRENT")
    local prepValue = currentMission == 1 and 4351 or 12543
    stats.set_int(MPX() .. "TUNER_GEN_BS", prepValue)
    script:sleep(1000)
    locals.set_int("tuner_planning", ASRBl, 2) 
  end)
end)
Autoshop:add_separator()
Autoshop:add_text("Reload Planning")
Autoshop:add_button("Reload Planning",
function ()
	locals.set_int("tuner_planning", ASRBl, 2)
end
)
Autoshop:add_separator()
Autoshop:add_text("Payouts:")
Autoshop:add_button("Max Payout",
function()
	globals.set_float(ASFg, 0)
	for i = ASPg1, ASPg2 do
		globals.set_int(i, 2000000)
	end
end)
Autoshop:add_text("Custom Payout:")
local autoshopPayout = Autoshop:add_input_int("Payout")
Autoshop:add_button("Set Payout",
function ()
	globals.set_float(ASFg, 0)
	for i = ASPg1, ASPg2 do
		globals.set_int(i, autoshopPayout:get_value())
	end
end)
Autoshop:add_separator()
Autoshop:add_text("Instant Finish")
Autoshop:add_button("Instant Finish",
function ()
	locals.set_int("fm_mission_controller_2020", ASIFl1, 51338977)
	locals.set_int("fm_mission_controller_2020", ASIFl2, 101)
end
)

-- Salvage Yard --
local function set_all_vehicles_available()
    for i = 1, 3 do
        stats.set_int(MPX() .. "SALV23_VEHROB_STATUS" .. (i - 1), 0)
    end
end
local function YardPrepsSetter(value)
	stats.set_int(MPX() .. "SALV23_GEN_BS", value)
	stats.set_int(MPX() .. "SALV23_SCOPE_BS", value)
	stats.set_int(MPX() .. "SALV23_FM_PROG", value)
	stats.set_int(MPX() .. "SALV23_INST_PROG", value)
end

local availablity1 = 0
local availablity2 = 0
local availablity3 = 0
local claims = {
	"Unclaimable",
	"Claimable"
}
local vehicles = {
	"First Vehicle",
	"Second Vehicle",
	"Third Vehicle"
}
local salPrice = 0
local salvalues = {
	{ id = 1, name="First Vehicle"},
	{ id = 2, name="Second Vehicle"},
	{ id = 3, name="Third Vehicle"}
}
local vehicle = 0
local Salvage = Heist_Editor:add_tab("Salvage Yard")
Salvage:add_text("Alter Vehicle Cost")
Salvage:add_text("")
Salvage:add_text("Set Vehicle value to $600,000 | Safe")
for _, salvalue in ipairs(salvalues) do
	Salvage:add_button(salvalue.name,
	function ()
		globals.set_int(SYVVg + salvalue.id, 600000)
	end)
	Salvage:add_sameline()
end
Salvage:add_imgui(
	function ()
		ImGui.Text("Custom Vehicle Value")
		salPrice = ImGui.InputInt("Price", salPrice)
		vehicle = ImGui.Combo("Vehicle", vehicle, vehicles, 3)
		if ImGui.Button("Set Vehicle Value") then
			globals.set_int(SYVVg + vehicle + 1, salPrice)
		end
		ImGui.Text("Set Availibility Status")
		ImGui.SetNextItemWidth(160)
		availablity1 = ImGui.Combo("", availablity1, claims, 2)
		ImGui.SameLine()
		ImGui.SetNextItemWidth(160)
		ImGui.SameLine()
		availablity2 = ImGui.Combo("  ", availablity2, claims, 2)
		ImGui.SameLine()
		ImGui.SetNextItemWidth(160)
		availablity3 = ImGui.Combo("   ", availablity3, claims, 2)
		if ImGui.Button("Set Claimability") then
			globals.set_int(SYCKg + 1, availablity1)
			globals.set_int(SYCKg + 2, availablity2)
			globals.set_int(SYCKg + 3, availablity3)
		end
	end
)
Salvage:add_separator()
Salvage:add_text("Set All vehicles as available")
Salvage:add_button("Set all vehicles as available", function() set_all_vehicles_available() end)
Salvage:add_text("Complete Preps")
Salvage:add_button("Complete Preps", function() YardPrepsSetter(-1) end)
Salvage:add_separator()
Salvage:add_text("Reset preps")
Salvage:add_button("Reset Preps", function() YardPrepsSetter(0) end)
Salvage:add_separator()
Salvage:add_text("Others")
Salvage:add_button("Kill Cooldown",
function()
	for i = SYCg1, SYCg2 do
		globals.set_int(i, 0)
	end
end)
Salvage:add_sameline()
Salvage:add_button("Reload Planning",
function()
	locals.set_int("vehrob_planning",512,2)
end)



-- Cluckin Bell --
local cluckperps = {
	{ id = 0 , name = "Slush Fund"},
	{ id = 1 , name = "Breaking and Entering"},
	{ id = 3 , name = "Concealed Rewards"},
	{ id = 7 , name = "Hit And Run"},
	{ id = 15, name = "Disorganized Crime"},
	{ id = 31, name = "Scene of Crime"}
}

local Cluck = Heist_Editor:add_tab("Cluckin Bell Heist")

Cluck:add_text("Complete Preps")

for _,cluckprep in ipairs(cluckperps) do
	Cluck:add_button(cluckprep.name,
	function ()
		stats.set_int(MPX() .. "SALV23_INST_PROG", cluckprep.id)
	end)
	Cluck:add_sameline()
end
Cluck:add_separator()
Cluck:add_text("Reset preps")
Cluck:add_button("Reset Preps",
function ()
	stats.set_int(MPX() .. "SALV23_INST_PROG", 0)
end
)


-- Cut Setter for Heist --

local function CutsPresetter(global_start, global_finish, cut)
	globals.set_int(GCg, cut)
	for i = global_start, global_finish do
		globals.set_int(i, cut)		
	end
end

-- Doomsday --
local function DoomsdayActSetter(progress, status)
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", progress)
	stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", status)
	stats.set_int(MPX() .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
end

local Doomsday = Heist_Editor:add_tab("Doomsday Heist")
Doomsday:add_text("Doomsday Acts")
Doomsday:add_button("Data Breaches",
function ()
	DoomsdayActSetter(503, 229383)

end)
Doomsday:add_sameline()
Doomsday:add_button("Bogdan Problem",
function ()
	DoomsdayActSetter(240, 229378)
end)
Doomsday:add_sameline()
Doomsday:add_button("Doomsday Scenario",
function ()
	DoomsdayActSetter(16368, 229380)
end)

Doomsday:add_text("Set Doomsday Heist Cuts")
Doomsday:add_text("Preset Cut")
Doomsday:add_button("100",
function ()
	CutsPresetter(DCg1, DCg4, 100)
end
)
Doomsday:add_text("Custom Cuts")
local dmsdyCut1 = Doomsday:add_input_int("Cut 1")
local dmsdyCut2 = Doomsday:add_input_int("Cut 2")
local dmsdyCut3 = Doomsday:add_input_int("Cut 3")
local dmsdyCut4 = Doomsday:add_input_int("Cut 4")
Doomsday:add_button("Set Cuts",
function ()
	globals.set_int(DCg1, dmsdyCut1:get_value())
	globals.set_int(DCg2, dmsdyCut2:get_value())
	globals.set_int(DCg3, dmsdyCut3:get_value())
	globals.set_int(DCg4, dmsdyCut4:get_value())
end)
Doomsday:add_separator()
Doomsday:add_text("Preps")
Doomsday:add_button("Reset Preps",
function ()
	DoomsdayActSetter(240, 0)
end
)
Doomsday:add_sameline()
Doomsday:add_button("Complete Preps",
function ()
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", -1)
end
)
Doomsday:add_separator()
Doomsday:add_text("By pass Doomsday Scenario hack")
Doomsday:add_button("By Act III Pass hack",
function ()
	locals.set_int("fm_mission_controller", DDSHl, 3)
end
)
-- Casino Heist --
local CasinoHeist = Heist_Editor:add_tab("Diamond Casino Heist")
CasinoHeist:add_text("Preps")
CasinoHeist:add_text("")
local function CasinoApproachSetter(last_approach, hard_approach, approach, selected_approach)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", last_approach)
	stats.set_int(MPX() .. "H3_HARD_APPROACH", hard_approach)
	stats.set_int(MPX() .. "H3_APPROACH", approach)
	stats.set_int(MPX() .. "H3OPT_APPROACH", selected_approach)
end
local function CasinoCompletePreps()
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_BITSET0", -1)
	stats.set_int(MPX() .. "H3OPT_BITSET1", -1)
	stats.set_int(MPX() .. "H3OPT_COMPLETEDPOSIX", -1)
end
local casinoPrimaryTargets = {
	{ name="Diamond", value=3 },
	{ name="Gold", value=1 },
	{ name="Arts", value=2 },
	{ name="Cash", value=0 }
}
local casinoApproachs = {
	{ name="Silent & Sneaky", value=127 , settings={ 2, 1, 3, 1 }},
	{ name="Big Con", value=799, settings={ 1, 2, 3, 2 } },
	{ name="Aggressive", value=799, settings={ 1, 2, 3, 3 }}
}
CasinoHeist:add_text("Primary Target")

for _, casinoprimarytarget in ipairs(casinoPrimaryTargets) do
	CasinoHeist:add_button(casinoprimarytarget.name,
	function ()
		stats.set_int(MPX() .. "H3OPT_TARGET", casinoprimarytarget.value)
	end)
	CasinoHeist:add_sameline()
end
CasinoHeist:add_separator()
CasinoHeist:add_text("Select Apprach")
for _, casinoApproach in ipairs(casinoApproachs) do
	CasinoHeist:add_button(casinoApproach.name,
	function ()
		CasinoApproachSetter(casinoApproach.settings[1], casinoApproach.settings[2], casinoApproach.settings[3], casinoApproach.settings[4])
		stats.set_int(MPX() .. "H3OPT_BITSET1", casinoApproach.value)
		stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
	end)
	CasinoHeist:add_sameline()
end
CasinoHeist:add_separator()
CasinoHeist:add_text("Gun Man")
local gunman = 0
local driver = 0
local hacker = 0
local mask = 0
local casinoPc1 = 0
local casinoPc2 = 0
local casinoPc3 = 0
local casinoPc4 = 0
local GunManLoadoutSi = {
	"Karl Abolaji/Micro SMG",
	"Karl Abolaji/Machine Pistol",
	"Charlie Reed/Assault SMG",
	"Charlie Reed/Bullpup Shotgun",
	"Patrick McReary/Combat PDW",
	"Patrick McReary/Assault Rifle",
	"Gustavo Mota/Carbine Rifle",
	"Gustavo Mota/Assault Shotgun",
	"Chester McCoy/Pump Shotgun Mk II",
	"Chester McCoy/Carbine Rifle Mk II"
}
local GunManLoadoutBC = {
	"Karl Abolaji/Micro SMG",
	"Karl Abolaji/Double Barrel Shotgun",
	"Charlie Reed/Machine Pistol",
	"Charlie Reed/Sweeper Shotgun",
	"Patrick McReary/Sawed-Off Shotgun",
	"Patrick McReary/Compact Rifle",
	"Gustavo Mota/Carbine Rifle",
	"Gustavo Mota/Assault Shotgun",
	"Chester McCoy/SMG Mk II",
	"Chester McCoy/Bullpup Rifle Mk II"
}
local GunManLoadoutAg = {
	"Karl Abolaji/Sawed-Off Shotgun",
	"Karl Abolaji/Heavy Revolver",
	"Charlie Reed/Assault SMG",
	"Charlie Reed/Pump Shotgun",
	"Patrick McReary/Heavy Shotgun",
	"Patrick McReary/Combat MG",
	"Gustavo Mota/Carbine Rifle",
	"Gustavo Mota/Assault Shotgun",
	"Chester McCoy/Pump Shotgun Mk II",
	"Chester McCoy/Assault Rifle Mk II"
}
local DriverLoad = {
	"Karim Denz/Issi Classic",
	"Karim Denz/Asbo",
	"Karim Denz/Blista Kanjo",
	"Karim Denz/Sentinel Classic",
	"Zach Nelson/Manchez",
	"Zach Nelson/Stryder",
	"Zach Nelson/Defiler",
	"Zach Nelson/Lectro",
	"Taliana Martinez/Retinue Mk II",
	"Taliana Martinez/Drift Yosemite",
	"Taliana Martinez/Sugoi",
	"Taliana Martinez/Jugular",
	"Eddie Toh/Sultan Classic",
	"Eddie Toh/Gauntlet Classic",
	"Eddie Toh/Ellie",
	"Eddie Toh/Komoda",
	"Chester McCoy/Zhaba",
	"Chester McCoy/Vagrant",
	"Chester McCoy/Outlaw",
	"Chester McCoy/Everon"

}
local hackerLoad = {
	"Select", "Rickie Lukens","Christian Feltz", "Yohan Blair", "Avi Schwartzman",  "Page Harris"
}
local maskLoad = {
	"Select", "Geometic Set", "Hunter Set", "Oni Half Mask Set", "Emoji Set", "Ornate Skull Set", "Lucky Fruit Set", "Guerilla Set", "Clown Set", "Animal Set", "Riot Set", "Oni Full Mask Set", "Hockey Set"
}
CasinoHeist:add_imgui(
	function ()
		if stats.get_int(MPX() .. "H3OPT_APPROACH") == 1 then
			ImGui.SetNextItemWidth(265)
			gunman = ImGui.Combo("Loadout", gunman, GunManLoadoutSi, 10)
			
		elseif stats.get_int(MPX() .. "H3OPT_APPROACH") == 2 then
			ImGui.SetNextItemWidth(265)
			gunman = ImGui.Combo("Loadout", gunman, GunManLoadoutBC, 10)
		elseif stats.get_int(MPX() .. "H3OPT_APPROACH") == 3 then
			ImGui.SetNextItemWidth(265)
			gunman = ImGui.Combo("Loadout", gunman, GunManLoadoutAg, 10)
		end

		if ImGui.Button("Set Loadout") then
			ImGui.Text(gunman)
			if gunman <= 1 then
				stats.set_int(MPX() .. "H3OPT_CREWWEAP", 1)
				stats.set_int(MPX() .. "H3OPT_WEAPS", gunman)
			elseif gunman <= 4 then
				stats.set_int(MPX() .. "H3OPT_CREWWEAP", 3)
				stats.set_int(MPX() .. "H3OPT_WEAPS", gunman - 2)
			elseif gunman <= 6 then
				stats.set_int(MPX() .. "H3OPT_CREWWEAP", 5)
				stats.set_int(MPX() .. "H3OPT_WEAPS", gunman - 4)
			elseif gunman <= 8 then
				stats.set_int(MPX() .. "H3OPT_CREWWEAP", 2)
				stats.set_int(MPX() .. "H3OPT_WEAPS", gunman - 6)
			elseif gunman <= 10 then
				stats.set_int(MPX() .. "H3OPT_CREWWEAP", 4)
				stats.set_int(MPX() .. "H3OPT_WEAPS", gunman - 8)
			end
		end
		ImGui.Separator()
		ImGui.Text("Getaway Vehicles")
		ImGui.SetNextItemWidth(265)
		driver = ImGui.Combo("", driver, DriverLoad, 20)
		if ImGui.Button("Set Getaway Vehicle") then
			ImGui.Text(driver)
			if driver <= 3 then
				stats.set_int(MPX() .. "H3OPT_CREWDRIVER",1)
				stats.set_int(MPX() .. "H3OPT_VEHS", driver)
			elseif driver <= 7 then
				stats.set_int(MPX() .. "H3OPT_CREWDRIVER",4)
				stats.set_int(MPX() .. "H3OPT_VEHS", driver- 4)
			elseif driver <= 11 then
				stats.set_int(MPX() .. "H3OPT_CREWDRIVER",2)
				stats.set_int(MPX() .. "H3OPT_VEHS", driver - 8)
			elseif driver <= 15 then
				stats.set_int(MPX() .. "H3OPT_CREWDRIVER",3)
				stats.set_int(MPX() .. "H3OPT_VEHS", driver - 12)
			elseif driver <= 19 then
				stats.set_int(MPX() .. "H3OPT_CREWDRIVER",5)
				stats.set_int(MPX() .. "H3OPT_VEHS", driver - 16)
			end
		end
		ImGui.Separator()
		ImGui.Text("Hacker")
		ImGui.SetNextItemWidth(265)
		hacker = ImGui.Combo("Hacker", hacker, hackerLoad, 6)
		if ImGui.Button("Set Hacker") then
			ImGui.Text(hacker)
			stats.set_int(MPX() .. "H3OPT_CREWHACKER", hacker)
		end
		ImGui.Separator()
		ImGui.Text("Mask")
		ImGui.SetNextItemWidth(265)
		ImGui.SetNextItemWidth(265)
		mask = ImGui.Combo("Masks", mask, maskLoad, 13)
		if ImGui.Button("Set Mask") then
			ImGui.Text(mask)
			stats.set_int(MPX() .. "H3OPT_MASKS", mask)
		end
		ImGui.Separator()
		if ImGui.Button("Complete preps") then
			CasinoCompletePreps()
		end
		ImGui.Separator()
		ImGui.Text("Cuts")
		ImGui.Text("Preset Cut")
		if ImGui.Button("Set Cut to 100") then
			CutsPresetter(DCCg1, DCCg4, 100)
		end
		casinoPc1 = ImGui.InputInt("Player Cut 1", casinoPc1)
		casinoPc2 = ImGui.InputInt("Player Cut 2", casinoPc2)
		casinoPc3 = ImGui.InputInt("Player Cut 3", casinoPc3)
		casinoPc4 = ImGui.InputInt("Player Cut 4", casinoPc4)
		if ImGui.Button("Set Player Cuts") then
			globals.set_int(DCCg1, casinoPc1)
			globals.set_int(DCCg2, casinoPc2)
			globals.set_int(DCCg3, casinoPc3)
			globals.set_int(DCCg4, casinoPc4)
		end
	end
	
)
CasinoHeist:add_separator()
CasinoHeist:add_button("Reload Planning Screen",
function ()
	locals.set_int("gb_casino_heist_planning", DCRBl, 2)
end
)
local CasinoHeistExtra = CasinoHeist:add_tab("Extras")
CasinoHeistExtra:add_text("Make Lester, Driver, Hacker, and Gunman cut to 0%")
CasinoHeistExtra:add_button("Make Fees to 0",
function ()
	globals.set_int(DCCgun, 0)
	globals.set_int(DCCh, 0)
	globals.set_int(DCCl, 0)
	globals.set_int(DCCd, 0)
end
)
CasinoHeistExtra:add_text("Hacks")
CasinoHeistExtra:add_button("Bypass Casino Fingerprint Hack",
function ()
	if locals.get_int("fm_mission_controller",DCFHl) == 4 then
		locals.set_int("fm_mission_controller",DCFHl, 5)
	end
end
)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Keypad Hack",
function ()
	if locals.get_int("fm_mission_controller",DCKHl) ~= 4 then
		locals.set_int("fm_mission_controller",DCKHl, 5)
	end
end
)
CasinoHeistExtra:add_sameline()
CasinoHeistExtra:add_button("Bypass Drill Vault Door",
function ()
	locals.set_int("fm_mission_controller",DCDVDl1, locals.get_int("fm_mission_controller",DCDVDl2))
end
)
CasinoHeistExtra:add_button("Play the Heist Solo",
function()
	if locals.get_int("fmmc_launcher", 19709 + 34) ~= nil then
		if locals.get_int("fmmc_launcher", 19709 + 34) ~= 0 then
			if locals.get_int("fmmc_launcher", 19709 + 34) > 1 then
					locals.set_int("fmmc_launcher", 19709 + 15, 1)
                    globals.set_int(794744 + 4 + 1 + (locals.get_int("fmmc_launcher", 19709 + 34) * 89) + 69, 1)
			end
			globals.set_int(4718592 + 3526, 1)
            globals.set_int(4718592 + 3527, 1)
            globals.set_int(4718592 + 3529 + 1, 1)
            globals.set_int(4718592 + 178821 + 1, 0)
		end
	end
end)
CasinoHeistExtra:add_sameline()



-- Cayo Heist --

local cayoPrimaryTargets = {
	{name="Panther Statue", id = 5},
	{name="Medrazo Files", id = 4},
	{name="Diamond", id = 3},
	{name="Bonds", id = 2},
	{name="Necklace", id = 1},
	{name="Tequila", id = 0}
}

local function CayoCompletePreps()
	stats.set_int(MPX() .. "H4CNF_UNIFORM", -1)
	stats.set_int(MPX() .. "H4CNF_GRAPPEL", -1)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 10)
	stats.set_int(MPX() .. "H4CNF_BS_GEN", -1)
	stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
	stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
	stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
end
local function CayoTargetsSetter(cash, weed, coke, gold, where, target, value)
	stats.set_int(MPX() .. "H4LOOT_CASH_" .. where, cash)
	stats.set_int(MPX() .. "H4LOOT_CASH_" .. where .. "_SCOPED", cash)
	stats.set_int(MPX() .. "H4LOOT_WEED_" .. where, weed)
	stats.set_int(MPX() .. "H4LOOT_WEED_" .. where .. "_SCOPED", weed)
	stats.set_int(MPX() .. "H4LOOT_COKE_" .. where, coke)
	stats.set_int(MPX() .. "H4LOOT_COKE_" .. where .. "_SCOPED", coke)
	stats.set_int(MPX() .. "H4LOOT_GOLD_" .. where, gold)
	stats.set_int(MPX() .. "H4LOOT_GOLD_" .. where .. "_SCOPED", gold)
	stats.set_int(MPX() .. "H4LOOT_" .. target .. "_V", value)
end
local function CayoPaintingsToggler(Enabled)
	if Enabled then
		stats.set_int(MPX() .. "H4LOOT_PAINT", 127)
		stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 127)
		stats.set_int(MPX() .. "H4LOOT_PAINT_V", 189500)
	else
		stats.set_int(MPX() .. "H4LOOT_PAINT", 0)
		stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", 0)
	end
end
local function CutsPresetter(global_start, global_finish, cut)
	globals.set_int(GCg, cut)
	for i = global_start, global_finish do
		globals.set_int(i, cut)
	end
end
local cayoSecondaryTargets = {
		{ name = "Gold", caps="GOLD", amount={
			compound ={
				cash=0, weed=0, coke=0, gold=255
			},
			island = {
				cash=0, weed=0, coke=0, gold=16777215
			}
		}, value = 330350},
		{ name = "Cocaine", caps="COKE",amount={
			compound ={
				cash=0, weed=0, coke=255, gold=0
			},
			island = {
				cash=0, weed=0, coke=16777215, gold=0
		}, value = 200095},
		{ name = "Meraguina", caps="WEED",amount={
			compound ={
				cash=0, weed=255, coke=0, gold=0
			},
			island = {
				cash=0, weed=16777215, coke=0, gold=0
				}
		}, value = 147870},
		{ name = "Cash", caps="CASH",amount={
			compound ={
				cash=255, weed=0, coke=0, gold=0
			},
			island = {
				cash=16777215, weed=0, coke=0, gold=0
			}
		}, value = 90000}
	}
}

local cayoLocations = {
	{name="Front Gate", x=4990.0386, y=-5717.6895, z=19.876024},
	{name="El Rubio's Office", x=5010.12, y=-5750.1353, z=28.844675},
	{name="Primary Target", x=5006.7, y=-5756.2, z=15.483983},
	{name="Secondary Target", x=4999.764160, y=-5749.863770, z=14.840000},
	{name="Safe Zone", x=4771.479, y=-6165.737, z=-39.079613},
	{name="Entrance Drinage Pipe", x=5043.74, y=-5815.3193, z=-10.574497},
	{name="Enter Cayo Perico", x=5053.8516, y=-5772.852, z=-4.1588774},
	{name="Elevator", x=5012.1533, y=-5749.0107, z=28.945145},
}
local cayoApproachVehicles = {
	{name="Longfin", id = 65345},
	{name="Patrol Boat", id = 65313},
	{name="Stealth Annihilator", id = 65425},
	{name="Velum", id = 65289},
	{name="Alkonost", id = 65413},
	{name="Kosatka", id = 65283},
}
local cayoWeapons = {
	{name="Aggressor", id = 1},
	{name="Conspirator", id = 2},
	{name="Crackshot", id = 3},
	{name="Saboteur", id = 4},
	{name="Marksman", id = 5},
}
local Cayo = Heist_Editor:add_tab("Cayo Perico Heist")

Cayo:add_text("Cayo Bag Size Editor")
local cayobag = Cayo:add_input_int("Bag Size")
Cayo:add_button("Set Bag Size", 
function ()
	globals.set_int(CPBg, cayobag:get_value())
	gui.show_message("YOUR CAYO BAG SIZE HAS BEEN SET TO THE VALUE "..cayobag:get_value().." SUCCESSFULLY", "THANK YOU FOR USING THIS OPTION ツ MADE WITH <3 BY Someone")
end)

Cayo:add_separator()

Cayo:add_text("Primary Target")
for _, cayoPrimaryTarget in ipairs(cayoPrimaryTargets) do
	Cayo:add_button(cayoPrimaryTarget.name,
	function ()
		stats.set_int(MPX() .. "H4CNF_TARGET", cayoPrimaryTarget.id)
	end)
	Cayo:add_sameline()
end
Cayo:add_separator()
Cayo:add_text("Secondary targets")
Cayo:add_text("Compound:")
for _, cayoSecondaryTarget in ipairs(cayoSecondaryTargets) do
	Cayo:add_button(cayoSecondaryTarget.name,
	function ()
		CayoTargetsSetter(cayoSecondaryTarget.amount.compound.cash, cayoSecondaryTarget.amount.compound.weed, cayoSecondaryTarget.amount.compound.coke, cayoSecondaryTarget.amount.compound.gold, "C", cayoSecondaryTarget.caps, cayoSecondaryTarget.value)
	
	end)
	Cayo:add_sameline()
end
Cayo:add_text("")
Cayo:add_text("Island (Buggy!)")
for _, cayoSecondaryTarget in ipairs(cayoSecondaryTargets) do
	Cayo:add_button(cayoSecondaryTarget.name,
	function ()
		CayoTargetsSetter(cayoSecondaryTarget.amount.island.cash, cayoSecondaryTarget.amount.island.weed, cayoSecondaryTarget.amount.island.coke, cayoSecondaryTarget.amount.island.gold, "I", cayoSecondaryTarget.caps, cayoSecondaryTarget.value)
	end)
end
Cayo:add_text("")
Cayo:add_text("Add Paintings")
local addPaintings = Cayo:add_checkbox("Paintings")
Cayo:add_separator()
Cayo:add_text("Difficulty")
Cayo:add_button("Hard",
function ()
	stats.set_int(MPX() .. "H4_PROGRESS", 131055)
end
)
Cayo:add_sameline()
Cayo:add_button("Normal",
function ()
	stats.set_int(MPX() .. "H4_PROGRESS", 126823)
end
)
Cayo:add_separator()
Cayo:add_text("Approach")
for _, cayoApproachVehicle in ipairs(cayoApproachVehicles) do
	Cayo:add_button(cayoApproachVehicle.name,
	function ()
		stats.set_int(MPX() .. "H4_MISSIONS", cayoApproachVehicle.id)
	end)
	Cayo:add_sameline()
end
Cayo:add_separator()
Cayo:add_text("Weapons")
for _, cayoWeapon in ipairs(cayoWeapons) do
	Cayo:add_button(cayoWeapon.name,
	function ()
		stats.set_int(MPX() .. "H4CNF_WEAPONS", cayoWeapon.id)
	end)
	Cayo:add_sameline()
end
Cayo:add_separator()
Cayo:add_button("Complete Preps",
function ()
	CayoPaintingsToggler(addPaintings:is_enabled())
	CayoCompletePreps()
	locals.set_int("heist_island_planning", CPRSl, 2)
end
)
Cayo:add_separator()
Cayo:add_text("Cuts to All")
Cayo:add_button("100",
function ()
	CutsPresetter(CPCg1, CPCg4, 100)
end
)
Cayo:add_text("")
Cayo:add_text("Custom Cut")
local cayocut1 = Cayo:add_input_int("Cut 1")
local cayocut2 = Cayo:add_input_int("Cut 2")
local cayocut3 = Cayo:add_input_int("Cut 3")
local cayocut4 = Cayo:add_input_int("Cut 4")
Cayo:add_button("Set",
function ()
	globals.set_int(CPCg1, cayocut1:get_value())
	globals.set_int(CPCg2, cayocut2:get_value())
	globals.set_int(CPCg3, cayocut3:get_value())
	globals.set_int(CPCg4, cayocut4:get_value())
end)
Cayo:add_separator()
Cayo:add_text("Reload Planing Screen")
Cayo:add_button("Reload Planing Screen",
function ()
	locals.set_int("heist_island_planning", CPRSl, 2)
end
)
Cayo:add_separator()
Cayo:add_text("Extras")
Cayo:add_button("Bypass Drainge Cut",
function ()
	locals.set_int("fm_mission_controller_2020", CPSTCl, 6)
end
)
Cayo:add_sameline()
Cayo:add_button("Bypass Fingerprint Scanner",
function ()
	locals.set_int("fm_mission_controller_2020", CPFHl, 5)
end
)
Cayo:add_sameline()
Cayo:add_button("Bypass Plasma Cutter",
function ()
	locals.set_float("fm_mission_controller_2020", CPPCCl, 100.0)
end
)
Cayo:add_sameline()
Cayo:add_button("Remove All CCTV's",
function ()
	for _, ent in pairs(entities.get_all_objects_as_handles()) do
		for __, cam in pairs(CamList) do
			if ENTITY.GET_ENTITY_MODEL(ent) == cam then
				ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ent, true, true)
				ENTITY.DELETE_ENTITY(ent)
			end
		end
	end
end
)
CamList = {
	joaat("prop_cctv_cam_01a"), joaat("prop_cctv_cam_01b"), joaat("prop_cctv_cam_02a"), joaat("prop_cctv_cam_03a"),
	joaat("prop_cctv_cam_04a"), joaat("prop_cctv_cam_04c"), joaat("prop_cctv_cam_05a"), joaat("prop_cctv_cam_06a"),
	joaat("prop_cctv_cam_07a"), joaat("prop_cs_cctv"), joaat("p_cctv_s"), joaat("hei_prop_bank_cctv_01"),
	joaat("hei_prop_bank_cctv_02"), joaat("ch_prop_ch_cctv_cam_02a"), joaat("xm_prop_x17_server_farm_cctv_01"),
}

Cayo:add_separator()
Cayo:add_text("Teleports")
for _, location in ipairs(cayoLocations) do
	Cayo:add_button(location.name,
	function ()
		local ped = PLAYER.PLAYER_PED_ID()
        PED.SET_PED_COORDS_KEEP_VEHICLE(ped, location.x, location.y, location.z)
	end)
	Cayo:add_sameline()
end

-- Apartment Heist --

local Apartment = Heist_Editor:add_tab("Apartment Heist")
Apartment:add_text("Preps")
Apartment:add_button("Complete Preps", 
function ()
	stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", -1)
end)
Apartment:add_sameline()
Apartment:add_button("Reset Preps", function()
	STATS.STAT_SET_INT(MPX() .. "HEIST_PLANNING_STAGE", 0)
end)
Apartment:add_text("")
Apartment:add_text("For Fleeca:")
Apartment:add_text("Pay for the preparation, start the first mission and as soon as you are sent to scout\nchange the session, come back to planning room, press \"Complete Preps\" near white board and press \"E\"")
Apartment:add_text("For Other Heist:")
Apartment:add_text("Start the mission and leave after the 1st cutscene ends, press \"Complete Preps\" near white board and press \"E\"")
Apartment:add_separator()
local remCD = Apartment:add_checkbox("Remove Cooldown")
script.register_looped("removeCool", function(remt)
    remt:yield()
    if remCD:is_enabled() == true then
		globals.set_int(1877285 + 1 + (PLAYER.PLAYER_ID() * 77) + 76, -1)
		remt:sleep(500)
	end
end)

local heistCuts = {
    [1328892776] = {-14806, 7453},
    [964111671] =  {-4184, 2142},
    [1131632450] = {-3074, 1587},
    [1967927346] = {-4100, 2100},
    [1182286714] = {-1900, 1000}
}

Apartment:add_button("15mil Payout",
function()
script.run_in_fiber(function(ap)
	local key = globals.get_int(1877285 + (PLAYER.PLAYER_ID() * 77) + 24 + 2)
	local cuts = heistCuts[key]
	globals.set_int(ACg1, 100 - (cuts[2]*locals.get_int("fmmc_launcher", 19709 + 34)))
	globals.set_int(ACg2, cuts[2])
	if key ~= 1328892776 then
		globals.set_int(ACg3, cuts[2])
		globals.set_int(ACg4, cuts[2])
	end
    PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
	ap:sleep(1000)
    PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 202, 1)
	ap:sleep(1000)
	globals.set_int(ACg5, -1 * (-100 + cuts[1]) / 2)
end)
end)



local apartCut1 = 0
local apartCut2 = 0
local apartCut3 = 0
local apartCut4 = 0
Apartment:add_imgui(
	function ()
		PAD.DISABLE_CONTROL_ACTION(2, 237, true)
		ImGui.Text("Custom Cuts:")
		ImGui.SetNextItemWidth(150)
		apartCut1 = ImGui.InputInt("Cut 1", apartCut1)
		ImGui.SameLine()
		ImGui.SetNextItemWidth(150)
		apartCut2 = ImGui.InputInt("Cut 2", apartCut2)
		ImGui.SetNextItemWidth(150)
		apartCut3 = ImGui.InputInt("Cut 3", apartCut3)
		ImGui.SameLine()
		ImGui.SetNextItemWidth(150)
		apartCut4 = ImGui.InputInt("Cut 4", apartCut4)
		if ImGui.Button("Set Cuts") then
			script.run_in_fiber(function(ccut)
			globals.set_int(ACg1, 100 - (apartCut1 * locals.get_int("fmmc_launcher", 19709 + 34)))
			globals.set_int(ACg2, apartCut2)
			globals.set_int(ACg3, apartCut3)
			globals.set_int(ACg4, apartCut4)
			PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 201, 1)
			ccut:sleep(1000)
    		PAD.SET_CONTROL_VALUE_NEXT_FRAME(2, 202, 1)
			ccut:sleep(1000)
			globals.set_int(ACg5, -1 * (-100 + globals.get_int(ACg1)) / 2)
		end)
	end
	end
)
Apartment:add_separator()

Apartment:add_text("Extras")
Apartment:add_button("Bypass Fleeca Hack",
function ()
	locals.set_int("fm_mission_controller", AFHl, 7)
end
)
Apartment:add_sameline()
Apartment:add_button("Bypass Fleeca Drill",
function ()
	locals.set_float("fm_mission_controller", AFDl, 100)
end
)
Apartment:add_sameline()
Apartment:add_button("Unlock All Heists",
function ()
	globals.set_int(1877285 + 1 + (PLAYER.PLAYER_ID() * 77 + 1) + 76, 31)
end
)
Apartment:add_sameline()
Apartment:add_button("Instant Finish",
function()
	locals.set_int("fm_mission_controller", AIFl3, 12)
	locals.set_int("fm_mission_controller", AIFl4, 99999)
	locals.set_int("fm_mission_controller", AIFl5, 99999)
end
)
Apartment:add_button("Play the Heist Solo",
function()
	if locals.get_int("fmmc_launcher", 19709 + 34) ~= nil then
		if locals.get_int("fmmc_launcher", 19709 + 34) ~= 0 then
			if locals.get_int("fmmc_launcher", 19709 + 34) > 1 then
					locals.set_int("fmmc_launcher", 19709 + 15, 1)
                    globals.set_int(794744 + 4 + 1 + (locals.get_int("fmmc_launcher", 19709 + 34) * 89) + 69, 1)
			end
			globals.set_int(4718592 + 3526, 1)
            globals.set_int(4718592 + 3527, 1)
            globals.set_int(4718592 + 3529 + 1, 1)
            globals.set_int(4718592 + 178821 + 1, 0)
		end
	end
end)
Apartment:add_text("")
Apartment:add_text("Note: After Clicking Unlock All Heists, restart the game")
-- Money Tool --

local MoneyT = Silent:add_tab("Money Tool")

-- Bunker Crash --

local Bunker = MoneyT:add_tab("Bunker Crash")
Bunker:add_text("Fill Bunker With Supplies")
Bunker:add_button("Fill With Supplies",
function ()
	globals.set_int(GSIg + 6, 1)
end
)
Bunker:add_separator()

Bunker:add_text("Unlock All Research temporarily")

Bunker:add_button("Unlock All Research", function()
	script.run_in_fiber(function(script)
		globals.set_int(FMg + 21564, 1)
		gui.show_message("Bunker Research", "ALL Bunker research has been unlocked.")
	end)
end)
Bunker:add_text("Supplies")
Bunker:add_button("Fast Production", function()
	script.run_in_fiber(function(script)
		globals.set_int(BCFp1, 1)
		globals.set_int(BCFp2, 1)
		globals.set_int(BCFp3, 1)
		gui.show_message("Production", "Bunker production speed has been increased, make sure you loop your supplies!")
	end)
end)
Bunker:add_sameline()
local bSupplies = Bunker:add_checkbox("Resupply Bunker (Looped)")
script.register_looped("autoGetBunkerCargo", function(script)
    script:yield()
    if bSupplies:is_enabled() == true then
        autoGetBunkerCargo = not autoGetBunkerCargo
        if autoGetBunkerCargo then
            globals.set_int(GSIg + 1 + 5, 1)
            gui.show_message("Bunker", "Resupplying your bunker supplies every 5 seconds.")
            script:sleep(500)
        end
    end
end)
Bunker:add_text("Instant Finish Sell Missions")
Bunker:add_button("Instant Sell Supplies",
function ()
	locals.set_int("gb_gunrunning", BCISl, 0)
end
)
-- MC Businesses

local MB = MoneyT:add_tab("MC Businesses")
MB:add_text("Resupply All Businesses")
MB:add_button("Resupply All", function()
	script.run_in_fiber(function(mcResupply)
		globals.set_int(1663174 + 1 + 6, 1)
		globals.set_int(1662874 + 1 + 6, 1)
		globals.set_int(1662874 + 1 + 6, 1) -- Acid Lab Supplies
		gui.show_message("Acid Lab", "Resupplying your Acid Lab")
		globals.set_int(1662874 + 1 + 5, 1)
		globals.set_int(1662874 + 1 + 5, 1)
		globals.set_int(1662874 + 1 + 5, 1) -- Bunker Supplies
		gui.show_message("Bunker", "Resupplying your Bunker")
		globals.set_int(1662874 + 1 + 1, 1)
		globals.set_int(1662874 + 1 + 1, 1)
		globals.set_int(1662874 + 1 + 1, 1) -- Document Forge Supplies
		gui.show_message("Document Forge", "Resupplying your Document Forge")
		globals.set_int(1662874 + 1 + 2, 1)
		globals.set_int(1662874 + 1 + 2, 1)
		globals.set_int(1662874 + 1 + 2, 1) -- Weed Farm Supplies
		gui.show_message("Weed Farm", "Resupplying your Weed Farm")
		globals.set_int(1662874 + 1 + 3, 1)
		globals.set_int(1662874 + 1 + 3, 1)
		globals.set_int(1662874 + 1 + 3, 1) -- Meth Lab Suplies
		gui.show_message("Meth Lab", "Resupplying your Meth Lab")
		globals.set_int(1662874 + 1 + 4, 1)
		globals.set_int(1662874 + 1 + 4, 1)
		globals.set_int(1662874 + 1 + 4, 1) -- Cocaine Lockup Supplies
		gui.show_message("Cocaine Lockup", "Resupplying your Cocaine Lockup")
	end)
end)
MB:add_sameline()
MB:add_button("Fast Production", function()
	script.run_in_fiber(function(fastProd)
		globals.set_int(262145 + 17599, 25500) -- prod time for weed
		globals.set_int(262145 + 17600, 25500) -- prod time for meth
		globals.set_int(262145 + 17601, 25500) -- prod time for cocaine
		globals.set_int(262145 + 17602, 25500) -- prod time for document forge
		globals.set_int(262145 + 17603, 25500) -- prod time for cash
		--globals.set_int(262145 + 17632, 10000)
		gui.show_message("Production Speed", "Production speed has been sped up for all businesses")
		gui.show_message("Production Speed", "Production speed increase will not start until workers finish the first product, keep it supplied to fill the product bar")
	end)
end)
MB:add_separator()
MB:add_text("Raise Value of Product of MC Business to $1,000,000 +")
MB:add_button("Raise Sale Prices", function()
    globals.set_int(MCPwv, 15000) -- price for weed
    globals.set_int(MCPmV + 17631, 60000) -- price for meth
    globals.set_int(MCPcockV, 100000) -- price for cocaine
    globals.set_int(MCPfakeV, 20000) -- price for document forge
    globals.set_int(MCPcashV, 30000) -- price for cash
	globals.set_int(MCPacidV, 6000) --price for acid
    gui.show_message("Production Value", "Production sale value has been increased for all businesses")
end)
-- Hangar Cargo --

local Hangar = MoneyT:add_tab("Hangar Cargo")
Hangar:add_text("Supplies")
Hangar:add_button("Tell Rooster to get some cargo supplies",
function ()
	stats.set_packed_stat_bool(36828, true)
end
)
local hangarloop = Hangar:add_checkbox("Hangar Loop")
script.register_looped("hangarloop",
	function (script)
		if hangarloop:is_enabled() then
			script:yield()
			stats.set_packed_stat_bool(36828, true)
			script:sleep(100)
		end
	end
)
Hangar:add_separator()
Hangar:add_text("Set Custom Price Per Piece")
local hangarPrice = Hangar:add_input_int("Price")

-- Define a table to store cargo names and their corresponding offsets
local cargoData = {
    { name = "Animal Materials", offset = 1 },
    { name = "Art n Antiques", offset = 2 },
    { name = "Chemicals", offset = 3 },
    { name = "Counterfeit Goods", offset = 4 },
    { name = "Jewel n Gems", offset = 5 },
    { name = "Medical Supplies", offset = 6 },
    { name = "Narcotics", offset = 7 },
    { name = "Tabacco n Alcohol", offset = 8 },
}

-- Function to set the price for a specific cargo type
local function setCargoPrice(offset)
    globals.set_int(HCVPg + offset, hangarPrice:get_value())
end

-- Create buttons for each cargo type using a loop
for _, cargo in ipairs(cargoData) do
    Hangar:add_button(cargo.name, function()
        setCargoPrice(cargo.offset)
    end)
    Hangar:add_sameline()
end
Hangar:add_separator()
local HangarCargo = 0
Hangar:add_text("Instant Finish Air Cargo Sell Missions")
HangarCargo = Hangar:add_input_int(" Cargos")
Hangar:add_button("Instant Finish",
function ()
	script.run_in_fiber(
		function (script)
			globals.set_float(HCVRCg, 0)
			locals.set_int("gb_smuggler", HCVISl1, HangarCargo:get_value())
			script:sleep(1000)
			locals.set_int("gb_smuggler", HCVISl2, -1)
		end
	)
end
)
-- Night Loop --

local function NightclubCooldownKiller(Enabled)
	if Enabled then
		globals.set_int(NHCKg1, 0)
		globals_set_ints(NHCKg2, NHCKg3, 1, 0)
	else
		globals.set_int(NHCKg1, 300000)
		globals_set_ints(NHCKg2, NHCKg3, 1, 300000)
	end
end
local Nightclub = MoneyT:add_tab("Night Club Utilities")
Nightclub:add_text("Nightclub Loop")
Nightclub:add_text("This Fill the Popularity of Nightclub and Fills the Safe with 50000 every 2s and Auto-Collect when safe is full")
local safeloop = Nightclub:add_checkbox("Enable Nitghtclub $250k/15s (Safe AFK)")
count = 0
script.register_looped("nightclubloop", function(script)
	script:yield()
	if safeloop:is_enabled() then
		stats.set_int(MPX() .. "CLUB_POPULARITY", 1000)
		stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
		script:sleep(2500)
		count = count + 1
		if count == 5 then
			locals.set_int("am_mp_nightclub", NLCl, 1)
			count = 0
		end
	end
end)
Nightclub:add_separator()
Nightclub:add_text("NightClub Safe")
Nightclub:add_button("Fill Nightclub Safe",
function ()
	script.run_in_fiber(
		function (script)
			stats.set_int(MPX() .. "CLUB_POPULARITY", 0)
			script:sleep(200)
			globals.set_int(NLISg, 250000)
			globals.set_int(NLSCg, 250000)
			stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
		end
	)
end
)
Nightclub:add_sameline()
Nightclub:add_button("Collect Nightclub Safe",
function ()
	locals.set_int("am_mp_nightclub", NLCl, 1)
end
)
Nightclub:add_separator()

local nightCargoDatas = {
    { name = "Cargo and shipments", offset = 0, vars = NHCNSg },
    { name = "Sporting Goods", offset = 1 , vars = NHSGg },
    { name = "S.A. Imports", offset = 2, vars = NHSAIg },
    { name = "Pharmac. Research", offset = 3, vars = NHPRg },
    { name = "Organic Produce", offset = 4, vars = NHOPg },
    { name = "Printing and Copying", offset = 5, vars = NHPNCg },
	{ name = "Cash Creation", offset = 6, vars = NHCCg },
}

Nightclub:add_text("Set Cargo value to $2,00,000")
for _, nightCargoData in ipairs(nightCargoDatas) do
	Nightclub:add_button(nightCargoData.name, function()
		if stats.get_int(MPX() .. "HUB_PROD_TOTAL_" .. nightCargoData.offset) ~= 0 then
			globals.set_int(nightCargoData.vars, math.floor(2000000 / stats.get_int(MPX() .. "HUB_PROD_TOTAL_" .. nightCargoData.offset)))
		end
	end
	)
	Nightclub:add_sameline()
end

Nightclub:add_text("")
Nightclub:add_button("Default Payout",
function ()
	globals.set_int(NHCNSg, 10000)
	globals.set_int(NHSGg, 5000)
	globals.set_int(NHSAIg, 27000)
	globals.set_int(NHPRg, 11475)
	globals.set_int(NHOPg, 2025)
	globals.set_int(NHPNCg, 10000)
	globals.set_int(NHCCg, 4725)
end
)
Nightclub:add_separator()
Nightclub:add_text("Kill Cooldown")
Nightclub:add_button("Cooldown Killer",
function ()
	NightclubCooldownKiller(true)
end
)
-- Arcade loop - 
local arcade = MoneyT:add_tab("Arcade")
arcadeSafe = arcade:add_checkbox("Arcade Safe Loop")
script.register_looped("arcadeloop", function(script)
    script:yield()
    if arcadeSafe:is_enabled() == true then
        gui.show_message("Business Manager", "Supplying Arcade Safe with money")
        STATS.STAT_SET_INT(joaat(MPX() .. "ARCADE_SAFE_CASH_VALUE"), 2000, true)
        STATS.STAT_SET_INT(joaat(MPX() .. "ARCADE_PAY_TIME_LEFT"), -1, true)
        script:sleep(5000)
    end
end)
-- Special Cargo --

local Special = MoneyT:add_tab("Special Cargo")
Special:add_text("Get Cargo Supplies")
Special:add_button("Get Supplies",
function ()
	stats_set_packed_bools(32359, 32363, true)
end
)
Special:add_separator()
Special:add_text("Cargo Crate Loop")
local cargoloop = Special:add_checkbox("Get Supplies Loop")
script.register_looped("cargoloop",
function (script)
	script:yield()
	if cargoloop:is_enabled() then
		stats_set_packed_bools(32359, 32363, true)
		script:sleep(500)
	end
end
)
Special:add_separator()
Special:add_text("Manual Cargo  Loop")

local cratevalue = 10000
Special:add_imgui(function()
    cratevalue, used = ImGui.SliderInt("Crate Value", cratevalue, 10000, 5000000)
    if used then
        for i = 0, 20, 1 do
			globals.set_int(SCVPg + i, cratevalue)
		end
    end
end)
Special:add_separator()
Special:add_text("Instant Sell")
Special:add_button("Instant Sell",
function()
	script.run_in_fiber(
		function (script)
			globals.set_float(XMg, 0)
			stats_set_packed_bools(32359, 32363, true)
			locals.set_int("gb_contraband_sell", SCVMTl, 7)
			script:sleep(500)
			locals.set_int("gb_contraband_sell", SCVISl, 99999)
			sleep(500)
			for i = 0, 4 do
				if stats.get_int(MPX() .. "CONTOTALFORWHOUSE" .. i) > 0 then
					stats.set_int(MPX() .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX() .. "CONTOTALFORWHOUSE" .. i) - 1)
				end
			end
			locals.set_int("gb_contraband_sell", SCVISl, 99999)
		end
	)
end
)

Special:add_text("1. Go to Master Control of Arcade or Use Warehouse Computer")
Special:add_text("2. Go to Special Cargo > Sell Cargo")
Special:add_text("3. Go For $5mil and click sell")
Special:add_text("4. Use Instant Finish given in Special")

-- Miscellaneous --
local Miscellaneous = Silent:add_tab("Miscellaneous")
-- Vehicle Utilities --
function FastAcc(speed)
	local vehicle = PED.GET_VEHICLE_PED_IS_IN(PLAYER.PLAYER_PED_ID(), true)
	VEHICLE.SET_VEHICLE_FORWARD_SPEED(vehicle, speed/2)
	VEHICLE.SET_VEHICLE_MAX_SPEED(vehicle, speed)
end

local VehUtils = Miscellaneous:add_tab("Vehicle Utilities")
VehUtils:add_text("Set Top Speed Of Vehicle")
local vehTopSpeed = VehUtils:add_input_int("Top Speed")
VehUtils:add_button("Set Top Speed",
function ()
	FastAcc(vehTopSpeed:get_value() - 100)
end
)
local fastAcc = VehUtils:add_checkbox("Fast Acceleration Loop")
script.register_looped("fastacc",
function (script)
	script:yield()
	if fastAcc:is_enabled() then
		FastAcc(vehTopSpeed:get_value() -100)
		script:sleep(500)
	end
end
)
VehUtils:add_separator()
VehUtils:add_text("Vehicle unlocker")
VehUtils:add_button("Unlock Dripfeed Vehicles",
function ()
	globals.set_int(BEDVg5, 1)				-- bypass
	globals.set_int(EDVg5, 1)				-- pipistrello
	globals.set_int(FMg + 35588 + 8, 1)		--pipistrello
	globals.set_int(EDVg12, 1)				-- dominator fx interceptor
	globals.set_int(FMg + 35588 + 13, 1)		-- dominator fx interceptor
	globals.set_int(EDVg8, 1)				-- dominator fx
	globals.set_int(FMg + 35588 + 12, 1)	-- dominator fx
	globals.set_int(EDVg3, 1)				-- impaler lx cruiser
	globals.set_int(FMg + 35588 + 4, 1)		-- impaler lx cruiser
	globals.set_int(EDVg15, 1)				-- pizzaboy
	globals.set_int(FMg + 35588 + 14, 1)	-- pizzaboy
	globals.set_int(EDVg9, 1)				-- Vorschlaghammer
	globals.set_int(FMg + 35588 + 0, 1)		-- Vorschlaghammer
	globals.set_int(EDVg7, 1)				--catisgator
	globals.set_int(FMg + 35588 + 6, 1)		--catisgator
	globals.set_int(EDVg6, 1)				-- polimpalor
	globals.set_int(FMg + 35588 + 19, 1)	-- polimpalor
end
)

VehUtils:add_button("Unlock Removed Vehicles",
function ()
	globals.set_int(262145 + 22565, 1)
    globals.set_int(262145 + 14708, 1)
    globals.set_int(262145 + 34371, 1)
    globals.set_int(262145 + 34373, 1)
    globals.set_int(262145 + 34451, 1)
    globals.set_int(262145 + 34349, 1)
    globals.set_int(262145 + 34527, 1)
    globals.set_int(262145 + 34533, 1)
    globals.set_int(262145 + 17356, 1)
    globals.set_int(262145 + 17372, 1)
    globals.set_int(262145 + 34589, 1)
    globals.set_int(262145 + 35492, 1)
    globals.set_int(262145 + 34415, 1)
    globals.set_int(262145 + 34417, 1)
    globals.set_int(262145 + 34465, 1)
    globals.set_int(262145 + 34573, 1)
    globals.set_int(262145 + 34499, 1)
    globals.set_int(262145 + 34495, 1)
    globals.set_int(262145 + 34493, 1)
    globals.set_int(262145 + 34511, 1)
    globals.set_int(262145 + 28191, 1)
    globals.set_int(262145 + 34501, 1)
    globals.set_int(262145 + 34333, 1)
    globals.set_int(262145 + 34551, 1)
    globals.set_int(262145 + 34553, 1)
    globals.set_int(262145 + 34409, 1)
    globals.set_int(262145 + 34365, 1)
    globals.set_int(262145 + 34569, 1)
    globals.set_int(262145 + 34571, 1)
    globals.set_int(262145 + 23726, 1)
    globals.set_int(262145 + 34401, 1)
    globals.set_int(262145 + 17230, 1)
    globals.set_int(262145 + 25367, 1)
    globals.set_int(262145 + 34335, 1)
    globals.set_int(262145 + 34337, 1)
    globals.set_int(262145 + 34339, 1)
    globals.set_int(262145 + 34341, 1)
    globals.set_int(262145 + 34325, 1)
    globals.set_int(262145 + 18947, 1)
    globals.set_int(262145 + 18948, 1)
    globals.set_int(262145 + 22564, 1)
    globals.set_int(262145 + 17229, 1)
    globals.set_int(262145 + 34367, 1)
    globals.set_int(262145 + 34331, 1)
    globals.set_int(262145 + 21603, 1)
    globals.set_int(262145 + 17364, 1)
    globals.set_int(262145 + 25369, 1)
    globals.set_int(262145 + 34431, 1)
    globals.set_int(262145 + 34453, 1)
    globals.set_int(262145 + 34497, 1)
    globals.set_int(262145 + 25387, 1)
    globals.set_int(262145 + 34455, 1)
    globals.set_int(262145 + 34403, 1)
    globals.set_int(262145 + 17355, 1)
    globals.set_int(262145 + 34399, 1)
    globals.set_int(262145 + 34323, 1)
    globals.set_int(262145 + 34437, 1)
    globals.set_int(262145 + 23717, 1)
    globals.set_int(262145 + 17358, 1)
    globals.set_int(262145 + 17370, 1)
    globals.set_int(262145 + 34467, 1)
    globals.set_int(262145 + 34433, 1)
    globals.set_int(262145 + 34435, 1)
    globals.set_int(262145 + 34351, 1)
    globals.set_int(262145 + 34411, 1)
    globals.set_int(262145 + 34587, 1)
    globals.set_int(262145 + 34565, 1)
    globals.set_int(262145 + 34523, 1)
    globals.set_int(262145 + 34369, 1)
    globals.set_int(262145 + 34563, 1)
    globals.set_int(262145 + 34559, 1)
    globals.set_int(262145 + 34481, 1)
    globals.set_int(262145 + 19951, 1)
    globals.set_int(262145 + 34581, 1)
    globals.set_int(262145 + 34577, 1)
    globals.set_int(262145 + 22556, 1)
    globals.set_int(262145 + 34585, 1)
    globals.set_int(262145 + 34473, 1)
    globals.set_int(262145 + 25386, 1)
    globals.set_int(262145 + 22563, 1)
    globals.set_int(262145 + 34457, 1)
    globals.set_int(262145 + 34513, 1)
    globals.set_int(262145 + 22557, 1)
    globals.set_int(262145 + 28201, 1)
    globals.set_int(262145 + 34405, 1)
    globals.set_int(262145 + 34541, 1)
    globals.set_int(262145 + 34459, 1)
    globals.set_int(262145 + 34535, 1)
    globals.set_int(262145 + 34429, 1)
    globals.set_int(262145 + 25383, 1)
    globals.set_int(262145 + 34439, 1)
    globals.set_int(262145 + 34387, 1)
    globals.set_int(262145 + 34361, 1)
    globals.set_int(262145 + 34557, 1)
    globals.set_int(262145 + 34503, 1)
    globals.set_int(262145 + 34583, 1)
    globals.set_int(262145 + 28830, 1)
    globals.set_int(262145 + 28190, 1)
    globals.set_int(262145 + 25379, 1)
    globals.set_int(262145 + 17232, 1)
    globals.set_int(262145 + 34353, 1)
    globals.set_int(262145 + 34555, 1)
    globals.set_int(262145 + 34597, 1)
    globals.set_int(262145 + 23729, 1)
    globals.set_int(262145 + 14703, 1)
    globals.set_int(262145 + 25385, 1)
    globals.set_int(262145 + 34471, 1)
    globals.set_int(262145 + 25396, 1)
    globals.set_int(262145 + 34443, 1)
    globals.set_int(262145 + 34441, 1)
    globals.set_int(262145 + 25397, 1)
    globals.set_int(262145 + 34591, 1)
    globals.set_int(262145 + 34475, 1)
    globals.set_int(262145 + 34561, 1)
    globals.set_int(262145 + 25389, 1)
    globals.set_int(262145 + 34485, 1)
    globals.set_int(262145 + 34567, 1)
    globals.set_int(262145 + 34427, 1)
    globals.set_int(262145 + 34529, 1)
    globals.set_int(262145 + 34595, 1)
    globals.set_int(262145 + 22560, 1)
    globals.set_int(262145 + 34505, 1)
    globals.set_int(262145 + 34355, 1)
    globals.set_int(262145 + 34357, 1)
    globals.set_int(262145 + 21607, 1)
    globals.set_int(262145 + 17363, 1)
    globals.set_int(262145 + 17373, 1)
    globals.set_int(262145 + 34483, 1)
    globals.set_int(262145 + 17223, 1)
    globals.set_int(262145 + 34507, 1)
    globals.set_int(262145 + 34531, 1)
    globals.set_int(262145 + 21606, 1)
    globals.set_int(262145 + 22558, 1)
    globals.set_int(262145 + 22562, 1)
    globals.set_int(262145 + 34593, 1)
    globals.set_int(262145 + 34521, 1)
    globals.set_int(262145 + 34377, 1)
    globals.set_int(262145 + 34393, 1)
    globals.set_int(262145 + 34469, 1)
    globals.set_int(262145 + 34489, 1)
    globals.set_int(262145 + 19953, 1)
    globals.set_int(262145 + 34509, 1)
    globals.set_int(262145 + 25393, 1)
    globals.set_int(262145 + 34463, 1)
    globals.set_int(262145 + 34461, 1)
    globals.set_int(262145 + 17366, 1)
    globals.set_int(262145 + 34515, 1)
    globals.set_int(262145 + 22561, 1)
    globals.set_int(262145 + 22554, 1)
    globals.set_int(262145 + 34519, 1)
    globals.set_int(262145 + 34345, 1)
    globals.set_int(262145 + 34347, 1)
    globals.set_int(262145 + 34547, 1)
    globals.set_int(262145 + 34579, 1)
    globals.set_int(262145 + 28831, 1)
    globals.set_int(262145 + 34445, 1)
    globals.set_int(262145 + 34575, 1)
    globals.set_int(262145 + 34359, 1)
    globals.set_int(262145 + 34479, 1)
    globals.set_int(262145 + 23781, 1)
    globals.set_int(262145 + 34539, 1)
    globals.set_int(262145 + 34383, 1)
    globals.set_int(262145 + 34381, 1)
    globals.set_int(262145 + 34379, 1)
    globals.set_int(262145 + 34545, 1)
    globals.set_int(262145 + 22551, 1)
    globals.set_int(262145 + 34343, 1)
    globals.set_int(262145 + 34549, 1)
    globals.set_int(262145 + 34525, 1)
    globals.set_int(262145 + 23780, 1)
    globals.set_int(262145 + 34537, 1)
    globals.set_int(262145 + 34327, 1)
    globals.set_int(262145 + 29156, 1)
    globals.set_int(262145 + 20830, 1)
    globals.set_int(262145 + 17371, 1)
    globals.set_int(262145 + 25370, 1)
    globals.set_int(262145 + 17221, 1)
    globals.set_int(262145 + 34407, 1)
    globals.set_int(262145 + 34477, 1)
    globals.set_int(262145 + 26330, 1)
    globals.set_int(262145 + 34375, 1)
    globals.set_int(262145 + 29605, 1)
    globals.set_int(262145 + 34487, 1)
    globals.set_int(262145 + 22566, 1)
    globals.set_int(262145 + 34397, 1)
    globals.set_int(262145 + 34543, 1)
    globals.set_int(262145 + 34517, 1)
    globals.set_int(262145 + 17369, 1)
    globals.set_int(262145 + 20828, 1)
    globals.set_int(262145 + 34423, 1)
    globals.set_int(262145 + 34425, 1)
    globals.set_int(262145 + 34395, 1)
    globals.set_int(262145 + 34447, 1)
    globals.set_int(262145 + 34449, 1)
    globals.set_int(262145 + 25384, 1)
    globals.set_int(262145 + 17354, 1)
    globals.set_int(262145 + 25381, 1)
    globals.set_int(262145 + 34599, 1)
end
)


local unlocker = Miscellaneous:add_tab("Unlocker Menu")
unlocker:add_text("Unlock All the Things you want")
unlocker:add_button("Unlock All Parachutes",
	function()
		stats.set_packed_stat_bool(3609, true)
		stats_set_packed_bools(31791, 31796, true)
		stats_set_packed_bools(34378, 34379, true)
	end)
unlocker:add_sameline()
unlocker:add_button("Unlock All Tattoos",
	function()
		for i = 0, 53 do
			stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_" .. i, -1)
		end
		stats.set_int(MPX() .. "TATTOO_FM_CURRENT_32", -1)
	end)
	unlocker:add_sameline()
unlocker:add_button("Unlock Diamond Casino Outfits", function() stats_set_packed_bools(28225, 28248, true) end)

unlocker:add_button("Enable Fast Run and Reload",
function () 
	for i = 1, 3 do
		stats.set_int(MPX() .. "CHAR_FM_ABILITY_" .. i .. "_UNLCK", -1)
		stats.set_int(MPX() .. "CHAR_ABILITY_" .. i .. "_UNLCK", -1)
	end
	gui.show_message("SUCCESSFULLY ENABLED FAST RUN AND RELOAD", "CHANGE SESSION TO SEE THE RESULT")
end)
unlocker:add_sameline()
unlocker:add_button("Disable Fast Run and Reload",
function () 
	for i = 1, 3 do
		stats.set_int(MPX() .. "CHAR_FM_ABILITY_" .. i .. "_UNLCK", 0)
		stats.set_int(MPX() .. "CHAR_ABILITY_" .. i .. "_UNLCK", 0)
	end
	gui.show_message("SUCCESSFULLY DISABLED FAST RUN AND RELOAD", "CHANGE SESSION TO SEE THE RESULT")
end)
unlocker:add_sameline()
unlocker:add_button("Unlock Halloween Vehicles",
function ()
	globals.set_int(262145 + 12025, 1)
end)
unlocker:add_button("BASE5 T-SHIRT",
function() 
	globals.set_int(262145 + 23812, 1) 
end)
unlocker:add_sameline()
unlocker:add_button("Unlock Mercenaries Masks",function() 
	for i = 34625,34643 do
		globals.set_int(262145 + i, 1)
	end
end)
unlocker:add_sameline()
unlocker:add_button("Unlock Flight School Gold Medals",
	function()
		for i = 0, 9 do
			stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_" .. i , -1)
			stats.set_int(MPX() .. "PILOT_SCHOOL_MEDAL_" .. i, -1)
			stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_" .. i, true)
		end
		stats.set_int("MPPLY_NUM_CAPTURES_CREATED", 100)
	end)
unlocker:add_button("Unlock Trade Prices for Cop Cars",
	function()
		stats.set_int(MPX() .. "SALV23_GEN_BS", -1)
		stats.set_int(MPX() .. "SALV23_INST_PROG", -1)
		stats.set_int(MPX() .. "SALV23_SCOPE_BS", -1)
		stats.set_int(MPX() .. "MOST_TIME_ON_3_PLUS_STARS", 300000)
	end
)
unlocker:add_sameline()
unlocker:add_button("Unlock The Shocker",
function ()
	stats.set_packed_stat_bool(51196, true)
	gui.show_message("THE SHOCK HAS BEEN ADDED TO YOUR INVENTORY", "PLEASE JOIN A NEW SESSION TO USE IT")
end)
unlocker:add_sameline()
unlocker:add_button("Unlock Hidden Liveries",
function ()
	for i = 0, 20 do
		stats.set_int("MPPLY_XMASLIVERIES" .. i, -1)
	end
end
)
unlocker:add_button("Unlock Xmas Plates",
function ()
	stats.set_int("MPPLY_XMAS23_PLATES0", -1)
end
)
unlocker:add_sameline()
unlocker:add_button("Unlock Taxi Liveries",
function ()
	stats.set_int(MPX() .. "AWD_TAXIDRIVER", 50)
	stats.set_masked_int(MPX() .. "DLC22022PSTAT_INT536", 10, 16, 8)
end
)
unlocker:add_button("Unlock Halloween Face Paint",
function ()
	globals.set_int(FMg + 12027, 1)
end
)
unlocker:add_button("Unlock Skull Tattoo",
function () 
	stats.set_int(MPX() .. "PLAYER_HEADSHOTS", 500)
end)

unlocker:add_separator()
unlocker:add_text("Unlock Weapon Liveries")

unlocker:add_button("Dildodude Camo | Micro SMG", function() stats.set_packed_stat_bool(36788, true) end)
unlocker:add_sameline()
unlocker:add_button("Dildodude Camo | Pump Shotgun", function() stats.set_packed_stat_bool(36787, true) end)
unlocker:add_sameline()
unlocker:add_button("Employee of the Month Fin. | Micro SMG", function() stats.set_packed_stat_bool(41657, true) end)
unlocker:add_button("Santa's Helper Finish | Heavy Sniper", function() stats.set_packed_stat_bool(42069, true) end)
unlocker:add_sameline()
unlocker:add_button("Season's Greetings | Pistol Mk II", function() stats.set_packed_stat_bool(36786, true) end)
unlocker:add_sameline()
unlocker:add_button("Skull Santa Finish | Special Carbine", function() stats.set_packed_stat_bool(42122, true) end)
unlocker:add_button("Snowman Finish | Combat Pistol", function() stats.set_packed_stat_bool(42068, true) end)
unlocker:add_sameline()
unlocker:add_button("Suede Bucks Finish | Carbine Rifle", function() stats.set_packed_stat_bool(41658, true) end)
unlocker:add_sameline()
unlocker:add_button("Uncle T Finish | RPG", function() stats.set_packed_stat_bool(41659, true) end)
unlocker:add_separator()
unlocker:add_text("Unlock Bootm Dollar Bounties Items")
unlocker:add_button("Unlock Clothes",
function ()
	stats.set_packed_stat_bool(51217, true) -- Gold Pisswasser Shorts
    stats.set_packed_stat_bool(51240, true)  -- Silver Gun Necklace
	stats.set_packed_stat_bool(51241, true)  -- Black Gun Necklace
	stats.set_packed_stat_bool(51242, true)  -- Gold Gun Necklace
	stats.set_packed_stat_bool(51243, true)  -- Rose Gun Necklace
	stats.set_packed_stat_bool(51244, true)  -- Bronze Gun Necklace
	stats.set_packed_stat_bool(51221, true)  -- Halloween Spooky Tee
	stats.set_packed_stat_bool(51216, true)  -- Pisswasser Good Time Tee
	stats.set_packed_stat_bool(51220, true)  -- Día de Muertos Tee
	stats.set_packed_stat_bool(51239, true)  -- Rockstar Red Logo Sweater
	stats.set_packed_stat_bool(51219, true)  -- Mid Autumn Festival Sundress (female)
	stats.set_packed_stat_bool(51218, true)  -- Mid Autumn Festival Shirt
	stats.set_packed_stat_bool(51245, true)  -- Black Yeti Fall Sweater
	stats.set_packed_stat_bool(51246, true)  -- White Yeti Fall Sweater
	stats.set_packed_stat_bool(51247, true)  -- Red Yeti Fall Sweater
	stats.set_packed_stat_bool(42287, true)  -- Pizza This... Forwards Cap, Pizza This... Backwards Cap, Pizza This... Outfit
	stats.set_packed_stat_bool(51215, true)  -- Brown Alpine Hat
	stats.set_packed_stat_bool(42257, true)  -- The Street Artist
	stats.set_packed_stat_bool(42268, true)  -- Ghosts Exposed Outfit
	stats.set_packed_stat_bool(42286, true)  -- Ludendorff Survivor
	stats.set_packed_stat_bool(51215, true)  -- Alpine Outfit
	stats.set_packed_stat_bool(51237, true)  -- Tan Turkey
	stats.set_packed_stat_bool(51238, true)  -- Brown Turkey
	stats.set_packed_stat_bool(51234, true)  -- Orange Glow Skeleton Onesie
	stats.set_packed_stat_bool(51235, true)  -- Purple Glow Skeleton Onesie
	stats.set_packed_stat_bool(51236, true)  -- Green Glow Skeleton Onesie
	stats.set_packed_stat_bool(51258, true)  -- Pizza This... Tee
	
end
)
unlocker:add_sameline()
unlocker:add_button("Unlock Masks",
function ()
	stats.set_packed_stat_bool(51222, true)  -- Black Demon Goat Mask
	stats.set_packed_stat_bool(51223, true)  -- Red Demon Goat Mask
	stats.set_packed_stat_bool(51224, true)  -- Tan Demon Goat Mask
	stats.set_packed_stat_bool(51225, true)  -- Black Creepy Cat Mask
	stats.set_packed_stat_bool(51226, true)  -- Gray Creepy Cat Mask
	stats.set_packed_stat_bool(51227, true)  -- Brown Creepy Cat Mask
	stats.set_packed_stat_bool(51228, true)  -- Gray Hooded Skull Mask
	stats.set_packed_stat_bool(51229, true)  -- Red Hooded Skull Mask
	stats.set_packed_stat_bool(51230, true)  -- Blue Hooded Skull Mask
	stats.set_packed_stat_bool(51231, true)  -- Red Flaming Skull Mask
	stats.set_packed_stat_bool(51232, true)  -- Green Flaming Skull Mask
	stats.set_packed_stat_bool(51233, true)  -- Orange Flaming Skull Mask

end)
unlocker:add_sameline()
unlocker:add_button("Special Clothes",
function ()
	stats.set_packed_stat_bool(32407, true)  -- Bottom Dollar Jacket
	stats.set_packed_stat_bool(32408, true)  -- The Bottom Dollar
	stats.set_packed_stat_bool(51250, true)  -- Cobalt Jackal Racing Pants
	stats.set_packed_stat_bool(51251, true)  -- Khaki 247 Chino Pants
	stats.set_packed_stat_bool(51248, true)  -- The Diamond Jackpot Tee
	stats.set_packed_stat_bool(51249, true)  -- Cobalt Jackal Racing Jersey
	stats.set_packed_stat_bool(51253, true)  -- Purple Güffy Cardigan
	stats.set_packed_stat_bool(51252, true)  -- Demon Biker Jacket
	stats.set_packed_stat_bool(51254, true)  -- SA Denim Biker Jacket
	stats.set_packed_stat_bool(51255, true)  -- Green 247 Shirt
	stats.set_packed_stat_bool(51256, true)  -- Barbed Wire Shirt

end)
unlocker:add_sameline()

unlocker:add_separator()
unlocker:add_text("Unlock All Collectables")
function unlock_packed_bools(from, to)
    for i = from, to do
        stats.set_packed_stat_bool(i, true)
    end
end
unlocker:add_button("Unlock Signal jammers",
function ()
	unlock_packed_bools(28099, 28148)
end
)

unlocker:add_sameline()
unlocker:add_button("LD Organics",
function ()
	unlock_packed_bools(34262, 34361)
end
)
unlocker:add_sameline()
unlocker:add_button("Playing Cards & Action Figures",
function ()
	unlock_packed_bools(26811, 26964)
end
)
unlocker:add_sameline()
unlocker:add_button("SnowMans",
function ()
	unlock_packed_bools(36630, 36654)
end
)
-- LSCM ---

local LSCM = Miscellaneous:add_tab("LSCM Unlocker Menu")

LSCM:add_button("Unlock All Rep Lvl 1000", function()
	for i = 262145 + 30958, 262145 + 30987 do
		globals.set_float(i, 100000)
	end
end)
LSCM:add_button("Unlock Trade Prices for Headlights", function() stats_set_packed_bools(24980, 24991, true) end)

LSCM:add_button("Unlock Prize Ride",
	function()
		stats.set_bool(MPX() .. "CARMEET_PV_CHLLGE_CMPLT", true)
		stats.set_bool(MPX() .. "CARMEET_PV_CLMED", false)
	end
)


-- Gun Van



local gun_van_tab = Silent:add_tab("Gun Van Menu")

local gunvan_locations = {
	vec3:new(-29.532, 6435.136, 31.162),
	vec3:new(1705.214, 4819.167, 41.75),
	vec3:new(1795.522, 3899.753, 33.869),
	vec3:new(1335.536, 2758.746, 51.099),
	vec3:new(795.583, 1210.78, 338.962),
	vec3:new(-3192.67, 1077.205, 20.594),
	vec3:new(-789.719, 5400.921, 33.915),
	vec3:new(-24.384, 3048.167, 40.703),
	vec3:new(2666.786, 1469.324, 24.237),
	vec3:new(-1454.966, 2667.503, 3.2),
	vec3:new(2340.418, 3054.188, 47.888),
	vec3:new(1509.183, -2146.795, 76.853),
	vec3:new(1137.404, -1358.654, 34.322),
	vec3:new(-57.208, -2658.793, 5.737),
	vec3:new(1905.017, 565.222, 175.558),
	vec3:new(974.484, -1718.798, 30.296),
	vec3:new(779.077, -3266.297, 5.719),
	vec3:new(-587.728, -1637.208, 19.611),
	vec3:new(733.99, -736.803, 26.165),
	vec3:new(-1694.632, -454.082, 40.712),
	vec3:new(-1330.726, -1163.948, 4.313),
	vec3:new(-496.618, 40.231, 52.316),
	vec3:new(275.527, 66.509, 94.108),
	vec3:new(260.928, -763.35, 30.559),
	vec3:new(-478.025, -741.45, 30.299),
	vec3:new(894.94, 3603.911, 32.56),
	vec3:new(-2166.511, 4289.503, 48.733),
	vec3:new(1465.633, 6553.67, 13.771),
	vec3:new(1101.032, -335.172, 66.944),
	vec3:new(149.683, -1655.674, 29.028),
}

local van_locations = {
	"Paleto Bay - 1",
	"Grapeseed - 2",
	"Sandy Shores - 3",
	"Grand Senora - 4",
	"Vinewood Hills - 5",
	"Chumash - 6",
	"Paleto Forest - 7",
	"Zancudo River - 8",
	"Power Station - 9",
	"Lago Zancudo - 10",
	"Grand Senora - 11",
	"El Burro Heights - 12",
	"Murrieta Heights - 13",
	"Elysian Island - 14",
	"Tataviam - 15",
	"La Mesa - 16",
	"Terminal - 17",
	"La Puerta - 18",
	"La Mesa - 19",
	"Del Perro - 20",
	"Magellan Ave - 21",
	"West Vinewood - 22",
	"Downtown Vinewood - 23",
	"Pillbox Hill - 24",
	"Little Seoul - 25",
	"Alamo Sea - 26",
	"North Chumash - 27",
	"Mount Chiliad - 28",
	"Mirror Park - 29",
	"Davis - 30",
}

-- Originally by SilentSalo
local weapons_data = {
	"WEAPON_KNIFE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BOTTLE",
	"WEAPON_DAGGER",
	"WEAPON_KNUCKLE",
	"WEAPON_MACHETE",
	"WEAPON_FLASHLIGHT",
	"WEAPON_SWITCHBLADE",
	"WEAPON_BATTLEAXE",
	"WEAPON_POOLCUE",
	"WEAPON_WRENCH",
	"WEAPON_HATCHET",
	"WEAPON_BAT",
	"WEAPON_CROWBAR",
	"WEAPON_STUNROD",
	"WEAPON_PISTOL",
	"WEAPON_PISTOL_MK2",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_SNSPISTOL",
	"WEAPON_SNSPISTOL_MK2",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_FLAREGUN",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_REVOLVER",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_DOUBLEACTION",
	"WEAPON_RAYPISTOL",
	"WEAPON_CERAMICPISTOL",
	"WEAPON_NAVYREVOLVER",
	"WEAPON_GADGETPISTOL",
	"WEAPON_STUNGUN_MP",
	"WEAPON_MICROSMG",
	"WEAPON_SMG",
	"WEAPON_SMG_MK2",
	"WEAPON_ASSAULTSMG",
	"WEAPON_COMBATPDW",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_MINISMG",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_GUSENBERG",
	"WEAPON_RAYCARBINE",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_ASSAULTRIFLE_MK2",
	"WEAPON_CARBINERIFLE",
	"WEAPON_CARBINERIFLE_MK2",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_SPECIALCARBINE_MK2",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_MILITARYRIFLE",
	"WEAPON_HEAVYRIFLE",
	"WEAPON_TACTICALRIFLE",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_MUSKET",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_DBSHOTGUN",
	"WEAPON_AUTOSHOTGUN",
	"WEAPON_COMBATSHOTGUN",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_PRECISIONRIFLE",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_RPG",
	"WEAPON_MINIGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_RAYMINIGUN",
	"WEAPON_EMPLAUNCHER",
	"WEAPON_RAILGUNXM3",
	"WEAPON_TECPISTOL",
	"WEAPON_FIREWORK",
	"WEAPON_BATTLERIFLE",
	"WEAPON_SNOWLAUNCHER",
}

local selected_loc = 0
local selected_slot = 0
local is_typing = false
local weapon_skins = false
local gta_plus_blip = false
local livery_lock = false
local weapon_editor_popup = false
local filter_text = ""
local weapon_name = ""

local gun_van_loc = 0

local function help_marker(text)
	ImGui.SameLine()
	ImGui.TextDisabled("(?)")
	if ImGui.IsItemHovered() then
		ImGui.BeginTooltip()
		ImGui.PushTextWrapPos(ImGui.GetFontSize() * 35)
		ImGui.TextUnformatted(text)
		ImGui.PopTextWrapPos()
		ImGui.EndTooltip()
	end
end

local function render_weapon_editor()
	ImGui.SetNextWindowSize(700, 420)
	ImGui.OpenPopup("Weapon Editor")

	if
		ImGui.BeginPopupModal(
			"Weapon Editor",
			weapon_editor_popup,
			ImGuiWindowFlags.NoResize | ImGuiWindowFlags.NoCollapse | ImGuiWindowFlags.NoMove | ImGuiWindowFlags.Modal
		)
	then
		selected_slot =
			ImGui.Combo("Select Slot", selected_slot, { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10" }, 10)

		filter_text = ImGui.InputText("Weapon Name", filter_text, 100)
		if ImGui.IsItemActive() then
			is_typing = true
		else
			is_typing = false
		end

		if ImGui.BeginListBox("##weapons", 450, 200) then
			for index, item in ipairs(weapons_data) do
				local display_name = weapons.get_weapon_display_name(item)
				if string.find(display_name:lower(), filter_text:lower()) then
					if ImGui.Selectable(display_name) then
						filter_text = display_name
						weapon_name = item
					end
				end
			end
			ImGui.EndListBox()
		end

		if ImGui.Button("Set Weapon") then
			local is_weapon_valid = weapons.get_weapon_display_name(weapon_name) ~= ""

			if is_weapon_valid then
				tunables.set_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. selected_slot, joaat(weapon_name))
			else
				gui.show_error("Gun Van", "Invalid weapon.")
			end
		end

		ImGui.SameLine()

		if ImGui.Button("Remove Weapon") then
			tunables.set_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. selected_slot, 0)
		end

		if ImGui.Button("Close") then
			selected_slot = 0
			filter_text = ""
			weapon_name = ""
			weapon_editor_popup = false
			ImGui.CloseCurrentPopup()
		end

		ImGui.EndPopup()
	end
end

script.register_looped("Gun Van", function()
	gun_van_loc = globals.get_int(2652592 + 2671)

	if is_typing then
		PAD.DISABLE_ALL_CONTROL_ACTIONS(0)
	end

	if weapon_skins then
		tunables.set_bool(1490225691, false)
	end

	if livery_lock then
		local value = locals.get_int("gunclub_shop", 142 + 747) | (1 << 8)
		locals.set_int("gunclub_shop", 142 + 747, value)
	end

	if gta_plus_blip then
		local gun_van_sprite = HUD.GET_FIRST_BLIP_INFO_ID(844)

		tunables.set_float(15999531, 10000.0)
		if HUD.DOES_BLIP_EXIST(gun_van_sprite) then
			HUD.SET_BLIP_AS_SHORT_RANGE(gun_van_sprite, false)
		end
	end
end)

gun_van_tab:add_imgui(function()
	if weapon_editor_popup then
		render_weapon_editor()
	end

	ImGui.Text("Current Location: " .. (gun_van_loc ~= -1 and gun_van_loc + 1 or "N/A"))

	ImGui.SetNextItemWidth(265)
	selected_loc = ImGui.Combo("##selected_loc", selected_loc, van_locations, 30)

	ImGui.SameLine()

	if ImGui.Button("Set New Gun Van Location") then
		globals.set_int(2652592 + 2671, selected_loc)
	end

	ImGui.SameLine()

	if ImGui.Button("Teleport") then
		script.run_in_fiber(function()
			local coords = gunvan_locations[selected_loc + 1]
			PED.SET_PED_COORDS_KEEP_VEHICLE(self.get_ped(), coords.x, coords.y, coords.z)
		end)
	end

	weapon_skins, on_tick = ImGui.Checkbox("Weapon Skins", weapon_skins)
	help_marker("Enables the special liveries for Knife and Baseball Bat.")

	if on_tick then
		if not weapon_skins then
			tunables.set_bool(1490225691, true)
		end
	end

	livery_lock, on_tick = ImGui.Checkbox("Remove Livery Lock", livery_lock)
	help_marker(
		"Removes the hard-coded lock on special weapon liveries, such as Season's Greetings, Employee of the Month etc."
	)

	if on_tick then
		if not livery_lock then
			local value = locals.get_int("gunclub_shop", 142 + 747) & ~(1 << 8)
			locals.set_int("gunclub_shop", 142 + 747, value)
		end
	end

	gta_plus_blip, on_tick = ImGui.Checkbox("Blip Always Visible", gta_plus_blip)
	help_marker("The Gun Van will always be blipped on the map, just like in GTA+.")

	if on_tick then
		if not gta_plus_blip then
			tunables.set_float(15999531, 500.0)
		end
	end

	discount, on_tick = ImGui.Checkbox("Jewish Trade Skills (-10%)", discount)
	help_marker("Allows 10% off off any weapon in gun van")

	if on_tick then
		if discount then
			globals_set_ints(GVADg + 1, GVADg + 9, 1, 1036831744)
			globals_set_ints(GVTDg + 1, GVTDg + 3, 1, 1036831744)
			globals_set_ints(GVWDg + 1, GVWDg + 5, 1, 1036831744)
		else
			globals_set_ints(GVADg + 1, GVADg + 9, 1, 0)
			globals_set_ints(GVTDg + 1, GVTDg + 3, 1, 0)
			globals_set_ints(GVWDg + 1, GVWDg + 5, 1, 0)
		end
	end
	ImGui.Separator()

	if ImGui.TreeNode("Weapons") then
		for i = 0, 9 do
			local weapon_hash = tunables.get_int("XM22_GUN_VAN_SLOT_WEAPON_TYPE_" .. i)

			if weapon_hash ~= 0 then
				local weapon_name = weapons.get_weapon_display_name(weapon_hash)
				local weapon_discount =
					math.floor(tunables.get_float("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_" .. i) * 100.0)

				ImGui.Text(i + 1 .. " - " .. weapon_name .. " (" .. weapon_discount .. "%)")
			end
		end

		if ImGui.Button("Edit Weapons") then
			weapon_editor_popup = true
		end

		ImGui.Separator()
		ImGui.TreePop()
	end

	if ImGui.TreeNode("Throwables") then
		for i = 0, 2 do
			local throwable_hash = tunables.get_int("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_" .. i)

			if throwable_hash ~= 0 then
				local throwable_name = weapons.get_weapon_display_name(throwable_hash)
				local throwable_discount =
					math.floor(tunables.get_float("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_" .. i) * 100.0)

				ImGui.Text(i + 1 .. " - " .. throwable_name .. " (" .. throwable_discount .. "%)")
			end
		end

		ImGui.Separator()
		ImGui.TreePop()
	end

	if ImGui.TreeNode("Body Armor") then
		local armour_discounts = {}

		for i = 0, 4 do
			armour_discounts[i + 1] = math.floor(tunables.get_float("XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_" .. i) * 100.0)
		end

		ImGui.Text("Super Light Armor (" .. armour_discounts[1] .. "%)")
		ImGui.Text("Light Armor (" .. armour_discounts[2] .. "%)")
		ImGui.Text("Standard Armor (" .. armour_discounts[3] .. "%)")
		ImGui.Text("Heavy Armor (" .. armour_discounts[4] .. "%)")
		ImGui.Text("Super Heavy Armor (" .. armour_discounts[5] .. "%)")

		ImGui.TreePop()
	end
end)




-- No Needs --
local NoNeed = Silent:add_tab("No Need")
NoNeed:add_text("This Script are generally not worth")
NoNeed:add_separator()
NoNeed:add_text("Bottom Dollars")
NoNeed:add_text("Standard Bounty Targets")
NoNeed:add_button("All to Max Payout",
function ()
	stats.set_int(MPX() .. "BOUNTY24_STD_TARG_RWD_0", 90000)
	stats.set_int(MPX() .. "BOUNTY24_STD_TARG_RWD_1", 90000)
	stats.set_int(MPX() .. "BOUNTY24_STD_TARG_RWD_2", 90000)
end
)
NoNeed:add_button("Set All Prisoner Out",
function ()
	stats.set_int(MPX() .. "BAIL_PRISONER_POSIX0", 0)
	stats.set_int(MPX() .. "BAIL_PRISONER_POSIX1", 0)
	stats.set_int(MPX() .. "BAIL_PRISONER_POSIX2", 0)
end
)
NoNeed:add_text("Note: Do that outside Bail Office")
			


-- Credits --
local Credits = Silent:add_tab("Credits")
Credits:add_text("Developer: SilentSalo", null)
Credits:add_text("Helpers: gaymer, Big Smoke, Slon")
Credits:add_text("Helpers: CasinoPacino, Bababoiiiii")
Credits:add_text("Helpers: Amnesia, jschaotic, Killa`B")
Credits:add_text("Helpers: Mr. Robot, L7NEG, LUKY6464")
Credits:add_text("Helpers: ShinyWasabi, gir489returns")
Credits:add_text("Helpers: Unkn0wnXit, Zeiger, Pewpew")
Credits:add_text("Helpers: ObratniyVasya, CheatChris")
Credits:add_text("Helpers: Rostal")
Credits:add_text("Helpers: VodisAreThere65715")
Credits:add_text("Helpers: Someone")
Credits:add_text("Helpers: Yimura, L7Neg, Loled69, Alestarov, gir489returns, TheKuter, RazorGamerX, USBMenus")