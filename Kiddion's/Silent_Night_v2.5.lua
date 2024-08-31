---[[ Developer: Silent ]]---

require_game_build(3274) -- GTA Online v1.69 (build 3274)

--Packed Bools--

local stat_ranges     	       = {
	{stat = 			 "PSTAT_BOOL", start =     0, finish =   191},
	{stat =                     "???", start =   192, finish =   512},
	{stat = 		  "MP_PSTAT_BOOL", start =   513, finish =   704},
	{stat =                     "???", start =   705, finish =  2918},
	{stat = 		"MP_TUPSTAT_BOOL", start =  2919, finish =  3110},
	{stat = 		   "TUPSTAT_BOOL", start =  3111, finish =  3878},
	{stat =                     "???", start =  3879, finish =  4206},
	{stat =            "NGPSTAT_BOOL", start =  4207, finish =  4334},
	{stat =         "MP_NGPSTAT_BOOL", start =  4335, finish =  4398},
	{stat =                     "???", start =  4399, finish =  6028},
	{stat =         "NGTATPSTAT_BOOL", start =  6029, finish =  6412},
	{stat =                     "???", start =  6413, finish =  7320},
	{stat =      "MP_NGDLCPSTAT_BOOL", start =  7321, finish =  7384},
	{stat =         "NGDLCPSTAT_BOOL", start =  7385, finish =  7640},
	{stat =                     "???", start =  7641, finish =  9360},
	{stat =       "DLCBIKEPSTAT_BOOL", start =  9361, finish =  9552},
	{stat =                     "???", start =  9553, finish = 15368},
	{stat =        "DLCGUNPSTAT_BOOL", start = 15369, finish = 15560},
	{stat =                     "???", start = 15561, finish = 15561},
	{stat =        "GUNTATPSTAT_BOOL", start = 15562, finish = 15945},
	{stat =   "DLCSMUGCHARPSTAT_BOOL", start = 15946, finish = 16009},
	{stat =                     "???", start = 16010, finish = 18097},
	{stat =       "GANGOPSPSTAT_BOOL", start = 18098, finish = 18161},
	{stat =                     "???", start = 18162, finish = 22065},
	{stat =   "BUSINESSBATPSTAT_BOOL", start = 22066, finish = 22193},
	{stat =                     "???", start = 22194, finish = 24961},
	{stat =     "ARENAWARSPSTAT_BOOL", start = 24962, finish = 25537},
	{stat =                     "???", start = 25538, finish = 26809},
	{stat =        "CASINOPSTAT_BOOL", start = 26810, finish = 27257},
	{stat =                     "???", start = 27256, finish = 28097},
	{stat =     "CASINOHSTPSTAT_BOOL", start = 28098, finish = 28353},
	{stat =                     "???", start = 28354, finish = 28354},
	{stat =   "HEIST3TATTOOSTAT_BOOL", start = 28355, finish = 28482},
	{stat =                     "???", start = 28483, finish = 30226},
	{stat =          "SU20PSTAT_BOOL", start = 30227, finish = 30354},
	{stat =     "SU20TATTOOSTAT_BOOL", start = 30355, finish = 30482},
	{stat =                     "???", start = 30483, finish = 30514},
	{stat =       "HISLANDPSTAT_BOOL", start = 30515, finish = 30706},
	{stat =                     "???", start = 30707, finish = 31706},
	{stat =         "TUNERPSTAT_BOOL", start = 31707, finish = 32282},
	{stat =         "FIXERPSTAT_BOOL", start = 32283, finish = 32410},
	{stat =    "FIXERTATTOOSTAT_BOOL", start = 32411, finish = 32474},
	{stat =                     "???", start = 32475, finish = 34122},
	{stat =          "GEN9PSTAT_BOOL", start = 34123, finish = 34250},
	{stat =      "DLC12022PSTAT_BOOL", start = 34251, finish = 34762},
	{stat =                     "???", start = 34763, finish = 36626},
	{stat =      "DLC22022PSTAT_BOOL", start = 36627, finish = 36946},
	{stat =                     "???", start = 36947, finish = 41250},
	{stat = "DLC22022TATTOOSTAT_BOOL", start = 41251, finish = 41314},
	{stat =      "DLC12023PSTAT_BOOL", start = 41315, finish = 42082},
	{stat =                     "???", start = 42083, finish = 42106},
	{stat =      "DLC22023PSTAT_BOOL", start = 42107, finish = 42298},
	{stat =                     "???", start = 42299, finish = 51058},
	{stat = "DLC22023TATTOOSTAT_BOOL", start = 51059, finish = 51186}
}

--Global Functions--

function MPX()
	return "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR") .. "_"
end

function get_localplayer_id()
	return localplayer:get_player_id()
end

function teleport(x, y, z, yaw, roll, pitch)
	if localplayer ~= nil then
		localplayer:set_position(x, y, z)
		localplayer:set_rotation(yaw, roll, pitch)
	end
end

function change_session(session)
	globals.set_int(CSg1, session)
	if session == -1 then
		globals.set_int(CSg3, -1)
	end
	sleep(0.5)
	globals.set_int(CSg2, 1)
	sleep(0.5)
	globals.set_int(CSg2, 0)
end

function get_stat_info(packed_bool)
	for _, info in ipairs(stat_ranges) do
		if packed_bool >= info.start and packed_bool <= info.finish then
			return info
		end
	end
end

function stats_set_packed_bool(packed_bool, bool)
	local stat_info = get_stat_info(packed_bool)
	local stat = stat_info.stat
	if stat ~= "???" then
		local bool_start  = stat_info.start
		local bool_finish = stat_info.finish
		local temp_bool   = bool_start
		local index       = 0
		local bit         = nil
		for _ = bool_start, bool_finish do
			for j = 0, 63 do
				if temp_bool + j == packed_bool then
					bit = j
					break
				end
			end
			if bit ~= nil then
				break
			end
			temp_bool = temp_bool + 64
			index = index + 1
		end
		stats.set_bool_masked(MPX() .. stat .. index, bool, bit)
	end
end

function stats_set_packed_bools(packed_bool_start, packed_bool_finish, bool)
	for i = packed_bool_start, packed_bool_finish do
		stats_set_packed_bool(i, bool)
	end
end

function globals_set_ints(global_start, global_finish, step, integer)
	for i = global_start, global_finish, step do
		globals.set_int(i, integer)
	end
end

function globals_set_bools(global_start, global_finish, step, bool)
	for i = global_start, global_finish, step do
		globals.set_bool(i, bool)
	end
end

function get_id_from_table(table, index)
	return table[index].id
end

function get_name_from_table_by_stat(message, table, stat, default_name)
	local current_stat = stats.get_int(MPX() .. stat)
	local array_names = get_names_from_table(table)
	local current_name = default_name
	for i = 1, #table do
		if current_stat == get_id_from_table(table, i) then
			current_name = array_names[i + 1]
			break
		end
	end
	return message .. ": " .. current_name
end

function get_names_from_table(tbl)
	local names = {"Select"}
	for _, item in pairs(tbl) do
		table.insert(names, item.name)
	end
	return names
end

function create_list(n)
    local list = {}
    for i = 0, n do
        table.insert(list, i)
    end
    return list
end

function format_money(n)
	n = tostring(n)
	return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

function null() end

--Scripts--

ASS   = script("appsecuroserv")
AMN   = script("am_mp_nightclub")
AMW   = script("am_mp_warehouse")
FMC   = script("fm_mission_controller")
FMC20 = script("fm_mission_controller_2020")
THP   = script("tuner_planning")
VP    = script("vehrob_planning")
HIP   = script("heist_island_planning")
GCHP  = script("gb_casino_heist_planning")
GCS   = script("gb_contraband_sell")
GCB   = script("gb_contraband_buy")
GB    = script("gb_gunrunning")
GS    = script("gb_smuggler")
CLW   = script("casino_lucky_wheel")
BJ    = script("blackjack")
CR    = script("casinoroulette")
CS    = script("casino_slots")
TCP   = script("three_card_poker")
GSH   = script("gunclub_shop")

--Globals--

FMg     = 262145 						-- free mode 				    	   		// Tunable: CASH_MULTIPLIER
XMg     = FMg + 1 						-- xp multiplier 			    	   		// Tunable: XP_MULTIPLIER
APg     = FMg + 31084 					-- agency payout 			    	   		// Tunable: FIXER_FINALE_LEADER_CASH_REWARD
ACKg    = FMg + 31036 					-- agency cooldown killer       	   		// Tunable: FIXER_STORY_COOLDOWN_POSIX"
ASPg1   = FMg + 30338 + 1 				-- auto shop payout 1 		    	   		// Tunable: TUNER_ROBBERY_LEADER_CASH_REWARD0
ASPg2   = FMg + 30338 + 8 				-- auto shop payout 2 		    	   		// Tunable: TUNER_ROBBERY_LEADER_CASH_REWARD7
ASFg    = FMg + 30334 					-- auto shop fee  			    	   		// Tunable: TUNER_ROBBERY_CONTACT_FEE
ASCKg   = FMg + 30357 					-- auto shop cooldown  		    	   		// Tunable: TUNER_ROBBERY_COOLDOWN_TIME
ACg1    = 1928958 + 1 + 1 				-- apartment player 1 cut
ACg2    = 1928958 + 1 + 2 				-- apartment player 2 cut
ACg3    = 1928958 + 1 + 3 				-- apartment player 3 cut
ACg4    = 1928958 + 1 + 4 				-- apartment player 4 cut
ACg5    = 1930926 + 3008 + 1 			-- local apartment player 1 cut
ACFg1   = 1930926 + 192
ACFg2   = 1930926 + 190
AUAJg1  = FMg + 9101 					-- apartment unlock all jobs 1  	   		// Tunable: ROOT_ID_HASH_THE_FLECCA_JOB
AUAJg2  = FMg + 9106 					-- apartment unlock all jobs 2  	   		// Tunable: ROOT_ID_HASH_THE_PRISON_BREAK
AUAJg3  = FMg + 9113 					-- apartment unlock all jobs 3  	   		// Tunable: ROOT_ID_HASH_THE_HUMANE_LABS_RAID
AUAJg4  = FMg + 9119 					-- apartment unlock all jobs 4  	   		// Tunable: ROOT_ID_HASH_SERIES_A_FUNDING
AUAJg5  = FMg + 9125 					-- apartment unlock all jobs 5  	   		// Tunable: ROOT_ID_HASH_THE_PACIFIC_STANDARD_JOB
CPCg1   = 1971648 + 831 + 56 + 1 		-- cayo perico player 1 cut
CPCg2   = 1971648 + 831 + 56 + 2 		-- cayo perico player 2 cut
CPCg3   = 1971648 + 831 + 56 + 3		-- cayo perico player 3 cut
CPCg4   = 1971648 + 831 + 56 + 4 		-- cayo perico player 4 cut
GCg     = 2685444 + 6639 				-- global cut 						   		// Guide:   fVar1 = (fVar1 * (fVar2 / 100f));
CPBg    = FMg + 29211 					-- cayo perico bag  				   		// Tunable: HEIST_BAG_MAX_CAPACITY
DCCg1   = 1964849 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut
DCCg2   = 1964849 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut
DCCg3   = 1964849 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut
DCCg4   = 1964849 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut
DCg1    = 1960755 + 812 + 50 + 1        -- doomsday player 1 cut
DCg2    = 1960755 + 812 + 50 + 2        -- doomsday player 2 cut
DCg3    = 1960755 + 812 + 50 + 3        -- doomsday player 3 cut
DCg4    = 1960755 + 812 + 50 + 4        -- doomsday player 4 cut
SYRTg   = FMg + 33023 					-- salvage yard robbery type 		   		// Tunable: SALV23_VEHICLE_ROBBERY_0
SYCKg   = FMg + 33027                   -- salvage yard can keep 			   		// Tunable: SALV23_VEHICLE_ROBBERY_CAN_KEEP_0
SYVTg   = FMg + 33031                   -- salvage yard vehicle type    	   		// Tunable: SALV23_VEHICLE_ROBBERY_ID_0
SYVVg   = FMg + 33035                   -- salvage yard vehicle value   	   		// Tunable: SALV23_VEHICLE_ROBBERY_VALUE_0
SYWCg   = FMg + 33054                   -- salvage yard weekly cooldown 	   		// Tunable: SALV23_VEH_ROBBERY_WEEK_ID
SYCg1   = FMg + 33064                   -- salvage yard cooldown 			   		// Tunable: SALV23_VEH_ROB_COOLDOWN_TIME
SYCg2   = FMg + 33065                   -- salvage yard cooldown 			   		// Tunable: SALV23_CFR_COOLDOWN_TIME
SYCPg   = FMg + 33075                   -- salvage yard claim price 		   		// Tunable: SALV23_VEHICLE_CLAIM_PRICE
SYCPDg  = FMg + 33076                   -- salvage yard claim price discount   		// Tunable: SALV23_VEHICLE_CLAIM_PRICE_FORGERY_DISCOUNT
SYSMg   = FMg + 33043                   -- salvage yard salvage multiplier     		// Tunable: SALV23_VEHICLE_SALVAGE_VALUE_MULTIPLIER
SYSPg   = FMg + 34961                   -- salvage yard setup price 		   		// Tunable: 71522671
CMACLg1 = FMg + 26534                   -- casino master acquire chips limit 1 		// Tunable: VC_CASINO_CHIP_MAX_BUY
CMACLg2 = FMg + 26535                   -- casino master acquire chips limit 2 		// Tunable: VC_CASINO_CHIP_MAX_BUY_PENTHOUSE
HCVPg   = FMg + 22492                   -- hangar cargo vip payout 			   		// Tunable: SMUG_SELL_PRICE_PER_CRATE_MIXED
HCVRCg  = FMg + 22475                   -- hangar cargo vip ron's cut 		   		// Tunable: SMUG_SELL_RONS_CUT
CRg     = 2707357 + 36 					-- cash remover 					   		// Guide:   VEH_WHS_RP_A
NHCNSg  = FMg + 23969 					-- nightclub helper cargo n shipments  		// Tunable: BB_BUSINESS_BASIC_VALUE_CARGO
NHSGg   = FMg + 23963 					-- nightclub helper sporting goods 	   		// Tunable: BB_BUSINESS_BASIC_VALUE_WEAPONS
NHSAIg  = FMg + 23964 					-- nightclub helper s.a. imports 	   		// Tunable: BB_BUSINESS_BASIC_VALUE_COKE
NHPRg   = FMg + 23965 					-- nightclub helper pharmaceutical reseacrh // Tunable: BB_BUSINESS_BASIC_VALUE_METH
NHOPg   = FMg + 23966 					-- nightclub helper organic produce 		// Tunable: BB_BUSINESS_BASIC_VALUE_WEED
NHPNCg  = FMg + 23967 					-- nightclub helper printing n copying 		// Tunable: BB_BUSINESS_BASIC_VALUE_FORGED_DOCUMENTS
NHCCg   = FMg + 23968 					-- nightclub helper cash creation 			// Tunable: BB_BUSINESS_BASIC_VALUE_COUNTERFEIT_CASH
NHCKg1  = FMg + 24026 					-- nightclub helper cooldown killer 1 		// Tunable: BB_CLUB_MANAGEMENT_CLUB_MANAGEMENT_MISSION_COOLDOWN
NHCKg2  = FMg + 24067 					-- nightclub helper cooldown killer 2 		// Tunable: BB_SELL_MISSIONS_MISSION_COOLDOWN
NHCKg3  = FMg + 24068					-- nightclub helper cooldown killer 3 		// Tunable: BB_SELL_MISSIONS_DELIVERY_VEHICLE_COOLDOWN_AFTER_SELL_MISSION
CSg1    = 1575035 						-- change session (type) 1 					// Guide:   NETWORK::UGC_SET_USING_OFFLINE_CONTENT(false);
CSg2    = 1574589 						-- change session (switch) 2 				// Guide:   MP_POST_MATCH_TRANSITION_SCENE
CSg3    = 1574589 + 2 					-- change session (quit) 3 					// Guide:   MP_POST_MATCH_TRANSITION_SCENE
SCVPg   = FMg + 15732 					-- special cargo vip price 					// Tunable: EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1
SCVBCg  = FMg + 15499 					-- special cargo vip buy cooldown  			// Tunable: EXEC_BUY_COOLDOWN
SCVScg  = FMg + 15500 					-- special cargo vip sell cooldown 			// Tunable: EXEC_SELL_COOLDOWN
BTEg1   = 4537455 						-- bypass transaction error 1
BTEg2   = 4537456 						-- bypass transaction error 2
BTEg3   = 4537457 						-- bypass transaction error 3
CLg     = 1964419 						-- cheap loop 								// Guide:   MPPLY_CASINO_MEM_BONUS
TTg     = 4537311 						-- trigger transaction
NLSCg   = FMg + 23680 					-- night loop safe capacity  				// Tunable: NIGHTCLUBMAXSAFEVALUE
NLISg   = FMg + 23657 					-- night loop income start 	 				// Tunable: NIGHTCLUBINCOMEUPTOPOP5
NLIEg   = FMg + 23676 					-- night loop income end	 				// Tunable: NIGHTCLUBINCOMEUPTOPOP100
ORg     = 1962237 						-- orbital refund 							// Guide:   ORB_CAN_QUIT1
AUg     = 4543384 + 1 					-- achievements unlocker 					// Guide:   PLAYER::HAS_ACHIEVEMENT_BEEN_PASSED(iParam0) && iParam1 == 1
CUg     = 2708057 						-- collectibles unlocker					// Guide:   cellphone_badger
AFo     = CUg + 209 					-- action figures offset
LDOo    = CUg + 421 					-- ld organics offset
PCo     = CUg + 210 					-- plating cards offset
SJo     = CUg + 211 					-- signal jammers offset
So      = CUg + 523 					-- snowmen offset
MPo     = CUg + 418 					-- movie props offset
JOLo    = CUg + 514 					-- jack o lanterns offset
SCCg    = FMg + 18919 					-- sex changer change appearance cooldown	// Tunable: CHARACTER_APPEARANCE_COOLDOWN
BUCg1   = FMg + 21264 					-- bunker unlocker cooldown 1				// Tunable: GR_RESEARCH_CAPACITY
BUCg2   = FMg + 21265 					-- bunker unlocker cooldown 2 				// Tunable: GR_RESEARCH_PRODUCTION_TIME
BUCg3   = FMg + 21266 					-- bunker unlocker cooldown 3 				// Tunable: GR_RESEARCH_UPGRADE_EQUIPMENT_REDUCTION_TIME
BUCg4   = FMg + 21267 					-- bunker unlocker cooldown 4 				// Tunable: GR_RESEARCH_UPGRADE_STAFF_REDUCTION_TIME
BUAg1   = FMg + 21268 					-- bunker unlocker additional 1 			// Tunable: GR_RESEARCH_MATERIAL_PRODUCT_COST
BUAg2   = FMg + 21269 					-- bunker unlocker additional 2 			// Tunable: GR_RESEARCH_MATERIAL_PRODUCT_COST_UPGRADE_REDUCTION
LSCMMg1 = FMg + 30958 					-- ls car meet multiplier 1 				// Tunable: TUNER_SPRINT_FIRST_TIME_BONUS_XP_MULTIPLIER
LSCMMg2 = FMg + 30987 					-- ls car meet multiplier 2 				// Tunable: TUNER_MERCH_PURCHASE_XP_MULTIPLIER
GSIg    = 1663174 						-- get supplies instantly 					// Guide:   OR_PSUP_DEL
GVLg    = 2652592 + 2671 + 1 			-- gun van location 						// Guide:   NETWORK::NETWORK_GET_NUM_PARTICIPANTS()
GVWSg   = FMg + 33273 					-- modify gun van weapon slot 				// Tunable: XM22_GUN_VAN_SLOT_WEAPON_TYPE_0
GVTSg   = FMg + 33295 					-- modify gun van throwable slot 1 			// Tunable: XM22_GUN_VAN_SLOT_THROWABLE_TYPE_0
GVWDg   = FMg + 33284 					-- modify gun van weapon slot 1 discount	// Tunable: XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_0
GVTDg   = FMg + 33299 					-- modify gun van throwable discount		// Tunable: XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_0
GVADg   = FMg + 33303 					-- modify gun van armor discount 			// Tunable: XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_0
GVSg    = FMg + 33309 					-- modify gun van skins for knife and bat 	// Tunable: 1490225691
EVg1    = FMg + 14700 					-- enable vehicles 1						// Tunable: ENABLE_LOWRIDER2_VIRGO3
EVg2    = FMg + 14705 					-- enable vehicles 2 						// Tunable: ENABLE_LOWRIDER2_SLAMVAN
EVg3    = FMg + 17352 					-- enable vehicles 3						// Tunable: ENABLE_BIKER_DEFILER
EVg4    = FMg + 17373 					-- enable vehicles 4						// Tunable: ENABLE_BIKER_RATBIKE
EVg5    = FMg + 18938 					-- enable vehicles 5						// Tunable: ENABLE_IE_VOLTIC2
EVg6    = FMg + 18962 					-- enable vehicles 6 						// Tunable: ENABLE_IE_TEMPESTA
EVg7    = FMg + 20828 					-- enable vehicles 7 						// Tunable: ENABLE_XA2
EVg8    = FMg + 20833 					-- enable vehicles 8 						// Tunable: ENABLE_NIGHTSHARK
EVg9    = FMg + 21598 					-- enable vehicles 9						// Tunable: ENABLE_ULTRALIGHT
EVg10   = FMg + 21617 					-- enable vehicles 10 						// Tunable: ENABLE_LAZER
EVg11   = FMg + 22540 					-- enable vehicles 11 						// Tunable: ENABLE_DELUXO
EVg12   = FMg + 22567 					-- enable vehicles 12 						// Tunable: ENABLE_KAMACHO
EVg13   = FMg + 23715 					-- enable vehicles 13 						// Tunable: ENABLE_HOTRING
EVg14   = FMg + 23730 					-- enable vehicles 14 						// Tunable: ENABLE_JESTER3
EVg15   = FMg + 23777 					-- enable vehicles 15 						// Tunable: ENABLE_TERBYTE
EVg16   = FMg + 23799 					-- enable vehicles 16 						// Tunable: ENABLE_HABANERO
EVg17   = FMg + 25366 					-- enable vehicles 17 						// Tunable: ENABLE_VEHICLE_TOROS
EVg18   = FMg + 25397 					-- enable vehicles 18 						// Tunable: ENABLE_VEHICLE_PARAGON
EVg19   = FMg + 26329 					-- enable vehicles 19 						// Tunable: ENABLE_VEHICLE_DEVESTE
EVg20   = FMg + 26330 					-- enable vehicles 20 						// Tunable: ENABLE_VEHICLE_VAMOS
EVg21   = FMg + 28169 					-- enable vehicles 21 						// Tunable: ENABLE_VEHICLE_FORMULA_PODIUM
EVg22   = FMg + 28191 					-- enable vehicles 22 						// Tunable: ENABLE_VEHICLE_BLAZER2
EVg23   = FMg + 28193 					-- enable vehicles 23 						// Tunable: ENABLE_VEHICLE_FORMULA
EVg24   = FMg + 28196 					-- enable vehicles 24 						// Tunable: ENABLE_VEHICLE_FORMULA2
EVg25   = FMg + 28201 					-- enable vehicles 25 						// Tunable: ENABLE_VEHICLE_IMORGEN
EVg26   = FMg + 28203 					-- enable vehicles 26 						// Tunable: ENABLE_VEHICLE_VSTR
EVg27   = FMg + 29156 					-- enable vehicles 27 						// Tunable: ENABLE_VEH_TIGON
EVg28   = FMg + 29162 					-- enable vehicles 28 						// Tunable: ENABLE_VEH_GAUNTLET5
EVg29   = FMg + 28828 					-- enable vehicles 29 						// Tunable: ENABLE_VEH_GLENDALE2
EVg30   = FMg + 28835 					-- enable vehicles 30 						// Tunable: ENABLE_VEH_DUKES3
EVg31   = FMg + 29589 					-- enable vehicles 31 						// Tunable: ENABLE_VEHICLE_TOREADOR
EVg32   = FMg + 29605 					-- enable vehicles 32 						// Tunable: ENABLE_VEHICLE_VERUS
EVg33   = FMg + 30305 					-- enable vehicles 33 						// Tunable: ENABLE_VEHICLE_TAILGATER2
EVg34   = FMg + 30321 					-- enable vehicles 34 						// Tunable: ENABLE_VEHICLE_COMET6
EVg35   = FMg + 31212 					-- enable vehicles 35 						// Tunable: ENABLE_VEHICLE_CHAMPION
EVg36   = FMg + 31226 					-- enable vehicles 36 						// Tunable: ENABLE_VEHICLE_BALLER7
EVg37   = FMg + 32412 					-- enable vehicles 37 						// Tunable: ENABLE_VEHICLE_OMNISEGT
EVg38   = FMg + 32430 					-- enable vehicles 38 						// Tunable: ENABLE_VEHICLE_SENTINEL4
EVg39   = FMg + 33374 					-- enable vehicles 39 						// Tunable: ENABLE_VEHICLE_ENTITY3
EVg40   = FMg + 33389 					-- enable vehicles 40 						// Tunable: ENABLE_VEHICLE_BOOR
EVg41   = FMg + 35172 					-- enable vehicles 41 						// Tunable: ENABLE_VEHICLE_FR36
EVg42   = FMg + 35191 					-- enable vehicles 42 						// Tunable: ENABLE_VEHICLE_BENSON2
EVg43   = FMg + 35405 					-- enable vehicles 43 						// Tunable: ENABLE_VEHICLE_YOSEMITE1500
EVg44   = FMg + 34323 					-- enable vehicles 44 						// Tunable: ENABLE_VEHICLE_EXEMPLAR
EVg45   = FMg + 34599 					-- enable vehicles 45 						// Tunable: ENABLE_VEHICLE_MONSTER
EVg46   = FMg + 34605 					-- enable vehicles 46 						// Tunable: ENABLE_VEHICLE_L35
EVg47   = FMg + 34617 					-- enable vehicles 47 						// Tunable: ENABLE_VEHICLE_BRIGHAM
EDVBg   = 2707347 						-- enable dripfeed vehicles bypass
EDVg1   = FMg + 35629 					-- enable dripfeed vehicles 1 				// Tunable: ENABLE_VEHICLE_ENVISAGE
EDVg2   = FMg + 35643 					-- enable dripfeed vehicles 2 				// Tunable: ENABLE_VEHICLE_PIZZABOY

--Locals--

FMCSHl   = 3236  		    -- fm_mission_controller script host 	  	   // Guide: MP_Reduce_Score_For_Emitters_Scene
FMC20SHl = 19376 		    -- fm_mission_controller_2020 script host 	   // Guide: bVar0 = NETWORK::NETWORK_IS_HOST_OF_THIS_SCRIPT();
AIFl1    = 38397 			-- agency instant finish 1 (outdated)
AIFl2    = 39772 			-- agency instant finish 2 (outdated)
ASRBl    = 383 			    -- auto shop reload board
ASIFl1   = 50150 + 1  	    -- auto shop instant finish 1
ASIFl2   = 50150 + 1770 + 1 -- auto shop finish 2
AIFl3    = 19746  		    -- apartment instant finish 1
AIFl4    = 28365 + 1 		-- apartment instant finish 2
AIFl5    = 31621 + 69 		-- apartment instant finish 3
AFHl     = 11778 + 24 		-- apartment fleeca hack
AFDl     = 10069 + 11 		-- apartment fleeca drill
CPRSl    = 1546 			-- cayo perico reload screen
CPFHl    = 24880 			-- cayo perico fingerprint hack			 	   // Guide: practice
CPPCCl   = 30939 + 3		-- cayo perico plasma cutter cut 			   // Guide: Overheat_Loop
CPSTCl   = 29700 			-- cayo perico drainage pipe cut			   // Guide: UT_WELD_PROMPT
CPIFl1   = 50150 			-- cayo perico instant finish 1
CPIFl2   = 50150 + 1770 + 1 -- cayo perico instant finish 2
DCRBl    = 185 			    -- diamond casino reload board
DCAl     = 10255 		    -- diamond casino autograbber 			 	   // Guide: DLC_HEIST_MINIGAME_PAC_CASH_GRAB_SCENE
DCASl    = 10255 + 14 	    -- diamond casino autograbber speed
DCFHl    = 53019 		    -- diamond casino fingerprint hack		 	   // Guide: DLC_HEIST_MINIGAME_PAC_CASH_GRAB_SCENE
DCKHl    = 54085 		    -- diamond casino keypad hack
DCDVDl1  = 10109 + 7 	    -- diamond casino drill vault door 1 	 	   // Guide: DLC_HEIST_MINIGAME_FLEECA_DRILLING_SCENE
DCDVDl2  = 10109 + 37 	    -- diamond casino drill vault door 2
DDBHl    = 1514 			-- doomsday data breaches hack
DDSHl    = 1271 + 135 		-- doomsday doomsday scenario hack
DIFl1    = 19746	 		-- doomsday instant finish 1
DIFl2    = 19746 + 1741 	-- doomsday instant finish 2
DIFl3    = 27489 + 859 + 18 -- doomsday instant finish 3
DIFl4    = 31621 + 69 		-- doomsday instant finish 4
DIFl5    = 31621 + 97 		-- doomsday instant finish 5
SYRSl    = 512 				-- salvage yard reload screen
BCISl    = 1211 + 774 		-- bunker crash instant sell
CMBJCl   = 116 				-- casino master bjackjack cards
CMBJDl   = 846 				-- casino master bjackjack decks
CMBJPTl  = 1776 			-- casino master bjackjack player's table
CMBJPTSl = 8 				-- casino master bjackjack player's table size
CMGLPl1  = 280 + 14 		-- casino master lucky wheel win state
CMGLPl2  = 280 + 45 		-- casino master lucky wheel prize state
CMPTl    = 749 				-- casino master poker table
CMPTSl   = 9 				-- casino master poker table size
CMPCl    = 116				-- casino master poker cards
CMPCDl   = 168 				-- casino master poker current deck
CMPACl   = 1038 			-- casino master poker anti cheat
CMPACDl  = 799 				-- casino master poker anti cheat deck
CMPDSl   = 55 				-- casino master poker deck size
CMRMTl   = 124 				-- casino master roulette master table
CMROTl   = 1357				-- casino master roulette outcomes table
CMRBTl   = 153 				-- casino master roulette ball table
CMSRRTl  = 1348 			-- casino master slots random results table
HCVISl1  = 1934 + 1078 		-- hangar cargo vip instant sell 1 			   // Guide: SMOT_HLPDROP2
HCVISl2  = 1934 + 768 		-- hangar cargo vip instant sell 2			   // Guide: MP_MISSION_COUNTDOWN_SOUNDSET
SCVAl1   = 741 				-- special cargo vip appsecuroserv 1 		   // Guide: MP_WH_SELL
SCVAl2   = 742 				-- special cargo vip appsecuroserv 2 		   // Guide: MP_WH_SELL
SCVAl3   = 560 				-- special cargo vip appsecuroserv 3 		   // Guide: MP_WH_SELL
SCVAl4   = 1138 			-- special cargo vip additional 1
SCVAl5   = 598 				-- special cargo vip additional 2
SCVAl6   = 1127 			-- special cargo vip additional 3
SCVMTl   = 545 + 7 			-- special cargo vip mission type
SCVISl   = 545 + 1 			-- special cargo vip instant sell
SCVIBl1  = 603 + 5 			-- special cargo vip instant buy 1
SCVIBl2  = 603 + 1 			-- special cargo vip instant buy 2
SCVIBl3  = 603 + 191 		-- special cargo vip instant buy 3
SCVIBl4  = 603 + 192 		-- special cargo vip instant buy 4
NLCl     = 181 + 32 + 1 	-- night loop collect local
BLWLl    = 142 + 747 		-- bypass locked weapon livery

--Global Variables--

INT_MAX = 2147483646 -- max integer value
SPACE   = "➖ | ➖" -- just space
README  = "Read Me"  -- just read me

--"for" Tables--

local list_0_7  = create_list(7)
local list_0_8  = create_list(8)
local list_0_9  = create_list(9)
local list_0_24 = create_list(24)
local states       = {}
local def_nums 	   = {}
local def_num_curs = {}
for i = 1, 99 do
    states["i" .. i] = 1
	states["b" .. i] = false
end
for i = 1, 99 do
    def_nums[i] 	= list_0_9[1]
    def_num_curs[i] = 1
end

--Array Tables--

local cut_presets     	       = {
	{id =  85, name =  "85 All"},
	{id = 100, name = "100 All"}
}
local cut_presets_apartment = {
	{id =  85 , name =  "85 All (Any)"              },
	{id = 100 , name = "100 All (Any)"              },
	{id = 7453, name = "7453 Fleeca Job (Normal)"   },
	{id = 2142, name = "2142 Prison Break (Normal)" },
	{id = 1587, name = "1587 Humane Labs (Normal)"  },
	{id = 2121, name = "2121 Series A Fun. (Normal)"},
	{id = 1000, name = "1000 Pacific Job (Normal)"  }
}
local agency_contracts 	       = {
	{id =    3, name = 			"The Nightclub"},
	{id =    4, name = 	 		   "The Marina"},
	{id =   12, name =		   "Nightlife Leak"},
	{id =   28, name =		 "The Country Club"},
	{id =   60, name = 			   "Guest List"},
	{id =  124, name = 		"High Society Leak"},
	{id =  252, name =				    "Davis"},
	{id =  508, name = 			   "The Ballas"},
	{id = 2044, name = "The South Central Leak"},
	{id = 4095, name = 			  "Studio Time"},
	{id =   -1, name = 	  "Don't Fuck With Dre"}
}
local cayo_perico_approaches   = {
	{id = 65283, name = "Kosatka"		     },
	{id = 65413, name = "Alkonost"		     },
	{id = 65289, name = "Velum"			     },
	{id = 65425, name = "Stealth Annihilator"},
	{id = 65313, name = "Patrol Boat"	     },
	{id = 65345, name = "Longfin"		     },
	{id = 65535, name = "All Ways"		     }
}
local cayo_perico_difficulties = {
	{id = 126823, name = "Normal"},
	{id = 131055, name =   "Hard"}
}
local cayo_perico_storages 	   = {
	[0] = {4999.613281, -5749.913086, 13.540487, name = "Basement"},
	[1] = {5080.862305, -5756.300781, 14.529651, name =    "North"},
	[2] = {5030.722168, -5736.470703, 16.565588, name =     "West"},
	[3] = {5007.434570, -5787.255859, 16.531698, name =    "South"}
}
local cayo_perico_airport 	   = {
	[0] = {4441.150391, -4459.684082, 3.028352, name = "Loot #1"},
	[1] = {4503.571777, -4552.908203, 2.871924, name = "Loot #2"}
}
local cayo_perico_m_dock 	   = {
	[0] = {4923.965820, -5244.269531, 1.223746, name = "Loot #1"},
	[1] = {4998.924316, -5165.349121, 1.464225, name = "Loot #2"},
	[2] = {4962.446777, -5107.580078, 1.682065, name = "Loot #3"},
	[3] = {5194.393066, -5134.665039, 2.047954, name = "Loot #4"}
}
local cayo_perico_n_dock	   = {
	[0] = {5134.185547, -4611.440430, 1.196429, name = "Loot #1"},
	[1] = {5065.229492, -4591.959473, 1.555425, name = "Loot #2"},
	[2] = {5091.613281, -4682.282715, 1.107359, name = "Loot #3"}
}
local cayo_perico_towers	   = {
	[0] = {5266.797363, -5427.772461, 139.746445, name = "Communications Tower"},
	[1] = {4350.219238, -4577.410645,   2.899095, name =        "Control Tower"},
	[2] = {5108.437012, -4580.132812,  28.417776, name =       "Water Tower #1"},
	[3] = {4903.939453, -5337.220703,  34.306366, name = 	   "Water Tower #2"}
}
local cayo_perico_bolts 	   = {
	[0]  = {5097.452637, -4620.177734,  1.193875, name =  "#1"},
	[1]  = {4880.295898, -5112.941406,  1.053022, name =  "#2"},
	[2]  = {4537.624512, -4542.424805,  3.546365, name =  "#3"},
	[3]  = {5466.320801, -5230.169922, 25.993027, name =  "#4"},
	[4]  = {4075.548828, -4663.984863,  2.994547, name =  "#5"},
	[5]  = {4522.588867, -4509.868652,  3.188455, name =  "#6"},
	[6]  = {4506.013672, -4656.211914, 10.579565, name =  "#7"},
	[7]  = {4803.885742, -4317.895020,  6.201560, name =  "#8"},
	[8]  = {5071.072266, -4639.869629,  2.112077, name =  "#9"},
	[9]  = {5179.191895, -4669.967285,  5.832691, name = "#10"},
	[10] = {5214.377441, -5126.496582,  4.925748, name = "#11"},
	[11] = {4954.719727, -5180.171875,  2.966018, name = "#12"},
	[12] = {4903.507812, -5345.524414,  8.850177, name = "#13"},
	[13] = {4756.349609, -5539.995605, 17.625168, name = "#14"},
	[14] = {5365.069336, -5438.819824, 47.831707, name = "#15"}
}
local cayo_perico_powders	   = {
	[0] = {5404.111328, -5171.486328, 30.132875, name = "#1"},
	[1] = {5214.664551, -5131.837402,  4.938407, name = "#2"},
	[2] = {4924.137695, -5271.690918,  4.351841, name = "#3"}
}
local cayo_perico_hooks		   = {
	[0] = {4901.115723, -5332.090820,  27.841076, name =  "#1"},
	[1] = {4882.464355, -4487.831543,   8.713233, name =  "#2"},
	[2] = {5609.771484, -5653.084473,   8.651618, name =  "#3"},
	[3] = {5125.838379, -5095.626953,   0.893209, name =  "#4"},
	[4] = {4529.709961, -4700.855957,   3.120182, name =  "#5"},
	[5] = {3901.137451, -4690.617676,   2.826484, name =  "#6"},
	[6] = {5404.485840, -5170.345215,  30.130934, name =  "#7"},
	[7] = {5333.016602, -5264.369629,  31.446018, name =  "#8"},
	[8] = {5110.171387, -4579.133301,  28.417776, name =  "#9"},
	[9] = {5267.243164, -5429.493164, 139.747177, name = "#10"}
}
local cayo_perico_clothes	   = {
	[0] = {5059.213867, -4592.870605,  1.595251, name = "#1"},
	[1] = {4949.736328, -5320.138672,  6.776219, name = "#2"},
	[2] = {4884.802734, -5452.898926, 29.437197, name = "#3"},
	[3] = {4764.295898, -4781.471680,  2.501517, name = "#4"},
	[4] = {5170.228516, -4677.545898,  1.122545, name = "#5"},
	[5] = {5161.595215, -4993.595215, 11.394773, name = "#6"},
	[6] = {5128.021484, -5530.752930, 52.743076, name = "#7"}
}
local cayo_perico_boxes		   = {
	[0] = {5262.136719, -5432.140625,  64.297203, name = "#1"},
	[1] = {5265.863281, -5421.060059,  64.297638, name = "#2"},
	[2] = {5266.750977, -5426.982910, 139.746857, name = "#3"}
}
local cayo_perico_trucks	   = {
	[0] = {4517.433105, -4531.979492, 2.820656, name = "#1"},
	[1] = {5148.460938, -4620.099121, 1.108461, name = "#2"},
	[2] = {4901.324219, -5216.216797, 2.768269, name = "#3"},
	[3] = {5152.886719, -5143.897949, 0.997772, name = "#4"}
}
local diamond_casino_targets   = {
	{id = 0, name = "Cash"},
	{id = 2, name = "Arts"},
	{id = 1, name = "Gold"},
	{id = 3, name = "Diamonds"}
}
local diamond_casino_gunmans   = {
	{id = 1, name =    "Karl Abolaji (5%)", silent_loadout = {         "Micro SMG (Silenced)",      "Machine Pistol (Silenced)"}, bigcon_loadout = {		"Micro SMG", "Double Barrel Shotgun"}, aggressive_loadout = { "Sawed-Off Shotgun", 	 	"Heavy Revolver"}},
	{id = 3, name =    "Charlie Reed (7%)", silent_loadout = {       "Assault SMG (Silenced)",     "Bullpup Shotgun (Silenced)"}, bigcon_loadout = {   "Machine Pistol", 	   "Sweeper Shotgun"}, aggressive_loadout = {		"Assault SMG",  	  "Pump Shotgun"}},
	{id = 5, name = "Patrick McReary (8%)", silent_loadout = {                   "Combat PDW",       "Assault Rifle (Silenced)"}, bigcon_loadout = {"Sawed-Off Shotgun",		 "Compact Rifle"}, aggressive_loadout = {	  "Heavy Shotgun",   	     "Combat MG"}},
	{id = 2, name =    "Gustavo Mota (9%)", silent_loadout = {     "Carbine Rifle (Silenced)",     "Assault Shotgun (Silenced)"}, bigcon_loadout = {	"Carbine Rifle", 	   "Assault Shotgun"}, aggressive_loadout = {	  "Carbine Rifle",     "Assault Shotgun"}},
	{id = 4, name =  "Chester McCoy (10%)", silent_loadout = {"Pump Shotgun Mk II (Silenced)", "Carbine Rifle Mk II (Silenced)"}, bigcon_loadout = { 		"SMG Mk II",   "Bullpup Rifle Mk II"}, aggressive_loadout = {"Pump Shotgun Mk II", "Assault Rifle Mk II"}}
}
local diamond_casino_drivers   = {
	{id = 1, name =		  "Karim Denz (5%)", vehicles = {  "Issi Classic",			    "Asbo", "Blista Kanjo", "Sentinel Classic"}},
	{id = 4, name =		 "Zach Nelson (6%)", vehicles = {       "Manchez",		     "Stryder",		 "Defiler", 		  "Lectro"}},
	{id = 2, name = "Taliana Martinez (7%)", vehicles = { "Retinue Mk II", 	  "Drift Yosemite", 	   "Sugoi", 		 "Jugular"}},
	{id = 3, name = 	   "Eddie Toh (9%)", vehicles = {"Sultan Classic",  "Gauntlet Classic", 	   "Ellie",			  "Komoda"}},
	{id = 5, name =   "Chester McCoy (10%)", vehicles = {		  "Zhaba", 			 "Vagrant", 	  "Outlaw", 		  "Everon"}}
}
local diamond_casino_hackers   = {
	{id = 1, name =    "Rickie Lukens (3%)"},
	{id = 3, name = 	 "Yohan Blair (5%)"},
	{id = 2, name =  "Christian Feltz (7%)"},
	{id = 5, name = 	 "Page Harris (9%)"},
	{id = 4, name = "Avi Schwartzman (10%)"}
}
local diamond_casino_rooms	   = {
	[0] = {960.168335,   -14.924523,  78.754761, name = "Outside"},
	[1] = {2549.139893, -267.529999, -60.022987, name =  "Inside"}
}
local diamond_casino_vaults	   = {
	[0] = {2500.535889, -239.953308, -72.037086, name = "Outside Main"},
	[1] = {2515.317139, -238.673294, -72.037102, name =  "Inside Main"},
	[2] = {2521.761719, -287.359192, -60.022976, name = 	   "Daily"}
}
local diamond_casino_m_vaults  = {
	[0] = {2510.261475, -224.366699, -72.037163, name = "#1"},
	[1] = {2533.521729, -225.209366, -72.037163, name = "#2"},
	[2] = {2537.823486, -237.452118, -72.037163, name = "#3"},
	[3] = {2534.049561, -248.194931, -72.037163, name = "#4"},
	[4] = {2520.342773, -255.425705, -72.037178, name = "#5"},
	[5] = {2509.844238, -250.968552, -72.037170, name = "#6"}
}
local doomsday_acts 		   = {
	{id =   {503, 229383}, name =     "Data Breaches"},
	{id =   {240, 229378}, name =    "Bogdan Problem"},
	{id = {16368, 229380}, name = "Doomsday Scenario"}
}
local lucky_wheel_prizes 	   = {
	{id =  0, name =   "Clothing 1"},
	{id =  8, name =   "Clothing 2"},
	{id = 12, name =   "Clothing 3"},
	{id =  1, name =     "2,500 RP"},
	{id =  5, name =     "5,000 RP"},
	{id =  9, name =     "7,500 RP"},
	{id = 13, name =    "10,000 RP"},
	{id = 17, name =    "10,000 RP"},
	{id =  2, name = 	  "$20,000"},
	{id =  6, name = 	  "$30,000"},
	{id = 14, name = 	  "$40,000"},
	{id = 19, name = 	  "$50,000"},
	{id =  3, name = "10,000 Chips"},
	{id =  7, name = "15,000 Chips"},
	{id = 10, name = "20,000 Chips"},
	{id = 15, name = "25,000 Chips"},
	{id =  4, name =     "Discount"},
	{id = 11, name =      "Mystery"},
	{id = 18, name =      "Vehicle"}
}
local money_editor_earned_from = {
	{id =        "MPPLY_TOTAL_EVC", name = 			  "Total"},
	{id =        "MONEY_EARN_JOBS", name = 			   "Jobs"},
	{id = "MONEY_EARN_SELLING_VEH", name = "Selling Vehicles"},
	{id =     "MONEY_EARN_BETTING", name = 			"Betting"},
	{id =  "MONEY_EARN_GOOD_SPORT", name =		 "Good Sport"},
	{id =   "MONEY_EARN_PICKED_UP", name =		  "Picked Up"}
}
local money_editor_spent_on    = {
	{id =   		  "MPPLY_TOTAL_SVC", name = 		  	        "Total"},
	{id =    "MONEY_SPENT_WEAPON_ARMOR", name =    	      "Weapons n Armor"},
	{id = "MONEY_SPENT_VEH_MAINTENANCE", name =    "Vehicles n Maintenance"},
	{id =       "MONEY_SPENT_STYLE_ENT", name =     "Style n Entertainment"},
	{id =   "MONEY_SPENT_PROPERTY_UTIL", name =	     "Property n Utilities"},
	{id =    "MONEY_SPENT_JOB_ACTIVITY", name = "Job n Activity Entry Fees"},
	{id =         "MONEY_SPENT_BETTING", name = 			  	  "Betting"},
	{id = "MONEY_SPENT_CONTACT_SERVICE", name = 		 "Contact Services"},
	{id =      "MONEY_SPENT_HEALTHCARE", name = 		"Healthcare n Bail"},
	{id =  "MONEY_SPENT_DROPPED_STOLEN", name = 		"Dropped or Stolen"}
}
local nighclub_helper_cargoes  = {
	{id = "HUB_PROD_TOTAL_0", name = "Cargo n Shipments"},
	{id = "HUB_PROD_TOTAL_1", name = "Sporting Goods"},
	{id = "HUB_PROD_TOTAL_2", name = "S.A. Imports"},
	{id = "HUB_PROD_TOTAL_3", name = "Pharmac. Research"},
	{id = "HUB_PROD_TOTAL_4", name = "Organic Produce"},
	{id = "HUB_PROD_TOTAL_5", name = "Printing n Copying"},
	{id = "HUB_PROD_TOTAL_6", name = "Cash Creation"},
}
local special_cargo_vip_prices = {
	{id =   10000, name =       "Min"},
	{id = 3000000, name = 	   "Half"},
	{id = 6000000, name =       "Max"},
	{id = 3300000, name = "Max Legal"},
}
local char_stats_skills		   = {
	{skill = 		  "STAMINA", increase = "STAM"},
	{skill = "SHOOTING_ABILITY", increase =  "SHO"},
	{skill = 		 "STRENGTH", increase = "STRN"},
	{skill =  "STEALTH_ABILITY", increase =  "STL"},
	{skill =   "FLYING_ABILITY", increase =  "FLY"},
	{skill =  "WHEELIE_ABILITY", increase = "DRIV"},
	{skill =    "LUNG_CAPACITY", increase = "LUNG"}
}
local char_stats_skill_labels  = {
	{stat =          "STAMINA", label =  "Stamina: ", labels = {		  "(lung cancer)", 		  "(fat ass)",     "(athlete)",	     			"(pro)", 		  "(Usain Bolt)"}},
	{stat = "SHOOTING_ABILITY", label = "Shooting: ", labels = {   			 "(cataract)", 		 "(american)",   "(policeman)",  			"(pvp kid)", 		   "(John Wick)"}},
	{stat =		    "STRENGTH", label = "Strength: ", labels = {   			 "(anorexia)",		  "(weak af)", 		 "(boxer)",  			"(builder)", 			 "(Gym Rat)"}},
	{stat =  "STEALTH_ABILITY", label =  "Stealth: ", labels = {"(gorlock the destroyer)", "(drunk teenager)", 		 "(thief)", 		   "(assassin)", 			"(Agent 47)"}},
	{stat =   "FLYING_ABILITY", label =   "Flying: ", labels = {			 "(kamikaze)", 		   "(german)",		 "(pilot)", "(war thunder enjoyer)", "(«Maverick» Mitchell)"}},
	{stat =  "WHEELIE_ABILITY", label =  "Driving: ", labels = {			  "(grandma)", 		  "(amateur)", "(taxi driver)", 			"(drifter)", 		   "(Ken Block)"}},
	{stat =    "LUNG_CAPACITY", label = "Swimming: ", labels = {	   			 "(rock)", 			 "(wood)", 	 "(fisherman)", 	  	   "(dolphine)", 			"(Poseidon)"}}
}
local char_stats_lanterns 	   = {
	{id =   9, name =    "Mask"},
	{id = 199, name = "T-Shirt"}
}
local arena_war_vehicles	   = {
	{name = 	   		 "Taxi", tier =  24, points =   289},
	{name =   		"HVY Dozer", tier =  49, points =   539},
	{name =   		"Clown Van", tier =  74, points =   789},
	{name = 	  "Trashmaster", tier =  99, points =  1039},
	{name = "HVY Barracks Semi", tier = 199, points =  2039},
	{name = 		"HVY Mixer", tier = 299, points =  3039},
	{name = 	 "Space Docker", tier = 499, points =  5039},
	{name = 		  "Tractor", tier = 999, points = 10039}
}
local number_plate_chars	   = {
	".", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
	"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
	"W", "X", "Y", "Z"
}
local bad_sport_labels 		   = {
	{name =    "Add", value1 = -1, value2 = 60000, value3 =  true},
	{name = "Remove", value1 =  0, value2 =     0, value3 = false}
}
local gunvan_locations   	   = {
	[0]  = { -29.532,  6435.136,   31.162},
	[1]  = {1705.214,  4819.167,    41.75},
	[2]  = {1795.522,  3899.753,   33.869},
	[3]  = {1335.536,  2758.746,   51.099},
	[4]  = { 795.583,   1210.78,  338.962},
	[5]  = {-3192.67,  1077.205,   20.594},
	[6]  = { -789.719,  5400.921,  33.915},
	[7]  = { -24.384,   3048.167,  40.703},
	[8]  = {2666.786,   1469.324,  24.237},
	[9]  = {-1454.966,  2667.503,     3.2},
	[10] = { 2340.418,  3054.188,  47.888},
	[11] = { 1509.183, -2146.795,  76.853},
	[12] = { 1137.404, -1358.654,  34.322},
	[13] = { -57.208,  -2658.793,   5.737},
	[14] = { 1905.017,   565.222, 175.558},
	[15] = { 974.484,  -1718.798,  30.296},
	[16] = { 779.077,  -3266.297,   5.719},
	[17] = {-587.728,  -1637.208,  19.611},
	[18] = {  733.99,   -736.803,  26.165},
	[19] = {-1694.632,  -454.082,  40.712},
	[20] = {-1330.726, -1163.948,   4.313},
	[21] = { -496.618,    40.231,  52.316},
	[22] = {  275.527,    66.509,  94.108},
	[23] = {  260.928,   -763.35,  30.559},
	[24] = { -478.025,   -741.45,  30.299},
	[25] = {   894.94,  3603.911,   32.56},
	[26] = {-2166.511,  4289.503,  48.733},
	[27] = { 1465.633,   6553.67,  13.771},
	[28] = { 1101.032,  -335.172,  66.944},
	[29] = {  149.683, -1655.674,  29.028}
}
local gunvan_weapons    	   = {
	{hash =  -656458692, name = 		  "Knuckle Duster"}, -- 1
	{hash = -1786099057, name =   		    "Baseball Bat"}, -- 2
	{hash =  -853065399, name =    		 	  "Battle Axe"}, -- 3
	{hash =  -102323637, name = 				  "Bottle"}, -- 4
	{hash = -2067956739, name = 	  		     "Crowbar"}, -- 5
	{hash = -1834847097, name =   "Antique Cavalry Dagger"}, -- 6
	{hash = -1951375401, name = 			  "Flashlight"}, -- 7
	{hash =  1317494643, name = 				  "Hammer"}, -- 8
	{hash =  -102973651, name = 			     "Hatchet"}, -- 9
	{hash = -1716189206, name = 				   "Knife"}, -- 10
	{hash =  -581044007, name = 			     "Machete"}, -- 11
	{hash =  1737195953, name = 			  "Nightstick"}, -- 12
	{hash = -1810795771, name = 			    "Pool Cue"}, -- 13
	{hash =  -538741184, name = 		     "Switchblade"}, -- 14
	{hash =   419712736, name =			     "Pipe Wrench"}, -- 15
	{hash =   584646201, name = 			   "AP Pistol"}, -- 16
	{hash =   727643628, name = 		  "Ceramic Pistol"}, -- 17
	{hash =  1593441988, name = 		   "Combat Pistol"}, -- 18
	{hash = -1746263880, name =   "Double Action Revolver"}, -- 19
	{hash =  1198879012, name = 			   "Flare Gun"}, -- 20
	{hash =  1470379660, name = 		   "Perico Pistol"}, -- 21
	{hash =  -771403250, name = 		    "Heavy Pistol"}, -- 22
	{hash =  -598887786, name = 	     "Marksman Pistol"}, -- 23
	{hash = -1853920116, name = 		   "Navy Revolver"}, -- 24
	{hash =   453432689, name = 			 	  "Pistol"}, -- 25
	{hash = -1075685676, name = 		    "Pistol Mk II"}, -- 26
	{hash = -1716589765, name = 	 	 	  "Pistol .50"}, -- 27
	{hash = -1355376991, name = 		   "Up-n-Atomizer"}, -- 28
	{hash = -1045183535, name = 		  "Heavy Revolver"}, -- 29
	{hash =  -879347409, name =     "Heavy Revolver Mk II"}, -- 30
	{hash = -1076751822, name = 			  "SNS Pistol"}, -- 31
	{hash = -2009644972, name = 	    "SNS Pistol Mk II"}, -- 32
	{hash =   137902532, name = 		  "Vintage Pistol"}, -- 33
	{hash =  1171102963, name = 			    "Stun Gun"}, -- 34
	{hash =  -270015777, name = 		     "Assault SMG"}, -- 35
	{hash =   171789620, name = 			  "Combat PDW"}, -- 36
	{hash =  -619010992, name = 		  "Machine Pistol"}, -- 37
	{hash =   324215364, name = 			   "Micro SMG"}, -- 38
	{hash = -1121678507, name = 			    "Mini SMG"}, -- 39
	{hash =   736523883, name = 				     "SMG"}, -- 40
	{hash =  2024373456, name = 			   "SMG Mk II"}, -- 41
	{hash =   350597077, name = 		    "Tactical SMG"}, -- 42
	{hash = -1357824103, name =		      "Advanced Rifle"}, -- 43
	{hash = -1074790547, name = 		   "Assault Rifle"}, -- 44
	{hash =   961495388, name =      "Assault Rifle Mk II"}, -- 45
	{hash =  2132975508, name = 		   "Bullpup Rifle"}, -- 46
	{hash = -2066285827, name =      "Bullpup Rifle Mk II"}, -- 47
	{hash = -2084633992, name = 		   "Carbine Rifle"}, -- 48
	{hash =   -86904375, name =      "Carbine Rifle Mk II"}, -- 49
	{hash =  1649403952, name = 		   "Compact Rifle"}, -- 50
	{hash =  -947031628, name = 		     "Heavy Rifle"}, -- 51
	{hash = -1658906650, name = 		  "Military Rifle"}, -- 52
	{hash = -1063057011, name = 	     "Special Carbine"}, -- 53
	{hash = -1768145561, name =    "Special Carbine Mk II"}, -- 54
	{hash =  -774507221, name = 	     "Service Carbine"}, -- 55
	{hash =  1924557585, name = 		    "Battle Rifle"}, -- 56
	{hash =  -494615257, name = 	     "Assault Shotgun"}, -- 57
	{hash =   317205821, name = 	     "Sweeper Shotgun"}, -- 58
	{hash = -1654528753, name = 	     "Bullpup Shotgun"}, -- 59
	{hash =    94989220, name = 		  "Combat Shotgun"}, -- 60
	{hash =  -275439685, name =    "Double Barrel Shotgun"}, -- 61
	{hash =   984333226, name = 		   "Heavy Shotgun"}, -- 62
	{hash =   487013001, name = 		    "Pump Shotgun"}, -- 63
	{hash =  1432025498, name = 	  "Pump Shotgun Mk II"}, -- 64
	{hash =  2017895192, name = 	   "Sawed-Off Shotgun"}, -- 65
	{hash = -1466123874, name = 				  "Musket"}, -- 66
	{hash =  2144741730, name =				   "Combat MG"}, -- 67
	{hash =  -608341376, name = 	     "Combat MG Mk II"}, -- 68
	{hash =  1627465347, name = 	   "Gusenberg Sweeper"}, -- 69
	{hash = -1660422300, name =					      "MG"}, -- 70
	{hash =  1198256469, name = 	  "Unholy Hellbringer"}, -- 71
	{hash =   205991906, name = 		    "Heavy Sniper"}, -- 72
	{hash =   177293209, name = 	  "Heavy Sniper Mk II"}, -- 73
	{hash =  -952879014, name = 		  "Marksman Rifle"}, -- 74
	{hash =  1785463520, name =     "Marksman Rifle Mk II"}, -- 75
	{hash =  1853742572, name = 	     "Precision Rifle"}, -- 76
	{hash =   100416529, name = 		    "Sniper Rifle"}, -- 77
	{hash =   125959754, name = "Compact Grenade Launcher"}, -- 78
	{hash =  -618237638, name =     "Compact EMP Launcher"}, -- 79
	{hash =  2138347493, name = 	   "Firework Launcher"}, -- 80
	{hash = -1568386805, name = 	    "Grenade Launcher"}, -- 81
	{hash =  1672152130, name =		     "Homing Launcher"}, -- 82
	{hash =  1119849093, name =			   	     "Minigun"}, -- 83
	{hash =   -22923932, name = 			     "Railgun"}, -- 84
	{hash = -1238556825, name = 			  "Widowmaker"}, -- 85
	{hash = -1312131151, name = 			 	     "RPG"}, -- 86
	{hash = -1813897027, name = 			     "Grenade"}, -- 87
	{hash =   615608432, name = 			     "Molotov"}, -- 88
	{hash = -1169823560, name = 			   "Pipe Bomb"}, -- 89
	{hash = -1420407917, name = 	      "Proximity Mine"}, -- 90
	{hash =   -37975472, name = 			    "Tear Gas"}, -- 91
	{hash =   741814745, name = 		     "Sticky Bomb"}, -- 92
	{hash =   883325847, name = 		  	   "Jerry Can"}, -- 93
}

--Simple Tables--

local keyboard = {W = 87, S = 83, A = 65, D = 68, E = 69}
local auto_shop_missions 		  = {
	"Select", "The Union Deposit.", "The Superdollar Deal", "The Bank Contract", "The ECU Job",
	"The Prison Contract", "The Agency Deal", "The Lost Contract", "The Data Contract"
}
local apartment_cash_receivers    = {"All", "Only Crew", "Only Me"}
local cayo_perico_targets 	      = {"Select", "Tequila", "Necklace", "Bonds", "Diamond", "Madrazo Files", "Statue"}
local cayo_perico_loadout 	      = {"Select", "Aggressor", "Conspirator", "Crackshot", "Saboteur", "Marksman"}
local cayo_perico_targets_none    = {"None", "Cash", "Weed", "Coke", "Gold"}
local cayo_perico_targets_select  = {"Select", "Cash", "Weed", "Coke", "Gold"}
local cayo_perico_targets_amount1 = {0, 128, 64, 196, 204, 220, 252, 253, 255}
local cayo_perico_targets_amount2 = {0, 64, 96, 112, 120, 122, 126, 127}
local cayo_perico_targets_amount3 = {
	0, 8388608, 12582912, 12845056, 12976128, 13500416, 14548992,
	16646144, 16711680, 16744448, 16760832, 16769024, 16769536,
	16770560, 16770816, 16770880, 16771008, 16773056, 16777152,
	16777184, 16777200, 16777202, 16777203, 16777211, 16777215
}
local cayo_perico_sessions 		  = {"Go Offline", "Go Online"}
local diamond_casino_approaches   = {
	"Select", "Silent n Sneaky (Normal)", "Big Con (Normal)", "Aggressive (Normal)",
	"Silent n Sneaky (Hard)", "Big Con (Hard)", "Aggressive (Hard)"
}
local diamond_casino_masks		  = {
	"Select", "Geometic Set", "Hunter Set", "Oni Half Mask Set", "Emoji Set", "Ornate Skull Set", "Lucky Fruit Set",
	"Guerilla Set", "Clown Set", "Animal Set", "Riot Set", "Oni Full Mask Set", "Hockey Set"
}
local salvage_yard_robberies 	  = {"Unknown", "The Cargo Ship", "The Gangbanger", "The Duggan", "The Podium", "The McTony"}
local salvage_yard_veh_statuses   = {"Unknown", "Available", "In Progress", "Acquired", "Salvaging", "Salvaged", "Claimed", "Sold"}
local salvage_yard_vehicles 	  = {
	"LM87 v1", "Cinquemila v1", "Autarch v1", "Tigon v1", "Champion v1",
	"10F v1", "SM722 v1", "Omnis e-GT v1", "Growler v1", "Deity v1",
	"Itali RSX v1", "Coquette D10 v1", "Jubilee v1", "Astron v1", "Comet S2 Cabrio v1",
	"Torero v1", "Cheetah Classic v1", "Turismo Classic v1", "Infernus Classic v1", "Stafford v1",
	"GT500 v1", "Viseris v1", "Mamba v1", "Coquette BlackFin v1", "Stinger GT v1",
	"Z-Type v1", "Broadway v1", "Vigero ZX v1", "Buffalo STX v1", "Ruston v1",
	"Gauntlet Hellfire v1", "Dominator GTT v1", "Roosevelt Valor v1", "Swinger v1", "Stirling GT v1",
	"Omnis v1", "Tropos Rallye v1", "Jugular v1", "Patriot Mil-Spec v1", "Toros v1",
	"Caracara 4x4 v1", "Sentinel Classic  v1", "Weevil v1", "Blista Kanjo v1", "Eudora v1",
	"Kamacho v1", "Hellion v1", "Ellie v1", "Hermes v1", "Hustler v1",
	"Turismo Omaggio v1", "Buffalo EVX v1", "Itali GTO Stinger TT v1", "Virtue v1", "Ignus v1",
	"Zentorno v1", "Neon v1", "Furia v1", "Zorrusso v1", "Thrax v1",
	"Vagner v1", "Panthere v1", "Itali GTO v1", "S80RR v1", "Tyrant v1",
	"Entity MT v1", "Torero XO v1", "Neo v1", "Corsita v1", "Paragon R v1",
	"Fränken Stange v1", "Comet Safari v1", "FR36 v1", "Hotring Everon v1", "Komoda v1",
	"Tailgater S v1", "Jester Classic v1", "Jester RR v1", "Euros v1", "ZR350 v1",
	"Cypher v1", "Dominator ASP v1", "Baller ST-D v1", "Casco v1", "Drift Yosemite v1",
	"Everon v1", "Penumbra FF v1", "V-STR v1", "Dominator GT v1", "Schlagen GT v1",
	"Cavalcade XL v1", "Clique v1", "Boor v1", "Sugoi v1", "Greenwood v1",
	"Brigham v1", "Issi Rally v1", "Seminole Frontier v1", "Kanjo SJ v1", "Previon v1",
	"LM87 v2", "Cinquemila v2", "Autarch v2", "Tigon v2", "Champion v2",
	"10F v2", "SM722 v2", "Omnis e-GT v2", "Growler v2", "Deity v2",
	"Itali RSX v2", "Coquette D10 v2", "Jubilee v2", "Astron v2", "Comet S2 Cabrio v2",
	"Torero v2", "Cheetah Classic v2", "Turismo Classic v2", "Infernus Classic v2", "Stafford v2",
	"GT500 v2", "Viseris v2", "Mamba v2", "Coquette BlackFin v2", "Stinger GT v2",
	"Z-Type v2", "Broadway v2", "Vigero ZX v2", "Buffalo STX v2", "Ruston v2",
	"Gauntlet Hellfire v2", "Dominator GTT v2", "Roosevelt Valor v2", "Swinger v2", "Stirling GT v2",
	"Omnis v2", "Tropos Rallye v2", "Jugular v2", "Patriot Mil-Spec v2", "Toros v2",
	"Caracara 4x4 v2", "Sentinel Classic  v2", "Weevil v2", "Blista Kanjo v2", "Eudora v2",
	"Kamacho v2", "Hellion v2", "Ellie v2", "Hermes v2", "Hustler v2",
	"Turismo Omaggio v2", "Buffalo EVX v2", "Itali GTO Stinger TT v2", "Virtue v2", "Ignus v2",
	"Zentorno v2", "Neon v2", "Furia v2", "Zorrusso v2", "Thrax v2",
	"Vagner v2", "Panthere v2", "Itali GTO v2", "S80RR v2", "Tyrant v2",
	"Entity MT v2", "Torero XO v2", "Neo v2", "Corsita v2", "Paragon R v2",
	"Fränken Stange v2", "Comet Safari v2", "FR36 v2", "Hotring Everon v2", "Komoda v2",
	"Tailgater S v2", "Jester Classic v2", "Jester RR v2", "Euros v2", "ZR350 v2",
	"Cypher v2", "Dominator ASP v2", "Baller ST-D v2", "Casco v2", "Drift Yosemite v2",
	"Everon v2", "Penumbra FF v2", "V-STR v2", "Dominator GT v2", "Schlagen GT v2",
	"Cavalcade XL v2", "Clique v2", "Boor v2", "Sugoi v2", "Greenwood v2",
	"Brigham v2", "Issi Rally v2", "Seminole Frontier v2", "Kanjo SJ v2", "Previon v2",
	"LM87 v3", "Cinquemila v3", "Autarch v3", "Tigon v3", "Champion v3",
	"10F v3", "SM722 v3", "Omnis e-GT v3", "Growler v3", "Deity v3",
	"Itali RSX v3", "Coquette D10 v3", "Jubilee v3", "Astron v3", "Comet S2 Cabrio v3",
	"Torero v3", "Cheetah Classic v3", "Turismo Classic v3", "Infernus Classic v3", "Stafford v3",
	"GT500 v3", "Viseris v3", "Mamba v3", "Coquette BlackFin v3", "Stinger GT v3",
	"Z-Type v3", "Broadway v3", "Vigero ZX v3", "Buffalo STX v3", "Ruston v3",
	"Gauntlet Hellfire v3", "Dominator GTT v3", "Roosevelt Valor v3", "Swinger v3", "Stirling GT v3",
	"Omnis v3", "Tropos Rallye v3", "Jugular v3", "Patriot Mil-Spec v3", "Toros v3",
	"Caracara 4x4 v3", "Sentinel Classic  v3", "Weevil v3", "Blista Kanjo v3", "Eudora v3",
	"Kamacho v3", "Hellion v3", "Ellie v3", "Hermes v3", "Hustler v3",
	"Turismo Omaggio v3", "Buffalo EVX v3", "Itali GTO Stinger TT v3", "Virtue v3", "Ignus v3",
	"Zentorno v3", "Neon v3", "Furia v3", "Zorrusso v3", "Thrax v3",
	"Vagner v3", "Panthere v3", "Itali GTO v3", "S80RR v3", "Tyrant v3",
	"Entity MT v3", "Torero XO v3", "Neo v3", "Corsita v3", "Paragon R v3",
	"Fränken Stange v3", "Comet Safari v3", "FR36 v3", "Hotring Everon v3", "Komoda v3",
	"Tailgater S v3", "Jester Classic v3", "Jester RR v3", "Euros v3", "ZR350 v3",
	"Cypher v3", "Dominator ASP v3", "Baller ST-D v3", "Casco v3", "Drift Yosemite v3",
	"Everon v3", "Penumbra FF v3", "V-STR v3", "Dominator GT v3", "Schlagen GT v3",
	"Cavalcade XL v3", "Clique v3", "Boor v3", "Sugoi v3", "Greenwood v3",
	"Brigham v3", "Issi Rally v3", "Seminole Frontier v3", "Kanjo SJ v3", "Previon v3",
	"LM87 v4", "Cinquemila v4", "Autarch v4", "Tigon v4", "Champion v4",
	"10F v4", "SM722 v4", "Omnis e-GT v4", "Growler v4", "Deity v4",
	"Itali RSX v4", "Coquette D10 v4", "Jubilee v4", "Astron v4", "Comet S2 Cabrio v4",
	"Torero v4", "Cheetah Classic v4", "Turismo Classic v4", "Infernus Classic v4", "Stafford v4",
	"GT500 v4", "Viseris v4", "Mamba v4", "Coquette BlackFin v4", "Stinger GT v4",
	"Z-Type v4", "Broadway v4", "Vigero ZX v4", "Buffalo STX v4", "Ruston v4",
	"Gauntlet Hellfire v4", "Dominator GTT v4", "Roosevelt Valor v4", "Swinger v4", "Stirling GT v4",
	"Omnis v4", "Tropos Rallye v4", "Jugular v4", "Patriot Mil-Spec v4", "Toros v4",
	"Caracara 4x4 v4", "Sentinel Classic  v4", "Weevil v4", "Blista Kanjo v4", "Eudora v4",
	"Kamacho v4", "Hellion v4", "Ellie v4", "Hermes v4", "Hustler v4",
	"Turismo Omaggio v4", "Buffalo EVX v4", "Itali GTO Stinger TT v4", "Virtue v4", "Ignus v4",
	"Zentorno v4", "Neon v4", "Furia v4", "Zorrusso v4", "Thrax v4",
	"Vagner v4", "Panthere v4", "Itali GTO v4", "S80RR v4", "Tyrant v4",
	"Entity MT v4", "Torero XO v4", "Neo v4", "Corsita v4", "Paragon R v4",
	"Fränken Stange v4", "Comet Safari v4", "FR36 v4", "Hotring Everon v4", "Komoda v4",
	"Tailgater S v4", "Jester Classic v4", "Jester RR v4", "Euros v4", "ZR350 v4",
	"Cypher v4", "Dominator ASP v4", "Baller ST-D v4", "Casco v4", "Drift Yosemite v4",
	"Everon v4", "Penumbra FF v4", "V-STR v4", "Dominator GT v4", "Schlagen GT v4",
	"Cavalcade XL v4", "Clique v4", "Boor v4", "Sugoi v4", "Greenwood v4",
	"Brigham v4", "Issi Rally v4", "Seminole Frontier v4", "Kanjo SJ v4", "Previon v4",
	"LM87 v5", "Cinquemila v5", "Autarch v5", "Tigon v5", "Champion v5",
	"10F v5", "SM722 v5", "Omnis e-GT v5", "Growler v5", "Deity v5",
	"Itali RSX v5", "Coquette D10 v5", "Jubilee v5", "Astron v5", "Comet S2 Cabrio v5",
	"Torero v5", "Cheetah Classic v5", "Turismo Classic v5", "Infernus Classic v5", "Stafford v5",
	"GT500 v5", "Viseris v5", "Mamba v5", "Coquette BlackFin v5", "Stinger GT v5",
	"Z-Type v5", "Broadway v5", "Vigero ZX v5", "Buffalo STX v5", "Ruston v5",
	"Gauntlet Hellfire v5", "Dominator GTT v5", "Roosevelt Valor v5", "Swinger v5", "Stirling GT v5",
	"Omnis v5", "Tropos Rallye v5", "Jugular v5", "Patriot Mil-Spec v5", "Toros v5",
	"Caracara 4x4 v5", "Sentinel Classic  v5", "Weevil v5", "Blista Kanjo v5", "Eudora v5",
	"Kamacho v5", "Hellion v5", "Ellie v5", "Hermes v5", "Hustler v5",
	"Turismo Omaggio v5", "Buffalo EVX v5", "Itali GTO Stinger TT v5", "Virtue v5", "Ignus v5",
	"Zentorno v5", "Neon v5", "Furia v5", "Zorrusso v5", "Thrax v5",
	"Vagner v5", "Panthere v5", "Itali GTO v5", "S80RR v5", "Tyrant v5",
	"Entity MT v5", "Torero XO v5", "Neo v5", "Corsita v5", "Paragon R v5",
	"Fränken Stange v5", "Comet Safari v5", "FR36 v5", "Hotring Everon v5", "Komoda v5",
	"Tailgater S v5", "Jester Classic v5", "Jester RR v5", "Euros v5", "ZR350 v5",
	"Cypher v5", "Dominator ASP v5", "Baller ST-D v5", "Casco v5", "Drift Yosemite v5",
	"Everon v5", "Penumbra FF v5", "V-STR v5", "Dominator GT v5", "Schlagen GT v5",
	"Cavalcade XL v5", "Clique v5", "Boor v5", "Sugoi v5", "Greenwood v5",
	"Brigham v5", "Issi Rally v5", "Seminole Frontier v5", "Kanjo SJ v5", "Previon v5"
}
local hangar_cargo_vip_cargoes 	  = {
	"Animal Materials", "Art n Antiques", "Chemicals", "Counterfeit Goods",
	"Jewel n Gems", "Medical Supplies", "Narcotics", "Tabacco n Alcohol"
}
local money_editor_story_chars    = {"Michael", "Franklin", "Trevor"}
local nightclub_helper_popularity = {"Select", "Max", "Min"}
local nightclub_helper_safe       = {"Select", "Fill", "Collect (inside only)"}
local special_cargo_vip_wars   	  = {"Select", "Small (16)", "Medium (42)", "Large (111)"}
local achievements 				  = {
	"Welcome to Los Santos", "A Friendship Resurrected", "A Fair Day's Pay", "The Moment of Truth", "To Live or Die in Los Santos",
	"Diamond Hard", "Subversive", "Blitzed", "Small Town, Big Job", "The Government Gimps",
	"The Big One!", "Solid Gold, Baby!", "Career Criminal", "San Andreas Sightseer", "All's Fare in Love and War",
	"teleport Industries Arms Race", "Multi-Disciplined", "From Beyond the Stars", "A Mystery, Solved", "Waste Management",
	"Red Mist", "Show Off", "Kifflom!", "Three Man Army", "Out of Your Depth",
	"Altruist Acolyte", "A Lot of Cheddar", "Trading Pure Alpha", "Pimp My Sidearm", "Wanted: Alive Or Alive",
	"Los Santos Customs", "Close Shave", "Off the Plane", "Three-Bit Gangster", "Making Moves",
	"Above the Law", "Numero Uno", "The Midnight Club", "Unnatural Selection", "Backseat Driver",
	"Run Like The Wind", "Clean Sweep", "Decorated", "Stick Up Kid", "Enjoy Your Stay",
	"Crew Cut", "Full Refund", "Dialling Digits", "American Dream", "A New Perspective",
	"Be Prepared", "In the Name of Science", "Dead Presidents", "Parole Day", "Shot Caller",
	"Four Way", "Live a Little", "Can't Touch This", "Mastermind", "Vinewood Visionary",
	"Majestic", "Humans of Los Santos", "First Time Director",  "Animal Lover", "Ensemble Piece",
	"Cult Movie", "Location Scout", "Method Actor", "Cryptozoologist", "Getting Started",
	"The Data Breaches", "The Bogdan Problem", "The Doomsday Scenario", "A World Worth Saving", "Orbital Obliteration",
	"Elitist", "Masterminds"
}
local rp_till_100 				  = {
	0, 800, 2100, 3800, 6100, 9500, 12500, 16000, 19800, 24000,
	28500, 33400, 38700, 44200, 50200, 56400, 3000, 69900, 77100, 84700,
	92500, 100700, 109200, 118000, 127100, 136500, 146200, 156200, 166500, 177100,
	188000, 199200, 210700, 222400, 234500, 246800, 259400, 272300, 285500, 299000,
	312700, 326800, 341000, 355600, 370500, 385600, 401000, 416600, 432600, 448800,
	465200, 482000, 499000, 516300,	533800, 551600, 569600, 588000, 606500, 625400,
	644500, 663800, 683400, 703300, 723400, 743800, 764500, 785400, 806500, 827900,
	849600, 871500, 893600, 916000, 938700, 961600, 984700, 1008100, 1031800, 1055700,
	1079800, 1104200, 1128800, 1153700, 1178800, 1204200, 1229800, 1255600, 1281700, 1308100,
	1334600, 1361400, 1388500, 1415800, 1443300, 1471100, 1499100, 1527300, 1555800, 1584350
}
local misc_supplies 			  = {"Select", "All", "Cash", "Coke", "Weed", "Meth", "Documents", "Bunker", "Acid"}

--Local Functions--

local function reset_states_range(int_bool, from, to, step)
	for i = from, to, step do
		states[int_bool .. i] = 1
	end
end

local function reset_def_nums(from, to, step)
    for i = from, to, step do
        def_nums[i] 	= list_0_9[1]
        def_num_curs[i] = 1
    end
end

local function teleport_heist(value, table)
	local v = value - 2
	teleport(table[v][1], table[v][2], table[v][3], 0, 0, 0)
end

local function is_instant_finish_available(script_local)
	local is_available = FMC20:get_int(script_local) == 1 or FMC:get_int(script_local) == 1
	return (is_available) and "Available" or "Unavailable"
end

local function is_symbol_space(symbol)
	return (symbol == ".") and " " or symbol
end

local function trigger_transaction(hash, amount)
	globals.set_int(TTg + 1, INT_MAX)
	globals.set_int(TTg + 7, INT_MAX + 1)
	globals.set_int(TTg + 6, 0)
	globals.set_int(TTg + 5, 0)
	globals.set_int(TTg + 3, hash)
	globals.set_int(TTg + 2, amount)
	globals.set_int(TTg, 1)
end

local function convert_rank_to_rp(rank)
	if rank < 100 then
		return rp_till_100[rank]
	else
		return ((25 * (rank^2)) + (23575 * rank) - 1023150) + 100
	end
end

--Local "get" Functions--

local function get_cayo_perico_targets(location, targets)
    local cayo_perico_l_targets = {}
    for _, target in ipairs(targets) do
        if stats.get_int(MPX() .. target.id) > 0 then
            table.insert(cayo_perico_l_targets, target.name)
        end
    end
    if #cayo_perico_l_targets == 0 then
        table.insert(cayo_perico_l_targets, "None")
    end
    return location .. ": " .. table.concat(cayo_perico_l_targets, "; ")
end

local function get_diamond_casino_loadout(approach, gunman)
	local info = {"Select Approach", "Select Gunman"}
	if approach == 0 then
		return {info[1]}
	elseif gunman == nil then
		return {info[2]}
	end
	local loadouts = {
		[1] = gunman.silent_loadout,
		[4] = gunman.silent_loadout,
		[2] = gunman.bigcon_loadout,
		[5] = gunman.bigcon_loadout,
		[3] = gunman.aggressive_loadout,
		[6] = gunman.aggressive_loadout
	}
	return loadouts[approach] or {}
end

local function get_casino_master_card_name(index)
	if index == 0 then
		return "Rolling..."
	end
	card_number = math.fmod(index, 13)
	card_name = ""
	card_suit = ""
	if card_number == 1 then
		card_name = "A"
	elseif card_number == 0 then
		card_name = "K"
	elseif card_number == 12 then
		card_name = "Q"
	elseif card_number == 11 then
		card_name = "J"
	else
		card_name = tostring(card_number)
	end
	if index >= 1 and index <= 13 then
		card_suit = "♣"
	elseif index >= 14 and index <= 26 then
		card_suit = "♦"
	elseif index >= 27 and index <= 39 then
		card_suit = "♥"
	elseif index >= 40 and index <= 52 then
		card_suit = "♠"
	end
	return card_name .. card_suit
end

local function get_casino_master_p_dealer_id(current_table)
	local players = 0
	for i = 0, 31 do
		local players_table = TCP:get_int(CMPTl + 1 + (i * CMPTSl) + 2)
		if get_localplayer_id() ~= i and players_table == current_table then
			players = players + 1
		end
		return players + 1
	end
end

local function get_char_skill_status(stat_name, labels)
	local stat = stats.get_int(MPX() .. stat_name)
	local status
	if stat <= 25 then
		status = labels[1]
	elseif stat <= 50 then
		status = labels[2]
	elseif stat <= 75 then
		status = labels[3]
	elseif stat <= 99 then
		status = labels[4]
	else
		status = labels[5]
	end
	return stat .. "/100 " .. status
end

local function get_char_collectible(collectible, global, max_count)
	if localplayer == nil then	
		return collectible .. ": In Menu"
	else
		return collectible .. " | 〔" .. globals.get_int(global) .. "/" .. max_count .. "〕"
	end
end

--Local "set" Functions--

local function set_cayo_perico_targets(cash, weed, coke, gold, where, target, value)
	stats.set_int(MPX() .. "H4LOOT_CASH_" .. where, cash)
	stats.set_int(MPX() .. "H4LOOT_CASH_" .. where .. "_SCOPED", cash)
	stats.set_int(MPX() .. "H4LOOT_WEED_" .. where, weed)
	stats.set_int(MPX() .. "H4LOOT_WEED_" .. where .. "_SCOPED", weed)
	stats.set_int(MPX() .. "H4LOOT_COKE_" .. where, coke)
	stats.set_int(MPX() .. "H4LOOT_COKE_" .. where .. "_SCOPED", coke)
	stats.set_int(MPX() .. "H4LOOT_GOLD_" .. where, gold)
	stats.set_int(MPX() .. "H4LOOT_GOLD_" .. where .. "_SCOPED", gold)
	if target ~= 0 then
		stats.set_int(MPX() .. "H4LOOT_" .. target .. "_V", value)
	end
end

local function set_diamond_casino_approach(last_approach, hard_approach, approach, selected_approach)
	stats.set_int(MPX() .. "H3_LAST_APPROACH", last_approach)
	stats.set_int(MPX() .. "H3_HARD_APPROACH", hard_approach)
	stats.set_int(MPX() .. "H3_APPROACH", approach)
	stats.set_int(MPX() .. "H3OPT_APPROACH", selected_approach)
end

local function set_doomsday_act(progress, status)
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", progress)
	stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", status)
	stats.set_int(MPX() .. "GANGOPS_FLOW_NOTIFICATIONS", 1557)
end

local function set_casino_master_p_cards(id, current_table, card1, card2, card3)
	TCP:set_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 1 + (id * 3), card1)
	TCP:set_int(CMPACl + CMPACDl + 1 + 1 + (current_table * CMPDSl) + 1 + (id * 3), card1)
	TCP:set_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 2 + (id * 3), card2)
	TCP:set_int(CMPACl + CMPACDl + 1 + 1 + (current_table * CMPDSl) + 2 + (id * 3), card2)
	TCP:set_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 3 + (id * 3), card3)
	TCP:set_int(CMPACl + CMPACDl + 1 + 1 + (current_table * CMPDSl) + 3 + (id * 3), card3)
end

local function set_casino_master_sm_status(value)
	if localplayer ~= nil then
		for i = 3, 196 do
			if i ~= 67 and i ~= 132 then
				CS:set_int(CMSRRTl + i, value)
			end
		end
	end
end

local function set_special_cargo_vip_price(price)
	for i = 0, 4 do
		if stats.get_int(MPX() .. "CONTOTALFORWHOUSE" .. i) > 0 then
			stats.set_int(MPX() .. "SPCONTOTALFORWHOUSE" .. i, stats.get_int(MPX() .. "CONTOTALFORWHOUSE" .. i) - 1)
		end
	end
	globals.set_int(SCVPg, price)
end

local function set_awards_arcade_scgw_init(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
	stats.set_int(MPX() .. "SCGW_INITIALS_0", v1)
	stats.set_int(MPX() .. "SCGW_INITIALS_1", v2)
	stats.set_int(MPX() .. "SCGW_INITIALS_2", v3)
	stats.set_int(MPX() .. "SCGW_INITIALS_3", v4)
	stats.set_int(MPX() .. "SCGW_INITIALS_4", v5)
	stats.set_int(MPX() .. "SCGW_INITIALS_5", v6)
	stats.set_int(MPX() .. "SCGW_INITIALS_6", v7)
	stats.set_int(MPX() .. "SCGW_INITIALS_7", v8)
	stats.set_int(MPX() .. "SCGW_INITIALS_8", v9)
	stats.set_int(MPX() .. "SCGW_INITIALS_9", v10)
end

local function set_awards_arcade_footage_init(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
	stats.set_int(MPX() .. "FOOTAGE_INITIALS_0", v1)
	stats.set_int(MPX() .. "FOOTAGE_INITIALS_1", v2)
	stats.set_int(MPX() .. "FOOTAGE_INITIALS_2", v3)
	stats.set_int(MPX() .. "FOOTAGE_INITIALS_3", v4)
	stats.set_int(MPX() .. "FOOTAGE_INITIALS_4", v5)
	stats.set_int(MPX() .. "FOOTAGE_INITIALS_5", v6)
	stats.set_int(MPX() .. "FOOTAGE_INITIALS_6", v7)
	stats.set_int(MPX() .. "FOOTAGE_INITIALS_7", v8)
	stats.set_int(MPX() .. "FOOTAGE_INITIALS_8", v9)
	stats.set_int(MPX() .. "FOOTAGE_INITIALS_9", v10)
end

local function set_awards_arcade_footage_score(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
	stats.set_int(MPX() .. "FOOTAGE_SCORE_0", v1)
	stats.set_int(MPX() .. "FOOTAGE_SCORE_1", v2)
	stats.set_int(MPX() .. "FOOTAGE_SCORE_2", v3)
	stats.set_int(MPX() .. "FOOTAGE_SCORE_3", v4)
	stats.set_int(MPX() .. "FOOTAGE_SCORE_4", v5)
	stats.set_int(MPX() .. "FOOTAGE_SCORE_5", v6)
	stats.set_int(MPX() .. "FOOTAGE_SCORE_6", v7)
	stats.set_int(MPX() .. "FOOTAGE_SCORE_7", v8)
	stats.set_int(MPX() .. "FOOTAGE_SCORE_8", v9)
	stats.set_int(MPX() .. "FOOTAGE_SCORE_9", v10)
end

local function set_bad_sports(value1, value2, value3)
	stats.set_int("MPPLY_BADSPORT_MESSAGE", value1)
	stats.set_int("MPPLY_BECAME_BADSPORT_NUM", value1)
	stats.set_float("MPPLY_OVERALL_BADSPORT", value2)
	stats.set_bool("MPPLY_CHAR_IS_BADSPORT", value3)
	sleep(1)
	change_session(8)
end

--Local "toggle" Functions--

local function toggle_cayo_perico_paintings(bool)
	stats.set_int(MPX() .. "H4LOOT_PAINT", (bool) and 127 or 0)
	stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", (bool) and 127 or 0)
	stats.set_int(MPX() .. "H4LOOT_PAINT_V", (bool) and 189500 or 0)
end

local function toggle_cayo_perico_hecker(bool)
    local function cayo_perico_bypasses()
        if FMC20:is_active() then
            if FMC20:get_int(CPFHl) == 4 then
                FMC20:set_int(CPFHl, 5)
            end
            local CPSTCl_value = FMC20:get_int(CPSTCl)
            if CPSTCl_value >= 3 and CPSTCl_value <= 6 then
                FMC20:set_int(CPSTCl, 6)
            end
            FMC20:set_float(CPPCCl, 100)
        end
    end
    if bool then
        cayo_hecker_hotkey = menu.register_hotkey(72, cayo_perico_bypasses)
    else
        menu.remove_hotkey(cayo_hecker_hotkey)
    end
end

local function toggle_cayo_perico_womans_bag(bool)
	if localplayer ~= nil then
		globals.set_int(CPBg, (bool) and 99999 or 1800)
	end
end

local function toggle_diamond_casino_hecker(bool)
	local function diamond_casino_bypasses()
		if FMC:is_active() then
			FMC:set_int(DCFHl, 5)
			FMC:set_int(DCKHl, 5)
		end
	end
	if bool then
		casino_hecker_hotkey = menu.register_hotkey(72, diamond_casino_bypasses)
	else
		menu.remove_hotkey(casino_hecker_hotkey)
	end
end

local function toggle_diamond_casino_autograbber()
	while states.b7 do
		local DCAl_value = FMC:get_int(DCAl)
		if DCAl_value == 3 then
			FMC:set_int(DCAl, 4)
		elseif DCAl_value == 4 then
			FMC:set_float(DCASl, 2)
		end
		sleep(0.1)
	end
end

local function toggle_bunker_crash_turkish_supplier()
	if localplayer ~= nil then
		while states.b9 do
			globals.set_int(GSIg + 6, 1)
			menu.trigger_bunker_production()
			sleep(1)
		end
	end
end

local function toggle_hangar_cargo_vip_loop()
	while states.b11 do
		stats_set_packed_bool(36828, true)
		sleep(1)
	end
end

local function toggle_nightclub_helper_cd_killer(bool)
	globals.set_int(NHCKg1, (bool) and 0 or 300000)
	globals_set_ints(NHCKg2, NHCKg3, 1, (bool) and 0 or 300000)
end

local function toggle_nightclub_helper_turkish_supplier()
	while states.b15 do
		menu.trigger_nightclub_production()
		sleep(10)
	end
end

local function toggle_special_cargo_vip_afk()
	local function special_cargo_vip_afk(part)
		if part == 1 then
			globals_set_ints(SCVBCg, SCVSCg, 1, 0)
			globals_set_ints(BTEg1, BTEg3, 1, 0)
		elseif part == 2 then
			ASS:set_int(SCVAl1, 1)
			sleep(0.2)
			ASS:set_int(SCVAl2, 1)
			sleep(0.2)
			ASS:set_int(SCVAl3, 3012)
		elseif part == 3 then
			globals.set_float(XMg, (special_cargo_vip_disable_rp) and 0 or 1)
			GCS:set_int(SCVAl4, 1)
			GCS:set_int(SCVAl5, 1)
			GCS:set_int(SCVAl6, 0)
			GCS:set_int(SCVMTl, 7)
			sleep(special_cargo_vip_afk_delay)
			GCS:set_int(SCVISl, 99999)
			if not special_cargo_vip_crate_back then
				stats_set_packed_bools(32359, 32363, true)
			end
			sleep(2)
		elseif part == 4 then
			GCS:set_int(SCVISl, 99999)
			menu.send_key_down(keyboard.S)
			sleep(1.5)
			menu.send_key_up(keyboard.S)
		elseif part == 5 then
			menu.send_key_down(keyboard.D)
			sleep(1.8)
			menu.send_key_up(keyboard.D)
			menu.send_key_press(keyboard.E)
		elseif part == 6 then
			menu.send_key_down(keyboard.D)
			sleep(1.6)
			menu.send_key_down(keyboard.W)
			sleep(0.8)
			menu.send_key_up(keyboard.D)
			menu.send_key_up(keyboard.W)
			menu.send_key_press(keyboard.E)
		elseif part == 7 then
			menu.send_key_down(keyboard.W)
			menu.send_key_down(keyboard.A)
			sleep(0.8)
			menu.send_key_up(keyboard.W)
			menu.send_key_up(keyboard.A)
			menu.send_key_press(keyboard.E)
		end
	end
	local price 		= 6000000
	local required_cash = stats.get_int("MPPLY_TOTAL_EVC") + special_cargo_vip_r_cash
	if not states.b19 then
		special_cargo_vip_stop_afk = 1
		return
	end
	if special_cargo_vip_w_type == 1 then
		while special_cargo_vip_stop_afk == 0 do
			globals.set_int(SCVPg, price)
			if AMW:is_active() then
				special_cargo_vip_afk(1)
				if AMW:is_active() then
					special_cargo_vip_afk(5)
					if ASS:is_active() then
						special_cargo_vip_afk(2)
					end
					if GCS:is_active() then
						special_cargo_vip_afk(3)
						if not AMW:is_active() then
							special_cargo_vip_afk(4)
							if special_cargo_vip_r_cash > 0 then
								if stats.get_int("MPPLY_TOTAL_EVC") >= required_cash then
									states.b19				   = false
									states.i52 				   = 0
									special_cargo_vip_stop_afk = 1
								elseif stats.get_int("MPPLY_TOTAL_EVC") + price > required_cash then
									price 					   = required_cash - stats.get_int("MPPLY_TOTAL_EVC")
									special_cargo_vip_stop_afk = 0
								else
									special_cargo_vip_stop_afk = 0
								end
							end
						end
					end
				end
			end
		end
		special_cargo_vip_stop_afk = 0
	end
	if special_cargo_vip_w_type == 2 then
		while special_cargo_vip_stop_afk == 0 do
			globals.set_int(SCVPg, price)
			if AMW:is_active() then
				special_cargo_vip_afk(1)
				if AMW:is_active() then
					special_cargo_vip_afk(6)
					if ASS:is_active() then
						special_cargo_vip_afk(2)
					end
					if GCS:is_active() then
						special_cargo_vip_afk(3)
						if not AMW:is_active() then
							special_cargo_vip_afk(4)
							if special_cargo_vip_r_cash > 0 then
								if stats.get_int("MPPLY_TOTAL_EVC") >= required_cash then
									states.b19 	   			   = false
									states.i52 				   = 0
									special_cargo_vip_stop_afk = 1
								elseif stats.get_int("MPPLY_TOTAL_EVC") + price > required_cash then
									price 					   = required_cash - stats.get_int("MPPLY_TOTAL_EVC")
									special_cargo_vip_stop_afk = 0
								else
									special_cargo_vip_stop_afk = 0
								end
							end
						end
					end
				end
			end
		end
		special_cargo_vip_stop_afk = 0
	end
	if special_cargo_vip_w_type == 3 then
		while special_cargo_vip_stop_afk == 0 do
			globals.set_int(SCVPg, price)
			if AMW:is_active() then
				special_cargo_vip_afk(1)
				if AMW:is_active() then
					special_cargo_vip_afk(7)
					if ASS:is_active() then
						special_cargo_vip_afk(2)
					end
					if GCS:is_active() then
						special_cargo_vip_afk(3)
						if not AMW:is_active() then
							special_cargo_vip_afk(4)
							if special_cargo_vip_r_cash > 0 then
								if stats.get_int("MPPLY_TOTAL_EVC") >= required_cash then
									states.b19 				   = false
									states.i52 				   = 0
									special_cargo_vip_stop_afk = 1
								elseif stats.get_int("MPPLY_TOTAL_EVC") + price > required_cash then
									price					   = required_cash - stats.get_int("MPPLY_TOTAL_EVC")
									special_cargo_vip_stop_afk = 0
								else
									special_cargo_vip_stop_afk = 0
								end
							end
						end
					end
				end
			end
		end
	end
	special_cargo_vip_stop_afk = 0
end

local function toggle_special_cargo_vip_loop()
	while states.b20 do
		stats_set_packed_bools(32359, 32363, true)
		sleep(1)
	end
end

local function toggle_special_cargo_vip_cd_killer(bool)
	globals.set_int(SCVBCg, (bool) and 0 or 300000)
	globals.set_int(SCVSCg, (bool) and 0 or 1800000)
end

local function toggle_cheap_loop_afk()
	if localplayer ~= nil then
		while states.b26 do
			if cheap_loop_r_cash > 0 then
				if cheap_loop_m_count * 1000 >= cheap_loop_r_cash then
					states.b26 		  = false
					states.i57 		  = 0
					cheap_loop_r_cash = 0
					break
				end
			end
			cheap_loop_m_made  = cheap_loop_m_made + 5
			cheap_loop_m_count = cheap_loop_m_count + 5
			globals.set_int(CLg, 1)
			sleep(cheap_loop_delay)
		end
	end
end

local function toggle_death_loop_afk()
	if localplayer ~= nil then
		while states.b28 do
			if death_loop_r_cash > 0 then
				if death_loop_m_count * 10000 >= death_loop_r_cash then
					states.b28 		  = false
					states.i59 		  = 0
					death_loop_r_cash = 0
					break
				end
			end
			death_loop_m_made  = death_loop_m_made + 5
			death_loop_m_count = death_loop_m_count + 5
			trigger_transaction(0x610F9AB4, 50000)
			sleep(death_loop_delay)
		end
	end
end

local function toggle_night_loop_afk()
	if localplayer ~= nil then
		for i = NLISg, NLIEg do
			globals.set_int(i, 300000)
		end
		globals.set_int(NLSCg, 300000)
		while states.b30 do
			local safe_value = 1845281 + 1 + (get_localplayer_id() * 883) + 268 + 358 + 5
			stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
			sleep(night_loop_delay)
			if globals.get_int(safe_value) ~= 0 then
				if night_loop_r_cash > 0 then
					if night_loop_m_count * 100000 >= night_loop_r_cash then
						states.b30 		  = false
						states.i61    	  = 0
						night_loop_r_cash = 0
						break
					end
				end
				night_loop_m_made  = night_loop_m_made + 3
				night_loop_m_count = night_loop_m_count + 3
				AMN:set_int(NLCl, 1)
				sleep(night_loop_delay)
			end
		end
	end
end

local function toggle_op_loop_afk()
	if localplayer ~= nil then
		while states.b32 do
			if op_loop_r_cash > 0 then
				if op_loop_m_count * 10000 >= op_loop_r_cash then
					states.b32	   = false
					states.i63	   = 0
					op_loop_r_cash = 0
					break
				end
			end
			op_loop_m_made  = op_loop_m_made + 18
			op_loop_m_count = op_loop_m_count + 18
			trigger_transaction(0x615762F1, 180000)
			sleep(op_loop_delay)
		end
	end
end

local function toggle_orbital_loop_afk()
	if localplayer ~= nil and orbital_loop_warn then
		while states.b33 do
			globals.set_int(ORg, 1)
			sleep(3)
			globals.set_int(ORg, 0)
			sleep(30)
		end
	end
end

local function toggle_achievement_unlocker_loop()
	while states.b34 do
		for i = 1, 77 do
			globals.set_int(AUg, i)
		end
	sleep(1)
	end
end

local function toggle_fast_run_n_reload(bool)
	local function set_fast_run_n_reload(value)
		for i = 1, 3 do
			stats.set_int(MPX() .. "CHAR_FM_ABILITY_" .. i .. "_UNLCK", value)
			stats.set_int(MPX() .. "CHAR_ABILITY_" .. i .. "_UNLCK", value)
		end
	end
	set_fast_run_n_reload((bool) and -1 or 0)
end

local function toggle_sex_changer(bool)
	stats.set_int(MPX() .. "ALLOW_GENDER_CHANGE", (bool) and 52 or 0)
	globals.set_int(SCCg, (bool) and 0 or 2880000)
end

local function toggle_bunker_unlocker_loop()
	local function set_bunker_research(value1, value2, value3, value4, value5)
		globals.set_int(BUCg1, value1)
		globals.set_int(BUCg2, value2)
		globals_set_ints(BUCg3, BUCg4, 1, value3)
		globals.set_int(BUAg1, value4)
		globals.set_int(BUAg2, value5)
	end
	if states.b44 then
		set_bunker_research(1, 1, 1, 0, 0)
		menu.trigger_bunker_research()
	else
		set_bunker_research(60, 300000, 45000, 2, 1)
	end
	while states.b44 do
		globals.set_int(GSIg + 6, 1)
		sleep(11)
	end
end

local function toggle_dripfeed_vehicles(bool)
	globals_set_bools(EDVg1, EDVg2, 1, (bool) and true or false)
	globals.set_int(EDVBg, (bool) and 1 or 0)
end

local function toggle_removed_vehicles(bool)
	local function set_removed_vehicles(true_false)
		globals_set_bools(EVg1, EVg2, 1, true_false)
		globals_set_bools(EVg3, EVg4, 1, true_false)
		globals_set_bools(EVg5, EVg6, 1, true_false)
		globals_set_bools(EVg7, EVg8, 1, true_false)
		globals_set_bools(EVg9, EVg10, 1, true_false)
		globals_set_bools(EVg11, EVg12, 1, true_false)
		globals_set_bools(EVg13, EVg14, 2, true_false)
		globals_set_bools(EVg15, EVg16, 1, true_false)
		globals_set_bools(EVg17, EVg18, 1, true_false)
		globals_set_bools(EVg19, EVg18, 1, true_false)
		globals_set_bools(EVg19, EVg20, 1, true_false)
		globals_set_bools(EVg21,  EVg22, 1, true_false)
		globals.set_bool(EVg23, true_false)
		globals.set_bool(EVg24, true_false)
		globals_set_bools(EVg21, EVg22, 1, true_false)
		globals_set_bools(EVg23, EVg24, 1, true_false)
		globals_set_bools(EVg25, EVg26, 1, true_false)
		globals_set_bools(EVg27, EVg28, 1, true_false)
		globals_set_bools(EVg31, EVg32, 1, true_false)
		globals_set_bools(EVg33, EVg34, 1, true_false)
		globals_set_bools(EVg35, EVg36, 1, true_false)
		globals_set_bools(EVg37, EVg38, 1, true_false)
		globals_set_bools(EVg39, EVg40, 1, true_false)
		globals_set_bools(EVg41, EVg42, 1, true_false)
		globals.set_bool(EVg43, true_false)
		globals_set_bools(EVg44, EVg45, 1, true_false)
		globals_set_bools(EVg46, EVg47, 1, true_false)
	end
	set_removed_vehicles((bool) and true or false)
end

local function toggle_silent_n_sneaky()
	local hide_me = 1845281 + 1 + (get_localplayer_id() * 883) + 206
	if states.b48 and localplayer ~= nil then
		while states.b48 do
			globals.set_int(hide_me, 8)
			sleep(1)
		end
	else
		globals.set_int(hide_me, 9)
	end
end

local function toggle_gunvan_discounts(bool)
	local function set_gunvan_discounts(value)
		globals_set_ints(GVADg + 1, GVADg + 9, 1, value)
		globals_set_ints(GVTDg + 1, GVTDg + 3, 1, value)
		globals_set_ints(GVWDg + 1, GVWDg + 5, 1, value)
	end
	set_gunvan_discounts((bool) and 1036831744 or 0)
end

local function toggle_bypass_locks(bool)
	if localplayer ~= nil then
		while bool do
			if GSH:is_active() then
				GSH:set_int(BLWLl, GSH:get_int(BLWLl) | (1 << 8))
			end
			sleep(1)
		end
	end
end

--Local "unlock" Functions--

local function unlock_awards_victory1(v1, v2, v3, v4)
	stats.set_int(MPX() .. "NUMBER_SLIPSTREAMS_IN_RACE", v1)
	stats.set_int(MPX() .. "AWD_FM_DM_WINS", v2)
	stats.set_int(MPX() .. "AWD_FM_TDM_WINS", v2)
	stats.set_int(MPX() .. "AWD_FM_TDM_MVP", v2)
	stats.set_int(MPX() .. "AWD_RACES_WON", v2)
	stats.set_int(MPX() .. "AWD_FM_GTA_RACES_WON", v2)
	stats.set_int(MPX() .. "AWD_FM_RACES_FASTEST_LAP", v2)
	stats.set_int(MPX() .. "NUMBER_TURBO_STARTS_IN_RACE", v2)
	stats.set_int(MPX() .. "AWD_CARS_EXPORTED", v2)
	stats.set_int(MPX() .. "AWD_WIN_CAPTURES", v2)
	stats.set_int(MPX() .. "AWD_WIN_LAST_TEAM_STANDINGS", v2)
	stats.set_int(MPX() .. "AWD_ONLY_PLAYER_ALIVE_LTS", v2)
	stats.set_int(MPX() .. "AWD_FMWINAIRRACE", v3)
	stats.set_int(MPX() .. "AWD_FMWINSEARACE", v3)
	stats.set_int(MPX() .. "AWD_NO_ARMWRESTLING_WINS", v3)
	stats.set_int(MPX() .. "MOST_ARM_WRESTLING_WINS", v3)
	stats.set_int(MPX() .. "AWD_WIN_AT_DARTS", v3)
	stats.set_int(MPX() .. "AWD_FM_GOLF_WON", v3)
	stats.set_int(MPX() .. "AWD_FM_TENNIS_WON", v3)
	stats.set_int(MPX() .. "AWD_FM_SHOOTRANG_CT_WON", v3)
	stats.set_int(MPX() .. "AWD_FM_SHOOTRANG_RT_WON", v3)
	stats.set_int(MPX() .. "AWD_FM_SHOOTRANG_TG_WON", v3)
	stats.set_int(MPX() .. "AWD_WIN_CAPTURE_DONT_DYING", v3)
	stats.set_int(MPX() .. "AWD_KILL_TEAM_YOURSELF_LTS", v3)
	stats.set_int(MPX() .. "AIR_LAUNCHES_OVER_40M", v3)
	stats.set_int(MPX() .. "AWD_LESTERDELIVERVEHICLES", v3)
	stats.set_int(MPX() .. "AWD_FMRALLYWONDRIVE", v3)
	stats.set_int(MPX() .. "AWD_FMRALLYWONNAV", v3)
	stats.set_int(MPX() .. "AWD_FMWINRACETOPOINTS", v3)
	stats.set_int(MPX() .. "AWD_FM_RACE_LAST_FIRST", v3)
	stats.set_int(MPX() .. "AWD_FMHORDWAVESSURVIVE", v4)
end

local function unlock_awards_victory2(v1, v2, v3, v4, v5, v6, v7)
	stats.set_int("MPPLY_FM_MISSION_LIKES", v1)
	stats.set_int("MPPLY_SHOOTINGRANGE_TOTAL_MATCH", v2)
	stats.set_int("MPPLY_DARTS_TOTAL_MATCHES", v3)
	stats.set_int("MPPLY_TOTAL_TDEATHMATCH_WON", v4)
	stats.set_int("MPPLY_DARTS_TOTAL_WINS", v4)
	stats.set_int("MPPLY_RACE_2_POINT_WINS", v4)
	stats.set_int("MPPLY_MISSIONS_CREATED", v4)
	stats.set_int("MPPLY_LTS_CREATED", v4)
	stats.set_int("MPPLY_GOLF_WINS", v4)
	stats.set_int("MPPLY_BJ_WINS", v4)
	stats.set_int("MPPLY_TENNIS_MATCHES_WON", v4)
	stats.set_int("MPPLY_SHOOTINGRANGE_WINS", v4)
	stats.set_int("MPPLY_TOTAL_DEATHMATCH_WON", v4)
	stats.set_int("MPPLY_TOTAL_CUSTOM_RACES_WON", v4)
	stats.set_int("MPPLY_TOTAL_RACES_WON", v4)
	stats.set_int("MPPLY_TOTAL_RACES_LOST", v5)
	stats.set_int("MPPLY_TOTAL_DEATHMATCH_LOST", v5)
	stats.set_int("MPPLY_TOTAL_TDEATHMATCH_LOST", v5)
	stats.set_int("MPPLY_SHOOTINGRANGE_LOSSES", v5)
	stats.set_int("MPPLY_TENNIS_MATCHES_LOST", v5)
	stats.set_int("MPPLY_GOLF_LOSSES", v5)
	stats.set_int("MPPLY_BJ_LOST", v5)
	stats.set_int("MPPLY_RACE_2_POINT_LOST", v5)
	stats.set_int("MPPLY_KILLS_PLAYERS", v6)
	stats.set_int("MPPLY_DEATHS_PLAYER", v7)
end

local function unlock_awards_victory3(v)
	stats.set_bool(MPX() .. "AWD_FMKILL3ANDWINGTARACE", v)
	stats.set_bool(MPX() .. "AWD_FMWINCUSTOMRACE", v)
	stats.set_bool(MPX() .. "CL_RACE_MODDED_CAR", v)
	stats.set_bool(MPX() .. "AWD_FMRACEWORLDRECHOLDER", v)
	stats.set_bool(MPX() .. "AWD_FMWINALLRACEMODES", v)
	stats.set_bool(MPX() .. "AWD_FM_TENNIS_5_SET_WINS", v)
	stats.set_bool(MPX() .. "AWD_FM_TENNIS_STASETWIN", v)
	stats.set_bool(MPX() .. "AWD_FM_SHOOTRANG_GRAN_WON", v)
	stats.set_bool(MPX() .. "AWD_FMWINEVERYGAMEMODE", v)
end

local function unlock_awards_general1(v1, v2, v3, v4, v5, v6)
	stats.set_int(MPX() .. "AWD_FMBBETWIN", v1)
	stats.set_int(MPX() .. "BOUNTPLACED", v2)
	stats.set_int(MPX() .. "BETAMOUNT", v2)
	stats.set_int(MPX() .. "CRARMWREST", v2)
	stats.set_int(MPX() .. "CRBASEJUMP", v2)
	stats.set_int(MPX() .. "CRDARTS", v2)
	stats.set_int(MPX() .. "CRDM", v2)
	stats.set_int(MPX() .. "CRGANGHIDE", v2)
	stats.set_int(MPX() .. "CRGOLF", v2)
	stats.set_int(MPX() .. "CRHORDE", v2)
	stats.set_int(MPX() .. "CRMISSION", v2)
	stats.set_int(MPX() .. "CRSHOOTRNG", v2)
	stats.set_int(MPX() .. "CRTENNIS", v2)
	stats.set_int(MPX() .. "NO_TIMES_CINEMA", v2)
	stats.set_int(MPX() .. "BOUNTSONU", v3)
	stats.set_int(MPX() .. "AWD_DROPOFF_CAP_PACKAGES", v4)
	stats.set_int(MPX() .. "AWD_PICKUP_CAP_PACKAGES", v4)
	stats.set_int(MPX() .. "NO_PHOTOS_TAKEN", v4)
	stats.set_int(MPX() .. "AWD_MENTALSTATE_TO_NORMAL", v5)
	stats.set_int(MPX() .. "CR_DIFFERENT_DM", v6)
	stats.set_int(MPX() .. "CR_DIFFERENT_RACES", v6)
	stats.set_int(MPX() .. "AWD_PARACHUTE_JUMPS_20M", v6)
	stats.set_int(MPX() .. "AWD_PARACHUTE_JUMPS_50M", v6)
	stats.set_int(MPX() .. "AWD_FMBASEJMP", v6)
	stats.set_int(MPX() .. "AWD_FM_GOLF_BIRDIES", v6)
	stats.set_int(MPX() .. "AWD_FM_TENNIS_ACE", v6)
	stats.set_int(MPX() .. "AWD_LAPDANCES", v6)
	stats.set_int(MPX() .. "AWD_FMCRATEDROPS", v6)
	stats.set_int(MPX() .. "AWD_NO_HAIRCUTS", v6)
	stats.set_int(MPX() .. "AWD_TRADE_IN_YOUR_PROPERTY", v6)
end

local function unlock_awards_general2(v1, v2, v3)
	stats.set_int("MPPLY_AWD_FM_CR_MISSION_SCORE", v1)
	stats.set_int("MPPLY_AWD_FM_CR_DM_MADE", v2)
	stats.set_int("MPPLY_AWD_FM_CR_RACES_MADE", v2)
	stats.set_int("MPPLY_AWD_FM_CR_PLAYED_BY_PEEP", v3)
end

local function unlock_awards_general3(v)
	stats.set_bool(MPX() .. "AWD_DAILYOBJWEEKBONUS", v)
	stats.set_bool(MPX() .. "AWD_DAILYOBJMONTHBONUS", v)
	stats.set_bool(MPX() .. "CL_DRIVE_RALLY", v)
	stats.set_bool(MPX() .. "CL_PLAY_GTA_RACE", v)
	stats.set_bool(MPX() .. "CL_PLAY_BOAT_RACE", v)
	stats.set_bool(MPX() .. "CL_PLAY_FOOT_RACE", v)
	stats.set_bool(MPX() .. "CL_PLAY_TEAM_DM", v)
	stats.set_bool(MPX() .. "CL_PLAY_VEHICLE_DM", v)
	stats.set_bool(MPX() .. "CL_PLAY_MISSION_CONTACT", v)
	stats.set_bool(MPX() .. "CL_PLAY_A_PLAYLIST", v)
	stats.set_bool(MPX() .. "CL_PLAY_POINT_TO_POINT", v)
	stats.set_bool(MPX() .. "CL_PLAY_ONE_ON_ONE_DM", v)
	stats.set_bool(MPX() .. "CL_PLAY_ONE_ON_ONE_RACE", v)
	stats.set_bool(MPX() .. "CL_SURV_A_BOUNTY", v)
	stats.set_bool(MPX() .. "CL_SET_WANTED_LVL_ON_PLAY", v)
	stats.set_bool(MPX() .. "CL_GANG_BACKUP_GANGS", v)
	stats.set_bool(MPX() .. "CL_GANG_BACKUP_LOST", v)
	stats.set_bool(MPX() .. "CL_GANG_BACKUP_VAGOS", v)
	stats.set_bool(MPX() .. "CL_CALL_MERCENARIES", v)
	stats.set_bool(MPX() .. "CL_PHONE_MECH_DROP_CAR", v)
	stats.set_bool(MPX() .. "CL_GONE_OFF_RADAR", v)
	stats.set_bool(MPX() .. "CL_FILL_TITAN", v)
	stats.set_bool(MPX() .. "CL_MOD_CAR_USING_APP", v)
	stats.set_bool(MPX() .. "CL_MOD_CAR_USING_APP", v)
	stats.set_bool(MPX() .. "CL_BUY_INSURANCE", v)
	stats.set_bool(MPX() .. "CL_BUY_GARAGE", v)
	stats.set_bool(MPX() .. "CL_ENTER_FRIENDS_HOUSE", v)
	stats.set_bool(MPX() .. "CL_CALL_STRIPPER_HOUSE", v)
	stats.set_bool(MPX() .. "CL_CALL_FRIEND", v)
	stats.set_bool(MPX() .. "CL_SEND_FRIEND_REQUEST", v)
	stats.set_bool(MPX() .. "CL_W_WANTED_PLAYER_TV", v)
	stats.set_bool(MPX() .. "FM_INTRO_CUT_DONE", v)
	stats.set_bool(MPX() .. "FM_INTRO_MISS_DONE", v)
	stats.set_bool(MPX() .. "SHOOTINGRANGE_SEEN_TUT", v)
	stats.set_bool(MPX() .. "TENNIS_SEEN_TUTORIAL", v)
	stats.set_bool(MPX() .. "DARTS_SEEN_TUTORIAL", v)
	stats.set_bool(MPX() .. "ARMWRESTLING_SEEN_TUTORIAL", v)
	stats.set_bool(MPX() .. "HAS_WATCHED_BENNY_CUTSCE", v)
	stats.set_bool(MPX() .. "AWD_FM25DIFFERENTRACES", v)
	stats.set_bool(MPX() .. "AWD_FM25DIFFERENTDM", v)
	stats.set_bool(MPX() .. "AWD_FMATTGANGHQ", v)
	stats.set_bool(MPX() .. "AWD_FM6DARTCHKOUT", v)
	stats.set_bool(MPX() .. "AWD_FM_GOLF_HOLE_IN_1", v)
	stats.set_bool(MPX() .. "AWD_FMPICKUPDLCCRATE1ST", v)
	stats.set_bool(MPX() .. "AWD_FM25DIFITEMSCLOTHES", v)
	stats.set_bool(MPX() .. "AWD_BUY_EVERY_GUN", v)
	stats.set_bool(MPX() .. "AWD_DRIVELESTERCAR5MINS", v)
	stats.set_bool(MPX() .. "AWD_FMTATTOOALLBODYPARTS", v)
	stats.set_bool(MPX() .. "AWD_STORE_20_CAR_IN_GARAGES", v)
end

local function unlock_awards_weapons(v1, v2)
	stats.set_int(MPX() .. "FIREWORK_TYPE_1_WHITE", v1)
	stats.set_int(MPX() .. "FIREWORK_TYPE_1_RED", v1)
	stats.set_int(MPX() .. "FIREWORK_TYPE_1_BLUE", v1)
	stats.set_int(MPX() .. "FIREWORK_TYPE_2_WHITE", v1)
	stats.set_int(MPX() .. "FIREWORK_TYPE_2_RED", v1)
	stats.set_int(MPX() .. "FIREWORK_TYPE_2_BLUE", v1)
	stats.set_int(MPX() .. "FIREWORK_TYPE_3_WHITE", v1)
	stats.set_int(MPX() .. "FIREWORK_TYPE_3_RED", v1)
	stats.set_int(MPX() .. "FIREWORK_TYPE_3_BLUE", v1)
	stats.set_int(MPX() .. "FIREWORK_TYPE_4_WHITE", v1)
	stats.set_int(MPX() .. "FIREWORK_TYPE_4_RED", v1)
	stats.set_int(MPX() .. "FIREWORK_TYPE_4_BLUE", v1)
	stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED2", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED3", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_UNLOCKED4", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_ADDON_1_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_ADDON_2_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_ADDON_3_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_ADDON_4_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_FREE", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_FREE2", v2)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_FREE", v2)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_FREE2", v2)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_FREE3", v2)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_FREE4", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_PURCHASED", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_PURCHASED2", v2)
	stats.set_int(MPX() .. "WEAPON_PICKUP_BITSET", v2)
	stats.set_int(MPX() .. "WEAPON_PICKUP_BITSET2", v2)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED", v2)
	stats.set_int(MPX() .. "NO_WEAPONS_UNLOCK", v2)
	stats.set_int(MPX() .. "NO_WEAPON_MODS_UNLOCK", v2)
	stats.set_int(MPX() .. "NO_WEAPON_CLR_MOD_UNLOCK", v2)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED2", v2)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED3", v2)
	stats.set_int(MPX() .. "CHAR_FM_WEAP_UNLOCKED4", v2)
	stats.set_int(MPX() .. "CHAR_KIT_1_FM_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_KIT_2_FM_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_KIT_3_FM_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_KIT_4_FM_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_KIT_5_FM_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_KIT_6_FM_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_KIT_7_FM_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_KIT_8_FM_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_KIT_9_FM_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_KIT_10_FM_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_KIT_11_FM_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_KIT_12_FM_UNLCK", v2)
	stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE2", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE3", v2)
	stats.set_int(MPX() .. "CHAR_WEAP_FM_PURCHASE4", v2)
	stats.set_int(MPX() .. "WEAP_FM_ADDON_PURCH", v2)
	for i = 2, 19 do
		stats.set_int(MPX() .. "WEAP_FM_ADDON_PURCH" .. i, v2)
	end
	for j = 1, 19 do
		stats.set_int(MPX() .. "CHAR_FM_WEAP_ADDON_" .. j .. "_UNLCK", v2)
	end
	for m = 1, 41 do
		stats.set_int(MPX() .. "CHAR_KIT_" .. m .. "_FM_UNLCK", v2)
	end
	for l = 2, 41 do
		stats.set_int(MPX() .. "CHAR_KIT_FM_PURCHASE" .. l, v2)
	end
end

local function unlock_awards_crimes(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25)
	stats.set_int(MPX() .. "CLUBHOUSECONTRACTEARNINGS", v1)
	stats.set_int(MPX() .. "CHAR_WANTED_LEVEL_TIME5STAR", v2)
	stats.set_int(MPX() .. "STARS_ATTAINED", v3)
	stats.set_int(MPX() .. "KILLS_COP", v4)
	stats.set_int(MPX() .. "STARS_EVADED", v5)
	stats.set_int(MPX() .. "KILLS_PLAYERS", v6)
	stats.set_int(MPX() .. "DEATHS_PLAYER", v7)
	stats.set_int(MPX() .. "MC_CONTRIBUTION_POINTS", v8)
	stats.set_int(MPX() .. "SHOTS", v8)
	stats.set_int(MPX() .. "CR_GANGATTACK_CITY", v8)
	stats.set_int(MPX() .. "CR_GANGATTACK_COUNTRY", v8)
	stats.set_int(MPX() .. "CR_GANGATTACK_LOST", v8)
	stats.set_int(MPX() .. "CR_GANGATTACK_VAGOS", v8)
	stats.set_int(MPX() .. "DIED_IN_DROWNING", v9)
	stats.set_int(MPX() .. "DIED_IN_DROWNINGINVEHICLE", v9)
	stats.set_int(MPX() .. "DIED_IN_EXPLOSION", v9)
	stats.set_int(MPX() .. "DIED_IN_FALL", v9)
	stats.set_int(MPX() .. "DIED_IN_FIRE", v9)
	stats.set_int(MPX() .. "DIED_IN_ROAD", v9)
	stats.set_int(MPX() .. "KILLS", v10)
	stats.set_int(MPX() .. "MEMBERSMARKEDFORDEATH", v11)
	stats.set_int(MPX() .. "MCDEATHS", v11)
	stats.set_int(MPX() .. "RIVALPRESIDENTKILLS", v11)
	stats.set_int(MPX() .. "RIVALCEOANDVIPKILLS", v11)
	stats.set_int(MPX() .. "CLUBHOUSECONTRACTSCOMPLETE", v11)
	stats.set_int(MPX() .. "CLUBCHALLENGESCOMPLETED", v11)
	stats.set_int(MPX() .. "MEMBERCHALLENGESCOMPLETED", v11)
	stats.set_int(MPX() .. "KILLS_ARMED", v12)
	stats.set_int(MPX() .. "HORDKILLS", v13)
	stats.set_int(MPX() .. "UNIQUECRATES", v13)
	stats.set_int(MPX() .. "BJWINS", v13)
	stats.set_int(MPX() .. "HORDEWINS", v13)
	stats.set_int(MPX() .. "MCMWINS", v13)
	stats.set_int(MPX() .. "GANGHIDWINS", v13)
	stats.set_int(MPX() .. "GHKILLS", v13)
	stats.set_int(MPX() .. "TIRES_POPPED_BY_GUNSHOT", v13)
	stats.set_int(MPX() .. "KILLS_INNOCENTS", v13)
	stats.set_int(MPX() .. "KILLS_ENEMY_GANG_MEMBERS", v13)
	stats.set_int(MPX() .. "KILLS_FRIENDLY_GANG_MEMBERS", v13)
	stats.set_int(MPX() .. "MCKILLS", v13)
	stats.set_int(MPX() .. "SNIPERRFL_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "HVYSNIPER_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "BIGGEST_VICTIM_KILLS", v13)
	stats.set_int(MPX() .. "ARCHENEMY_KILLS", v13)
	stats.set_int(MPX() .. "KILLS_SWAT", v13)
	stats.set_int(MPX() .. "VEHEXPORTED", v13)
	stats.set_int(MPX() .. "NO_NON_CONTRACT_RACE_WIN", v13)
	stats.set_int(MPX() .. "MICROSMG_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "SMG_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "ASLTSMG_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "CRBNRIFLE_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "ADVRIFLE_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "MG_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "CMBTMG_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "ASLTMG_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "RPG_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "PISTOL_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "PLAYER_HEADSHOTS", v13)
	stats.set_int(MPX() .. "SAWNOFF_ENEMY_KILLS", v13)
	stats.set_int(MPX() .. "AWD_VEHICLES_JACKEDR", v13)
	stats.set_int(MPX() .. "NUMBER_CRASHES_CARS", v14)
	stats.set_int(MPX() .. "NUMBER_CRASHES_BIKES", v14)
	stats.set_int(MPX() .. "BAILED_FROM_VEHICLE", v14)
	stats.set_int(MPX() .. "NUMBER_CRASHES_QUADBIKES", v14)
	stats.set_int(MPX() .. "NUMBER_STOLEN_COP_VEHICLE", v14)
	stats.set_int(MPX() .. "NUMBER_STOLEN_CARS", v14)
	stats.set_int(MPX() .. "NUMBER_STOLEN_BIKES", v14)
	stats.set_int(MPX() .. "NUMBER_STOLEN_BOATS", v14)
	stats.set_int(MPX() .. "NUMBER_STOLEN_HELIS", v14)
	stats.set_int(MPX() .. "NUMBER_STOLEN_PLANES", v14)
	stats.set_int(MPX() .. "NUMBER_STOLEN_QUADBIKES", v14)
	stats.set_int(MPX() .. "NUMBER_STOLEN_BICYCLES", v14)
	stats.set_int(MPX() .. "CARS_COPS_EXPLODED", v14)
	stats.set_int(MPX() .. "BOATS_EXPLODED", v15)
	stats.set_int(MPX() .. "PLANES_EXPLODED", v16)
	stats.set_int(MPX() .. "AWD_FMTIME5STARWANTED", v17)
	stats.set_int(MPX() .. "AWD_ENEMYDRIVEBYKILLS", v18)
	stats.set_int(MPX() .. "BIKES_EXPLODED", v18)
	stats.set_int(MPX() .. "HITS_PEDS_VEHICLES", v18)
	stats.set_int(MPX() .. "HEADSHOTS", v18)
	stats.set_int(MPX() .. "SUCCESSFUL_COUNTERS", v18)
	stats.set_int(MPX() .. "KILLS_STEALTH", v18)
	stats.set_int(MPX() .. "KILLS_BY_OTHERS", v18)
	stats.set_int(MPX() .. "TOTAL_NO_SHOPS_HELD_UP", v18)
	stats.set_int(MPX() .. "HELIS_EXPLODED", v19)
	stats.set_int(MPX() .. "AWD_5STAR_WANTED_AVOIDANCE", v20)
	stats.set_int(MPX() .. "QUADBIKE_EXPLODED", v20)
	stats.set_int(MPX() .. "GRENADE_ENEMY_KILLS", v20)
	stats.set_int(MPX() .. "STKYBMB_ENEMY_KILLS", v20)
	stats.set_int(MPX() .. "UNARMED_ENEMY_KILLS", v20)
	stats.set_int(MPX() .. "BICYCLE_EXPLODED", v21)
	stats.set_int(MPX() .. "SUBMARINE_EXPLODED", v22)
	stats.set_int(MPX() .. "AWD_FMSHOOTDOWNCOPHELI", v23)
	stats.set_int(MPX() .. "AWD_SECURITY_CARS_ROBBED", v23)
	stats.set_int(MPX() .. "AWD_ODISTRACTCOPSNOEATH", v23)
	stats.set_int(MPX() .. "AWD_HOLD_UP_SHOPS", v24)
	stats.set_int(MPX() .. "HORDELVL", v25)
end

local function unlock_awards_vehicles1(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
	stats.set_int(MPX() .. "FAVOUTFITBIKETIMECURRENT", v1)
	stats.set_int(MPX() .. "FAVOUTFITBIKETIME1ALLTIME", v1)
	stats.set_int(MPX() .. "FAVOUTFITBIKETYPECURRENT", v1)
	stats.set_int(MPX() .. "FAVOUTFITBIKETYPEALLTIME", v1)
	stats.set_int(MPX() .. "NO_CARS_REPAIR", v2)
	stats.set_int(MPX() .. "LONGEST_WHEELIE_DIST", v2)
	stats.set_int(MPX() .. "AWD_50_VEHICLES_BLOWNUP", v3)
	stats.set_int(MPX() .. "CARS_EXPLODED", v3)
	stats.set_int(MPX() .. "VEHICLES_SPRAYED", v3)
	stats.set_int(MPX() .. "NUMBER_NEAR_MISS_NOCRASH", v3)
	stats.set_int(MPX() .. "AWD_CAR_EXPORT", v4)
	stats.set_int(MPX() .. "RACES_WON", v5)
	stats.set_int(MPX() .. "USJS_FOUND", v5)
	stats.set_int(MPX() .. "USJS_COMPLETED", v5)
	stats.set_int(MPX() .. "USJS_TOTAL_COMPLETED", v5)
	stats.set_int(MPX() .. "AWD_FMDRIVEWITHOUTCRASH", v6)
	stats.set_int(MPX() .. "AWD_VEHICLE_JUMP_OVER_40M", v7)
	stats.set_int(MPX() .. "COUNT_HOTRING_RACE", v8)
	stats.set_int(MPX() .. "MOST_FLIPS_IN_ONE_JUMP", v9)
	stats.set_int(MPX() .. "MOST_SPINS_IN_ONE_JUMP", v9)
	stats.set_int(MPX() .. "CRDEADLINE", v9)
	stats.set_int(MPX() .. "AWD_PASSENGERTIME", v10)
	stats.set_int(MPX() .. "AWD_TIME_IN_HELICOPTER", v10)
	stats.set_int(MPX() .. "CHAR_FM_VEHICLE_1_UNLCK", v11)
	stats.set_int(MPX() .. "CHAR_FM_VEHICLE_2_UNLCK", v11)
end

local function unlock_awards_vehicles2(v)
	stats.set_bool(MPX() .. "AWD_FMFURTHESTWHEELIE", v)
	stats.set_bool(MPX() .. "AWD_FMFULLYMODDEDCAR", v)
end

local function unlock_awards_combat1(v1, v2, v3, v4, v5, v6, v7, v8, v9)
	stats.set_int(MPX() .. "HITS", v1)
	stats.set_int(MPX() .. "AWD_FMOVERALLKILLS", v2)
	stats.set_int(MPX() .. "NUMBER_NEAR_MISS", v2)
	stats.set_int(MPX() .. "HIGHEST_SKITTLES", v3)
	stats.set_int(MPX() .. "MELEEKILLS", v4)
	stats.set_int(MPX() .. "AWD_100_HEADSHOTS", v5)
	stats.set_int(MPX() .. "AWD_100_KILLS_PISTOL", v5)
	stats.set_int(MPX() .. "AWD_100_KILLS_SMG", v5)
	stats.set_int(MPX() .. "AWD_100_KILLS_SHOTGUN", v5)
	stats.set_int(MPX() .. "ASLTRIFLE_ENEMY_KILLS", v5)
	stats.set_int(MPX() .. "AWD_100_KILLS_SNIPER", v5)
	stats.set_int(MPX() .. "MG_ENEMY_KILLS", v5)
	stats.set_int(MPX() .. "AWD_FM_DM_TOTALKILLS", v5)
	stats.set_int(MPX() .. "DEATHS", v6)
	stats.set_int(MPX() .. "AWD_FM_DM_KILLSTREAK", v7)
	stats.set_int(MPX() .. "AWD_KILL_CARRIER_CAPTURE", v7)
	stats.set_int(MPX() .. "AWD_NIGHTVISION_KILLS", v7)
	stats.set_int(MPX() .. "AWD_KILL_PSYCHOPATHS", v7)
	stats.set_int(MPX() .. "AWD_FMREVENGEKILLSDM", v8)
	stats.set_int(MPX() .. "AWD_TAKEDOWNSMUGPLANE", v8)
	stats.set_int(MPX() .. "AWD_25_KILLS_STICKYBOMBS", v8)
	stats.set_int(MPX() .. "AWD_50_KILLS_GRENADES", v8)
	stats.set_int(MPX() .. "AWD_50_KILLS_ROCKETLAUNCH", v8)
	stats.set_int(MPX() .. "AWD_20_KILLS_MELEE", v8)
	stats.set_int(MPX() .. "AWD_FM_DM_3KILLSAMEGUY", v8)
	stats.set_int(MPX() .. "AWD_FM_DM_STOLENKILL", v8)
	stats.set_int(MPX() .. "AWD_FMKILLBOUNTY", v9)
	stats.set_int(MPX() .. "AWD_CAR_BOMBS_ENEMY_KILLS", v9)
end

local function unlock_awards_combat2(v)
	stats.set_bool(MPX() .. "AWD_FMKILLSTREAKSDM", v)
	stats.set_bool(MPX() .. "AWD_FMMOSTKILLSGANGHIDE", v)
	stats.set_bool(MPX() .. "AWD_FMMOSTKILLSSURVIVE", v)
end

local function unlock_awards_heists1(v1, v2, v3)
	stats.set_int(MPX() .. "AWD_FINISH_HEISTS", v1)
	stats.set_int(MPX() .. "AWD_FINISH_HEIST_SETUP_JOB", v1)
	stats.set_int(MPX() .. "AWD_WIN_GOLD_MEDAL_HEISTS", v2)
	stats.set_int(MPX() .. "AWD_DO_HEIST_AS_MEMBER", v2)
	stats.set_int(MPX() .. "AWD_DO_HEIST_AS_THE_LEADER", v2)
	stats.set_int(MPX() .. "AWD_CONTROL_CROWDS", v2)
	stats.set_int(MPX() .. "HEIST_COMPLETION", v2)
	stats.set_int(MPX() .. "AWD_COMPLETE_HEIST_NOT_DIE", v3)
	stats.set_int(MPX() .. "HEISTS_ORGANISED", v3)
	stats.set_int(MPX() .. "HEIST_START", v3)
	stats.set_int(MPX() .. "HEIST_END", v3)
	stats.set_int(MPX() .. "CUTSCENE_MID_PRISON", v3)
	stats.set_int(MPX() .. "CUTSCENE_MID_HUMANE", v3)
	stats.set_int(MPX() .. "CUTSCENE_MID_NARC", v3)
	stats.set_int(MPX() .. "CUTSCENE_MID_ORNATE", v3)
	stats.set_int(MPX() .. "CR_FLEECA_PREP_1", v3)
	stats.set_int(MPX() .. "CR_FLEECA_PREP_2", v3)
	stats.set_int(MPX() .. "CR_FLEECA_FINALE", v3)
	stats.set_int(MPX() .. "CR_PRISON_PLANE", v3)
	stats.set_int(MPX() .. "CR_PRISON_BUS", v3)
	stats.set_int(MPX() .. "CR_PRISON_STATION", v3)
	stats.set_int(MPX() .. "CR_PRISON_UNFINISHED_BIZ", v3)
	stats.set_int(MPX() .. "CR_PRISON_FINALE", v3)
	stats.set_int(MPX() .. "CR_HUMANE_KEY_CODES", v3)
	stats.set_int(MPX() .. "CR_HUMANE_ARMORDILLOS", v3)
	stats.set_int(MPX() .. "CR_HUMANE_EMP", v3)
	stats.set_int(MPX() .. "CR_HUMANE_VALKYRIE", v3)
	stats.set_int(MPX() .. "CR_HUMANE_FINALE", v3)
	stats.set_int(MPX() .. "CR_NARC_COKE", v3)
	stats.set_int(MPX() .. "CR_NARC_TRASH_TRUCK", v3)
	stats.set_int(MPX() .. "CR_NARC_BIKERS", v3)
	stats.set_int(MPX() .. "CR_NARC_WEED", v3)
	stats.set_int(MPX() .. "CR_NARC_STEAL_METH", v3)
	stats.set_int(MPX() .. "CR_NARC_FINALE", v3)
	stats.set_int(MPX() .. "CR_PACIFIC_TRUCKS", v3)
	stats.set_int(MPX() .. "CR_PACIFIC_WITSEC", v3)
	stats.set_int(MPX() .. "CR_PACIFIC_HACK", v3)
	stats.set_int(MPX() .. "CR_PACIFIC_BIKES", v3)
	stats.set_int(MPX() .. "CR_PACIFIC_CONVOY", v3)
	stats.set_int(MPX() .. "CR_PACIFIC_FINALE", v3)
	stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", v3)
end

local function unlock_awards_heists2(v1, v2, v3)
	stats.set_int("MPPLY_WIN_GOLD_MEDAL_HEISTS", v1)
	stats.set_int("MPPLY_HEIST_ACH_TRACKER", v2)
	stats.set_bool("MPPLY_AWD_FLEECA_FIN", v3)
	stats.set_bool("MPPLY_AWD_PRISON_FIN", v3)
	stats.set_bool("MPPLY_AWD_HUMANE_FIN", v3)
	stats.set_bool("MPPLY_AWD_SERIESA_FIN", v3)
	stats.set_bool("MPPLY_AWD_PACIFIC_FIN", v3)
	stats.set_bool("MPPLY_AWD_HST_ORDER", v3)
	stats.set_bool("MPPLY_AWD_COMPLET_HEIST_MEM", v3)
	stats.set_bool("MPPLY_AWD_COMPLET_HEIST_1STPER", v3)
	stats.set_bool("MPPLY_AWD_HST_SAME_TEAM", v3)
	stats.set_bool("MPPLY_AWD_HST_ULT_CHAL", v3)
end

local function unlock_awards_heists3(v)
	stats.set_bool(MPX() .. "AWD_FINISH_HEIST_NO_DAMAGE", v)
	stats.set_bool(MPX() .. "AWD_SPLIT_HEIST_TAKE_EVENLY", v)
	stats.set_bool(MPX() .. "AWD_ACTIVATE_2_PERSON_KEY", v)
	stats.set_bool(MPX() .. "AWD_ALL_ROLES_HEIST", v)
	stats.set_bool(MPX() .. "AWD_MATCHING_OUTFIT_HEIST", v)
	stats.set_bool(MPX() .. "HEIST_PLANNING_DONE_PRINT", v)
	stats.set_bool(MPX() .. "HEIST_PLANNING_DONE_HELP_0", v)
	stats.set_bool(MPX() .. "HEIST_PLANNING_DONE_HELP_1", v)
	stats.set_bool(MPX() .. "HEIST_PRE_PLAN_DONE_HELP_0", v)
	stats.set_bool(MPX() .. "HEIST_CUTS_DONE_FINALE", v)
	stats.set_bool(MPX() .. "HEIST_IS_TUTORIAL", v)
	stats.set_bool(MPX() .. "HEIST_STRAND_INTRO_DONE", v)
	stats.set_bool(MPX() .. "HEIST_CUTS_DONE_ORNATE", v)
	stats.set_bool(MPX() .. "HEIST_CUTS_DONE_PRISON", v)
	stats.set_bool(MPX() .. "HEIST_CUTS_DONE_BIOLAB", v)
	stats.set_bool(MPX() .. "HEIST_CUTS_DONE_NARCOTIC", v)
	stats.set_bool(MPX() .. "HEIST_CUTS_DONE_TUTORIAL", v)
	stats.set_bool(MPX() .. "HEIST_AWARD_DONE_PREP", v)
	stats.set_bool(MPX() .. "HEIST_AWARD_BOUGHT_IN", v)
end

local function unlock_awards_dday1(v1, v2, v3)
	stats.set_int(MPX() .. "CR_GANGOP_MORGUE", v1)
	stats.set_int(MPX() .. "CR_GANGOP_DELUXO", v1)
	stats.set_int(MPX() .. "CR_GANGOP_SERVERFARM", v1)
	stats.set_int(MPX() .. "CR_GANGOP_IAABASE_FIN", v1)
	stats.set_int(MPX() .. "CR_GANGOP_STEALOSPREY", v1)
	stats.set_int(MPX() .. "CR_GANGOP_FOUNDRY", v1)
	stats.set_int(MPX() .. "CR_GANGOP_RIOTVAN", v1)
	stats.set_int(MPX() .. "CR_GANGOP_SUBMARINECAR", v1)
	stats.set_int(MPX() .. "CR_GANGOP_SUBMARINE_FIN", v1)
	stats.set_int(MPX() .. "CR_GANGOP_PREDATOR", v1)
	stats.set_int(MPX() .. "CR_GANGOP_BMLAUNCHER", v1)
	stats.set_int(MPX() .. "CR_GANGOP_BCCUSTOM", v1)
	stats.set_int(MPX() .. "CR_GANGOP_STEALTHTANKS", v1)
	stats.set_int(MPX() .. "CR_GANGOP_SPYPLANE", v1)
	stats.set_int(MPX() .. "CR_GANGOP_FINALE", v1)
	stats.set_int(MPX() .. "CR_GANGOP_FINALE_P2", v1)
	stats.set_int(MPX() .. "CR_GANGOP_FINALE_P3", v1)
	stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", v2)
	stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", v2)
	stats.set_int(MPX() .. "GANGOPS_FLOW_MISSION_PROG", v2)
	stats.set_int(MPX() .. "GANGOPS_HEIST_STATUS", v3)
end

local function unlock_awards_dday2(v1, v2)
	stats.set_int("MPPLY_GANGOPS_ALLINORDER", v1)
	stats.set_int("MPPLY_GANGOPS_LOYALTY", v1)
	stats.set_int("MPPLY_GANGOPS_CRIMMASMD", v1)
	stats.set_int("MPPLY_GANGOPS_LOYALTY2", v1)
	stats.set_int("MPPLY_GANGOPS_LOYALTY3", v1)
	stats.set_int("MPPLY_GANGOPS_CRIMMASMD2", v1)
	stats.set_int("MPPLY_GANGOPS_CRIMMASMD3", v1)
	stats.set_int("MPPLY_GANGOPS_SUPPORT", v1)
	stats.set_bool("MPPLY_AWD_GANGOPS_IAA", v2)
	stats.set_bool("MPPLY_AWD_GANGOPS_SUBMARINE", v2)
	stats.set_bool("MPPLY_AWD_GANGOPS_MISSILE", v2)
	stats.set_bool("MPPLY_AWD_GANGOPS_ALLINORDER", v2)
	stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY", v2)
	stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY2", v2)
	stats.set_bool("MPPLY_AWD_GANGOPS_LOYALTY3", v2)
	stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD", v2)
	stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD2", v2)
	stats.set_bool("MPPLY_AWD_GANGOPS_CRIMMASMD3", v2)
	stats.set_bool("MPPLY_AWD_GANGOPS_SUPPORT", v2)
end

local function unlock_awards_dday3(v)
	stats_set_packed_bools(18098, 18161, v)
end

local function unlock_awards_ahours1(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
	stats.set_int(MPX() .. "HUB_EARNINGS", v1)
	stats.set_int(MPX() .. "NIGHTCLUB_EARNINGS", v2)
	stats.set_int(MPX() .. "NIGHTCLUB_HOTSPOT_TIME_MS", v3)
	stats.set_int(MPX() .. "DANCE_COMBO_DURATION_MINS", v3)
	stats.set_int(MPX() .. "LIFETIME_HUB_GOODS_SOLD", v4)
	stats.set_int(MPX() .. "LIFETIME_HUB_GOODS_MADE", v5)
	stats.set_int(MPX() .. "HUB_SALES_COMPLETED", v6)
	stats.set_int(MPX() .. "CLUB_CONTRABAND_MISSION", v7)
	stats.set_int(MPX() .. "HUB_CONTRABAND_MISSION", v7)
	stats.set_int(MPX() .. "NIGHTCLUB_VIP_APPEAR", v8)
	stats.set_int(MPX() .. "NIGHTCLUB_JOBS_DONE", v8)
	stats.set_int(MPX() .. "AWD_CLUB_DRUNK", v9)
	stats.set_int(MPX() .. "AWD_DANCE_TO_SOLOMUN", v10)
	stats.set_int(MPX() .. "AWD_DANCE_TO_TALEOFUS", v10)
	stats.set_int(MPX() .. "AWD_DANCE_TO_DIXON", v10)
	stats.set_int(MPX() .. "AWD_DANCE_TO_BLKMAD", v10)
	stats.set_int(MPX() .. "DANCEPERFECTOWNCLUB", v10)
	stats.set_int(MPX() .. "NUMUNIQUEPLYSINCLUB", v10)
	stats.set_int(MPX() .. "NIGHTCLUB_PLAYER_APPEAR", v11)
	stats.set_int(MPX() .. "NIGHTCLUB_CONT_TOTAL", v12)
	stats.set_int(MPX() .. "DANCETODIFFDJS", v13)
	stats.set_int(MPX() .. "NIGHTCLUB_CONT_MISSION", v14)
end

local function unlock_awards_ahours2(v)
	stats.set_bool(MPX() .. "AWD_CLUB_HOTSPOT", v)
	stats.set_bool(MPX() .. "AWD_CLUB_CLUBBER", v)
	stats.set_bool(MPX() .. "AWD_CLUB_COORD", v)
	stats_set_packed_bools(22066, 22193, v)
end

local function unlock_awards_arena_war1(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
	stats.set_int(MPX() .. "ARN_SPEC_BOX_TIME_MS", v1)
	stats.set_int(MPX() .. "ARENAWARS_AP_LIFETIME", v2)
	stats.set_int(MPX() .. "AWD_ARENA_WAGEWORKER", v3)
	stats.set_int(MPX() .. "ARN_VEH_ISSI", v4)
	stats.set_int(MPX() .. "AWD_TOP_SCORE", v5)
	stats.set_int(MPX() .. "ARN_SPECTATOR_DRONE", v6)
	stats.set_int(MPX() .. "ARN_SPECTATOR_CAMS", v6)
	stats.set_int(MPX() .. "ARN_SMOKE", v6)
	stats.set_int(MPX() .. "ARN_DRINK", v6)
	stats.set_int(MPX() .. "ARN_VEH_MONSTER", v6)
	stats.set_int(MPX() .. "ARN_VEH_MONSTER", v6)
	stats.set_int(MPX() .. "ARN_VEH_MONSTER", v6)
	stats.set_int(MPX() .. "ARN_VEH_CERBERUS", v6)
	stats.set_int(MPX() .. "ARN_VEH_CERBERUS2", v6)
	stats.set_int(MPX() .. "ARN_VEH_CERBERUS3", v6)
	stats.set_int(MPX() .. "ARN_VEH_BRUISER", v6)
	stats.set_int(MPX() .. "ARN_VEH_BRUISER2", v6)
	stats.set_int(MPX() .. "ARN_VEH_BRUISER3", v6)
	stats.set_int(MPX() .. "ARN_VEH_SLAMVAN4", v6)
	stats.set_int(MPX() .. "ARN_VEH_SLAMVAN5", v6)
	stats.set_int(MPX() .. "ARN_VEH_SLAMVAN6", v6)
	stats.set_int(MPX() .. "ARN_VEH_BRUTUS", v6)
	stats.set_int(MPX() .. "ARN_VEH_BRUTUS2", v6)
	stats.set_int(MPX() .. "ARN_VEH_BRUTUS3", v6)
	stats.set_int(MPX() .. "ARN_VEH_SCARAB", v6)
	stats.set_int(MPX() .. "ARN_VEH_SCARAB2", v6)
	stats.set_int(MPX() .. "ARN_VEH_SCARAB3", v6)
	stats.set_int(MPX() .. "ARN_VEH_DOMINATOR4", v6)
	stats.set_int(MPX() .. "ARN_VEH_DOMINATOR5", v6)
	stats.set_int(MPX() .. "ARN_VEH_DOMINATOR6", v6)
	stats.set_int(MPX() .. "ARN_VEH_IMPALER2", v6)
	stats.set_int(MPX() .. "ARN_VEH_IMPALER3", v6)
	stats.set_int(MPX() .. "ARN_VEH_IMPALER4", v6)
	stats.set_int(MPX() .. "ARN_VEH_ISSI4", v6)
	stats.set_int(MPX() .. "ARN_VEH_ISSI5", v6)
	stats.set_int(MPX() .. "AWD_TIME_SERVED", v6)
	stats.set_int(MPX() .. "AWD_CAREER_WINNER", v6)
	stats.set_int(MPX() .. "ARENAWARS_AP_TIER", v6)
	stats.set_int(MPX() .. "ARN_W_THEME_SCIFI", v6)
	stats.set_int(MPX() .. "ARN_W_THEME_APOC", v6)
	stats.set_int(MPX() .. "ARN_W_THEME_CONS", v6)
	stats.set_int(MPX() .. "ARN_W_PASS_THE_BOMB", v6)
	stats.set_int(MPX() .. "ARN_W_DETONATION", v6)
	stats.set_int(MPX() .. "ARN_W_ARCADE_RACE", v6)
	stats.set_int(MPX() .. "ARN_W_CTF", v6)
	stats.set_int(MPX() .. "ARN_W_TAG_TEAM", v6)
	stats.set_int(MPX() .. "ARN_W_DESTR_DERBY", v6)
	stats.set_int(MPX() .. "ARN_W_CARNAGE", v6)
	stats.set_int(MPX() .. "ARN_W_MONSTER_JAM", v6)
	stats.set_int(MPX() .. "ARN_W_GAMES_MASTERS", v6)
	stats.set_int(MPX() .. "ARENAWARS_CARRER_WINS", v6)
	stats.set_int(MPX() .. "ARENAWARS_CARRER_WINT", v6)
	stats.set_int(MPX() .. "ARENAWARS_MATCHES_PLYD", v6)
	stats.set_int(MPX() .. "ARENAWARS_MATCHES_PLYDT", v6)
	stats.set_int(MPX() .. "ARN_VEH_IMPERATOR", v6)
	stats.set_int(MPX() .. "ARN_VEH_IMPERATOR2", v6)
	stats.set_int(MPX() .. "ARN_VEH_IMPERATOR3", v6)
	stats.set_int(MPX() .. "ARN_VEH_ZR380", v6)
	stats.set_int(MPX() .. "ARN_VEH_ZR3802", v6)
	stats.set_int(MPX() .. "ARN_VEH_ZR3803", v6)
	stats.set_int(MPX() .. "ARN_VEH_DEATHBIKE", v6)
	stats.set_int(MPX() .. "ARN_VEH_DEATHBIKE2", v6)
	stats.set_int(MPX() .. "ARN_VEH_DEATHBIKE3", v6)
	stats.set_int(MPX() .. "NUMBER_OF_CHAMP_BOUGHT", v6)
	stats.set_int(MPX() .. "ARN_SPECTATOR_KILLS", v6)
	stats.set_int(MPX() .. "ARN_LIFETIME_KILLS", v6)
	stats.set_int(MPX() .. "ARN_L_PASS_THE_BOMB", v7)
	stats.set_int(MPX() .. "ARN_L_DETONATION", v7)
	stats.set_int(MPX() .. "ARN_L_ARCADE_RACE", v7)
	stats.set_int(MPX() .. "ARN_L_CTF", v7)
	stats.set_int(MPX() .. "ARN_L_TAG_TEAM", v7)
	stats.set_int(MPX() .. "ARN_L_DESTR_DERBY", v7)
	stats.set_int(MPX() .. "ARN_L_CARNAGE", v7)
	stats.set_int(MPX() .. "ARN_L_MONSTER_JAM", v7)
	stats.set_int(MPX() .. "ARN_L_GAMES_MASTERS", v7)
	stats.set_int(MPX() .. "ARN_LIFETIME_DEATHS", v7)
	stats.set_int(MPX() .. "AWD_YOURE_OUTTA_HERE", v8)
	stats.set_int(MPX() .. "ARENAWARS_SP_LIFETIME", v9)
	stats.set_int(MPX() .. "AWD_WATCH_YOUR_STEP", v10)
	stats.set_int(MPX() .. "AWD_TOWER_OFFENSE", v10)
	stats.set_int(MPX() .. "AWD_READY_FOR_WAR", v10)
	stats.set_int(MPX() .. "AWD_THROUGH_A_LENS", v10)
	stats.set_int(MPX() .. "AWD_SPINNER", v10)
	stats.set_int(MPX() .. "AWD_YOUMEANBOOBYTRAPS", v10)
	stats.set_int(MPX() .. "AWD_MASTER_BANDITO", v10)
	stats.set_int(MPX() .. "AWD_SITTING_DUCK", v10)
	stats.set_int(MPX() .. "AWD_CROWDPARTICIPATION", v10)
	stats.set_int(MPX() .. "AWD_KILL_OR_BE_KILLED", v10)
	stats.set_int(MPX() .. "AWD_MASSIVE_SHUNT", v10)
	stats.set_int(MPX() .. "AWD_WEVE_GOT_ONE", v10)
	stats.set_int(MPX() .. "ARENAWARS_SKILL_LEVEL", v11)
	stats.set_int(MPX() .. "ARENAWARS_SP", v12)
	stats.set_int(MPX() .. "ARENAWARS_AP", v12)
	stats.set_int(MPX() .. "ARENAWARS_CARRER_UNLK", v13)
	stats.set_int(MPX() .. "ARN_BS_TRINKET_TICKERS", v13)
	stats.set_int(MPX() .. "ARN_BS_TRINKET_SAVED", v13)
end

local function unlock_awards_arena_war2(v)
	stats.set_bool(MPX() .. "AWD_BEGINNER", v)
	stats.set_bool(MPX() .. "AWD_FIELD_FILLER", v)
	stats.set_bool(MPX() .. "AWD_ARMCHAIR_RACER", v)
	stats.set_bool(MPX() .. "AWD_LEARNER", v)
	stats.set_bool(MPX() .. "AWD_SUNDAY_DRIVER", v)
	stats.set_bool(MPX() .. "AWD_THE_ROOKIE", v)
	stats.set_bool(MPX() .. "AWD_BUMP_AND_RUN", v)
	stats.set_bool(MPX() .. "AWD_GEAR_HEAD", v)
	stats.set_bool(MPX() .. "AWD_DOOR_SLAMMER", v)
	stats.set_bool(MPX() .. "AWD_HOT_LAP", v)
	stats.set_bool(MPX() .. "AWD_ARENA_AMATEUR", v)
	stats.set_bool(MPX() .. "AWD_PAINT_TRADER", v)
	stats.set_bool(MPX() .. "AWD_SHUNTER", v)
	stats.set_bool(MPX() .. "AWD_JOCK", v)
	stats.set_bool(MPX() .. "AWD_WARRIOR", v)
	stats.set_bool(MPX() .. "AWD_T_BONE", v)
	stats.set_bool(MPX() .. "AWD_MAYHEM", v)
	stats.set_bool(MPX() .. "AWD_WRECKER", v)
	stats.set_bool(MPX() .. "AWD_CRASH_COURSE", v)
	stats.set_bool(MPX() .. "AWD_ARENA_LEGEND", v)
	stats.set_bool(MPX() .. "AWD_PEGASUS", v)
	stats.set_bool(MPX() .. "AWD_UNSTOPPABLE", v)
	stats.set_bool(MPX() .. "AWD_CONTACT_SPORT", v)
	stats_set_packed_bools(24962, 25537, v)
end

local function unlock_awards_dcasino_resort1(v1, v2, v3)
	stats.set_int(MPX() .. "AWD_ODD_JOBS", v1)
	stats.set_int(MPX() .. "VCM_STORY_PROGRESS", v2)
	stats.set_int(MPX() .. "VCM_FLOW_PROGRESS", v3)
end

local function unlock_awards_dcasino_resort2(v)
	stats.set_bool(MPX() .. "AWD_FIRST_TIME1", v)
	stats.set_bool(MPX() .. "AWD_FIRST_TIME2", v)
	stats.set_bool(MPX() .. "AWD_FIRST_TIME3", v)
	stats.set_bool(MPX() .. "AWD_FIRST_TIME4", v)
	stats.set_bool(MPX() .. "AWD_FIRST_TIME5", v)
	stats.set_bool(MPX() .. "AWD_FIRST_TIME6", v)
	stats.set_bool(MPX() .. "AWD_ALL_IN_ORDER", v)
	stats.set_bool(MPX() .. "AWD_SUPPORTING_ROLE", v)
	stats.set_bool(MPX() .. "AWD_LEADER", v)
	stats.set_bool(MPX() .. "AWD_SURVIVALIST", v)
	stats.set_bool(MPX() .. "CAS_VEHICLE_REWARD", v)
	stats_set_packed_bools(26810, 27257, v)
end

local function unlock_awards_dcasino1(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
	stats.set_int(MPX() .. "AWD_ASTROCHIMP", v1)
	stats.set_int(MPX() .. "AWD_BATSWORD", v2)
	stats.set_int(MPX() .. "AWD_COINPURSE", v3)
	stats.set_int(MPX() .. "AWD_DAICASHCRAB", v4)
	stats.set_int(MPX() .. "AWD_MASTERFUL", v5)
	stats.set_int(MPX() .. "H3_CR_STEALTH_1A", v6)
	stats.set_int(MPX() .. "H3_CR_STEALTH_2B_RAPP", v6)
	stats.set_int(MPX() .. "H3_CR_STEALTH_2C_SIDE", v6)
	stats.set_int(MPX() .. "H3_CR_STEALTH_3A", v6)
	stats.set_int(MPX() .. "H3_CR_STEALTH_4A", v6)
	stats.set_int(MPX() .. "H3_CR_STEALTH_5A", v6)
	stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_1A", v6)
	stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_2A", v6)
	stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_2B", v6)
	stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_3A", v6)
	stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_3B", v6)
	stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_4A", v6)
	stats.set_int(MPX() .. "H3_CR_SUBTERFUGE_5A", v6)
	stats.set_int(MPX() .. "H3_CR_DIRECT_1A", v6)
	stats.set_int(MPX() .. "H3_CR_DIRECT_2A1", v6)
	stats.set_int(MPX() .. "H3_CR_DIRECT_2A2", v6)
	stats.set_int(MPX() .. "H3_CR_DIRECT_2BP", v6)
	stats.set_int(MPX() .. "H3_CR_DIRECT_2C", v6)
	stats.set_int(MPX() .. "H3_CR_DIRECT_3A", v6)
	stats.set_int(MPX() .. "H3_CR_DIRECT_4A", v6)
	stats.set_int(MPX() .. "H3_CR_DIRECT_5A", v6)
	stats.set_int(MPX() .. "CR_ORDER", v6)
	stats.set_int(MPX() .. "SIGNAL_JAMMERS_COLLECTED", v7)
	stats.set_int(MPX() .. "AWD_PREPARATION", v8)
	stats.set_int(MPX() .. "AWD_BIGBRO", v8)
	stats.set_int(MPX() .. "AWD_SHARPSHOOTER", v8)
	stats.set_int(MPX() .. "AWD_RACECHAMP", v8)
	stats.set_int(MPX() .. "AWD_ASLEEPONJOB", v9)
	stats.set_int(MPX() .. "CAS_HEIST_NOTS", v10)
	stats.set_int(MPX() .. "CAS_HEIST_FLOW", v10)
	stats.set_int(MPX() .. "H3_BOARD_DIALOGUE0", v10)
	stats.set_int(MPX() .. "H3_BOARD_DIALOGUE1", v10)
	stats.set_int(MPX() .. "H3_BOARD_DIALOGUE2", v10)
	stats.set_int(MPX() .. "H3_VEHICLESUSED", v10)
end

local function unlock_awards_dcasino2(v)
	stats.set_bool(MPX() .. "AWD_SCOPEOUT", v)
	stats.set_bool(MPX() .. "AWD_CREWEDUP", v)
	stats.set_bool(MPX() .. "AWD_MOVINGON", v)
	stats.set_bool(MPX() .. "AWD_PROMOCAMP", v)
	stats.set_bool(MPX() .. "AWD_GUNMAN", v)
	stats.set_bool(MPX() .. "AWD_SMASHNGRAB", v)
	stats.set_bool(MPX() .. "AWD_INPLAINSI", v)
	stats.set_bool(MPX() .. "AWD_UNDETECTED", v)
	stats.set_bool(MPX() .. "AWD_ALLROUND", v)
	stats.set_bool(MPX() .. "AWD_ELITETHEIF", v)
	stats.set_bool(MPX() .. "AWD_PRO", v)
	stats.set_bool(MPX() .. "AWD_SUPPORTACT", v)
	stats.set_bool(MPX() .. "AWD_SHAFTED", v)
	stats.set_bool(MPX() .. "AWD_COLLECTOR", v)
	stats.set_bool(MPX() .. "AWD_DEADEYE", v)
	stats.set_bool(MPX() .. "AWD_PISTOLSATDAWN", v)
	stats.set_bool(MPX() .. "AWD_TRAFFICAVOI", v)
	stats.set_bool(MPX() .. "AWD_CANTCATCHBRA", v)
	stats.set_bool(MPX() .. "AWD_WIZHARD", v)
	stats.set_bool(MPX() .. "AWD_APEESCAPE", v)
	stats.set_bool(MPX() .. "AWD_MONKEYKIND", v)
	stats.set_bool(MPX() .. "AWD_AQUAAPE", v)
	stats.set_bool(MPX() .. "AWD_KEEPFAITH", v)
	stats.set_bool(MPX() .. "AWD_vLOVE", v)
	stats.set_bool(MPX() .. "AWD_NEMESIS", v)
	stats.set_bool(MPX() .. "AWD_FRIENDZONED", v)
	stats.set_bool(MPX() .. "VCM_FLOW_CS_RSC_SEEN", v)
	stats.set_bool(MPX() .. "VCM_FLOW_CS_BWL_SEEN", v)
	stats.set_bool(MPX() .. "VCM_FLOW_CS_MTG_SEEN", v)
	stats.set_bool(MPX() .. "VCM_FLOW_CS_OIL_SEEN", v)
	stats.set_bool(MPX() .. "VCM_FLOW_CS_DEF_SEEN", v)
	stats.set_bool(MPX() .. "VCM_FLOW_CS_FIN_SEEN", v)
	stats.set_bool(MPX() .. "HELP_FURIA", v)
	stats.set_bool(MPX() .. "HELP_MINITAN", v)
	stats.set_bool(MPX() .. "HELP_YOSEMITE2", v)
	stats.set_bool(MPX() .. "HELP_ZHABA", v)
	stats.set_bool(MPX() .. "HELP_IMORGEN", v)
	stats.set_bool(MPX() .. "HELP_SULTAN2", v)
	stats.set_bool(MPX() .. "HELP_VAGRANT", v)
	stats.set_bool(MPX() .. "HELP_VSTR", v)
	stats.set_bool(MPX() .. "HELP_STRYDER", v)
	stats.set_bool(MPX() .. "HELP_SUGOI", v)
	stats.set_bool(MPX() .. "HELP_KANJO", v)
	stats.set_bool(MPX() .. "HELP_FORMULA", v)
	stats.set_bool(MPX() .. "HELP_FORMULA2", v)
	stats.set_bool(MPX() .. "HELP_JB7002", v)
	stats_set_packed_bools(28098, 28353, v)
end

local function unlock_awards_arcade1(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
	for i = 0, 9 do
		stats.set_int(MPX() .. "DG_MONKEY_INITIALS_" .. i, v1)
		stats.set_int(MPX() .. "DG_DEFENDER_INITIALS_" .. i, v1)
		stats.set_int(MPX() .. "DG_PENETRATOR_INITIALS_" .. i, v1)
		stats.set_int(MPX() .. "GGSM_INITIALS_" .. i, v1)
		stats.set_int(MPX() .. "TWR_INITIALS_" .. i, v1)
		stats.set_int(MPX() .. "IAP_INITIALS_" .. i, v8)
		stats.set_int(MPX() .. "IAP_SCORE_" .. i, v8)
		stats.set_int(MPX() .. "IAP_SCORE_" .. i, v8)
		stats.set_int(MPX() .. "SCGW_SCORE_" .. i, v8)
		stats.set_int(MPX() .. "DG_DEFENDER_SCORE_" .. i, v8)
		stats.set_int(MPX() .. "DG_MONKEY_SCORE_" .. i, v8)
		stats.set_int(MPX() .. "DG_PENETRATOR_SCORE_" .. i, v8)
		stats.set_int(MPX() .. "GGSM_SCORE_" .. i, v8)
		stats.set_int(MPX() .. "TWR_SCORE_" .. i, v8)
	end
	stats.set_int(MPX() .. "IAP_MAX_MOON_DIST", v2)
	stats.set_int(MPX() .. "AWD_ASTROCHIMP", v3)
	stats.set_int(MPX() .. "AWD_BATSWORD", v4)
	stats.set_int(MPX() .. "AWD_COINPURSE", v5)
	stats.set_int(MPX() .. "AWD_DAICASHCRAB", v6)
	stats.set_int(MPX() .. "AWD_MASTERFUL", v7)
	stats.set_int(MPX() .. "AWD_PREPARATION", v8)
	stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_0", v8)
	stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_1", v8)
	stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_2", v8)
	stats.set_int(MPX() .. "SCGW_NUM_WINS_GANG_3", v8)
	stats.set_int(MPX() .. "AWD_BIGBRO", v9)
	stats.set_int(MPX() .. "AWD_SHARPSHOOTER", v9)
	stats.set_int(MPX() .. "AWD_RACECHAMP", v9)
	stats.set_int(MPX() .. "AWD_ASLEEPONJOB", v10)
	stats.set_int(MPX() .. "CH_ARC_CAB_CLAW_TROPHY", v11)
	stats.set_int(MPX() .. "CH_ARC_CAB_LOVE_TROPHY", v11)
end

local function unlock_awards_arcade2(v)
	stats.set_bool(MPX() .. "AWD_SCOPEOUT", v)
	stats.set_bool(MPX() .. "AWD_CREWEDUP", v)
	stats.set_bool(MPX() .. "AWD_MOVINGON", v)
	stats.set_bool(MPX() .. "AWD_PROMOCAMP", v)
	stats.set_bool(MPX() .. "AWD_GUNMAN", v)
	stats.set_bool(MPX() .. "AWD_SMASHNGRAB", v)
	stats.set_bool(MPX() .. "AWD_INPLAINSI", v)
	stats.set_bool(MPX() .. "AWD_UNDETECTED", v)
	stats.set_bool(MPX() .. "AWD_ALLROUND", v)
	stats.set_bool(MPX() .. "AWD_ELITETHEIF", v)
	stats.set_bool(MPX() .. "AWD_PRO", v)
	stats.set_bool(MPX() .. "AWD_SUPPORTACT", v)
	stats.set_bool(MPX() .. "AWD_SHAFTED", v)
	stats.set_bool(MPX() .. "AWD_COLLECTOR", v)
	stats.set_bool(MPX() .. "AWD_DEADEYE", v)
	stats.set_bool(MPX() .. "AWD_PISTOLSATDAWN", v)
	stats.set_bool(MPX() .. "AWD_TRAFFICAVOI", v)
	stats.set_bool(MPX() .. "AWD_CANTCATCHBRA", v)
	stats.set_bool(MPX() .. "AWD_WIZHARD", v)
	stats.set_bool(MPX() .. "AWD_APEESCAP", v)
	stats.set_bool(MPX() .. "AWD_MONKEYKIND", v)
	stats.set_bool(MPX() .. "AWD_AQUAAPE", v)
	stats.set_bool(MPX() .. "AWD_KEEPFAITH", v)
	stats.set_bool(MPX() .. "AWD_vLOVE", v)
	stats.set_bool(MPX() .. "AWD_NEMESIS", v)
	stats.set_bool(MPX() .. "AWD_FRIENDZONED", v)
	stats.set_bool(MPX() .. "IAP_CHALLENGE_0", v)
	stats.set_bool(MPX() .. "IAP_CHALLENGE_1", v)
	stats.set_bool(MPX() .. "IAP_CHALLENGE_2", v)
	stats.set_bool(MPX() .. "IAP_CHALLENGE_3", v)
	stats.set_bool(MPX() .. "IAP_CHALLENGE_4", v)
	stats.set_bool(MPX() .. "IAP_GOLD_TANK", v)
	stats.set_bool(MPX() .. "SCGW_WON_NO_DEATHS", v)
	stats_set_packed_bools(26810, 27257, v)
	stats_set_packed_bools(28098, 28353, v)
end

local function unlock_awards_sspecial(v)
	stats.set_bool(MPX() .. "AWD_KINGOFQUB3D", v)
	stats.set_bool(MPX() .. "AWD_QUBISM", v)
	stats.set_bool(MPX() .. "AWD_QUIBITS", v)
	stats.set_bool(MPX() .. "AWD_GODOFQUB3D", v)
	stats.set_bool(MPX() .. "AWD_ELEVENELEVEN", v)
	stats.set_bool(MPX() .. "AWD_GOFOR11TH", v)
	stats_set_packed_bools(30227, 30482, v)
end

local function unlock_awards_cayo_perico1(v1, v2, v3, v4, v5, v6, v7)
	stats.set_int(MPX() .. "AWD_FILL_YOUR_BAGS", v1)
	stats.set_int(MPX() .. "AWD_SUNSET", v2)
	stats.set_int(MPX() .. "AWD_KEINEMUSIK", v2)
	stats.set_int(MPX() .. "AWD_PALMS_TRAX", v2)
	stats.set_int(MPX() .. "AWD_MOODYMANN", v2)
	stats.set_int(MPX() .. "AWD_TREASURE_HUNTER", v3)
	stats.set_int(MPX() .. "AWD_WRECK_DIVING", v3)
	stats.set_int(MPX() .. "AWD_LOSTANDFOUND", v4)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", v5)
	stats.set_int(MPX() .. "AWD_WELL_PREPARED", v6)
	stats.set_int(MPX() .. "H4_H4_DJ_MISSIONS", v7)
	stats.set_int(MPX() .. "H4CNF_APPROACH", v7)
	stats.set_int(MPX() .. "H4_MISSIONS", v7)
end

local function unlock_awards_cayo_perico2(v)
	stats.set_bool(MPX() .. "AWD_INTELGATHER", v)
	stats.set_bool(MPX() .. "AWD_COMPOUNDINFILT", v)
	stats.set_bool(MPX() .. "AWD_LOOT_FINDER", v)
	stats.set_bool(MPX() .. "AWD_MAX_DISRUPT", v)
	stats.set_bool(MPX() .. "AWD_THE_ISLAND_HEIST", v)
	stats.set_bool(MPX() .. "AWD_GOING_ALONE", v)
	stats.set_bool(MPX() .. "AWD_TEAM_WORK", v)
	stats.set_bool(MPX() .. "AWD_MIXING_UP", v)
	stats.set_bool(MPX() .. "AWD_TEAM_WORK", v)
	stats.set_bool(MPX() .. "AWD_MIXING_UP", v)
	stats.set_bool(MPX() .. "AWD_PRO_THIEF", v)
	stats.set_bool(MPX() .. "AWD_CAT_BURGLAR", v)
	stats.set_bool(MPX() .. "AWD_ONE_OF_THEM", v)
	stats.set_bool(MPX() .. "AWD_GOLDEN_GUN", v)
	stats.set_bool(MPX() .. "AWD_ELITE_THIEF", v)
	stats.set_bool(MPX() .. "AWD_PROFESSIONAL", v)
	stats.set_bool(MPX() .. "AWD_HELPING_OUT", v)
	stats.set_bool(MPX() .. "AWD_COURIER", v)
	stats.set_bool(MPX() .. "AWD_PARTY_VIBES", v)
	stats.set_bool(MPX() .. "AWD_HELPING_HAND", v)
	stats.set_bool(MPX() .. "AWD_ELEVENELEVEN", v)
	stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_VETIR", v)
	stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_LONGFIN", v)
	stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_ANNIH", v)
	stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_ALKONOS", v)
	stats.set_bool(MPX() .. "COMPLETE_H4_F_USING_PATROLB", v)
	stats_set_packed_bools(30515, 30706, v)
end

local function unlock_awards_tuners1(v1, v2, v3, v4)
	stats.set_int(MPX() .. "AWD_TEST_CAR", v1)
	stats.set_int(MPX() .. "AWD_CAR_CLUB_MEM", v2)
	stats.set_int(MPX() .. "AWD_CAR_EXPORT", v2)
	stats.set_int(MPX() .. "AWD_ROBBERY_CONTRACT", v2)
	stats.set_int(MPX() .. "AWD_FACES_OF_DEATH", v2)
	stats.set_int(MPX() .. "AWD_SPRINTRACER", v3)
	stats.set_int(MPX() .. "AWD_STREETRACER", v3)
	stats.set_int(MPX() .. "AWD_PURSUITRACER", v3)
	stats.set_int(MPX() .. "AWD_AUTO_SHOP", v3)
	stats.set_int(MPX() .. "AWD_GROUNDWORK", v4)
end

local function unlock_awards_tuners2(v)
	stats.set_bool(MPX() .. "AWD_CAR_CLUB", v)
	stats.set_bool(MPX() .. "AWD_PRO_CAR_EXPORT", v)
	stats.set_bool(MPX() .. "AWD_UNION_DEPOSITORY", v)
	stats.set_bool(MPX() .. "AWD_MILITARY_CONVOY", v)
	stats.set_bool(MPX() .. "AWD_FLEECA_BANK", v)
	stats.set_bool(MPX() .. "AWD_FREIGHT_TRAIN", v)
	stats.set_bool(MPX() .. "AWD_BOLINGBROKE_ASS", v)
	stats.set_bool(MPX() .. "AWD_IAA_RAID", v)
	stats.set_bool(MPX() .. "AWD_METH_JOB", v)
	stats.set_bool(MPX() .. "AWD_BUNKER_RAID", v)
	stats.set_bool(MPX() .. "AWD_STRAIGHT_TO_VIDEO", v)
	stats.set_bool(MPX() .. "AWD_MONKEY_C_MONKEY_DO", v)
	stats.set_bool(MPX() .. "AWD_TRAINED_TO_KILL", v)
	stats.set_bool(MPX() .. "AWD_DIRECTOR", v)
	stats_set_packed_bools(31707, 32282, v)
end

local function unlock_awards_contract1(v1, v2, v3, v4, v5, v6, v7)
	stats.set_int(MPX() .. "FIXER_EARNINGS", v1)
	stats.set_int(MPX() .. "FIXER_COUNT", v2)
	stats.set_int(MPX() .. "FIXER_SC_VEH_RECOVERED", v3)
	stats.set_int(MPX() .. "FIXER_SC_VAL_RECOVERED", v3)
	stats.set_int(MPX() .. "FIXER_SC_GANG_TERMINATED", v3)
	stats.set_int(MPX() .. "FIXER_SC_VIP_RESCUED", v3)
	stats.set_int(MPX() .. "FIXER_SC_ASSETS_PROTECTED", v3)
	stats.set_int(MPX() .. "FIXER_SC_EQ_DESTROYED", v3)
	stats.set_int(MPX() .. "AWD_PRODUCER", v4)
	stats.set_int(MPX() .. "AWD_CONTRACTOR", v5)
	stats.set_int(MPX() .. "AWD_COLD_CALLER", v5)
	stats.set_int(MPX() .. "FIXERTELEPHONEHITSCOMPL", v6)
	stats.set_int(MPX() .. "PAYPHONE_BONUS_KILL_METHOD", v6)
	stats.set_int(MPX() .. "PAYPHONE_BONUS_KILL_METHOD", v7)
	stats.set_int(MPX() .. "FIXER_GENERAL_BS", v7)
	stats.set_int(MPX() .. "FIXER_COMPLETED_BS", v7)
	stats.set_int(MPX() .. "FIXER_STORY_BS", v7)
	stats.set_int(MPX() .. "FIXER_STORY_STRAND", v7)
	stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", v7)
end

local function unlock_awards_contract2(v)
	stats.set_bool(MPX() .. "AWD_TEEING_OFF", v)
	stats.set_bool(MPX() .. "AWD_PARTY_NIGHT", v)
	stats.set_bool(MPX() .. "AWD_BILLIONAIRE_GAMES", v)
	stats.set_bool(MPX() .. "AWD_HOOD_PASS", v)
	stats.set_bool(MPX() .. "AWD_STUDIO_TOUR", v)
	stats.set_bool(MPX() .. "AWD_DONT_MESS_DRE", v)
	stats.set_bool(MPX() .. "AWD_BACKUP", v)
	stats.set_bool(MPX() .. "AWD_SHORTFRANK_1", v)
	stats.set_bool(MPX() .. "AWD_SHORTFRANK_2", v)
	stats.set_bool(MPX() .. "AWD_SHORTFRANK_3", v)
	stats.set_bool(MPX() .. "AWD_CONTR_KILLER", v)
	stats.set_bool(MPX() .. "AWD_DOGS_BEST_FRIEND", v)
	stats.set_bool(MPX() .. "AWD_MUSIC_STUDIO", v)
	stats.set_bool(MPX() .. "AWD_SHORTLAMAR_1", v)
	stats.set_bool(MPX() .. "AWD_SHORTLAMAR_2", v)
	stats.set_bool(MPX() .. "AWD_SHORTLAMAR_3", v)
	stats.set_bool(MPX() .. "BS_FRANKLIN_DIALOGUE_0", v)
	stats.set_bool(MPX() .. "BS_FRANKLIN_DIALOGUE_1", v)
	stats.set_bool(MPX() .. "BS_FRANKLIN_DIALOGUE_2", v)
	stats.set_bool(MPX() .. "BS_IMANI_D_APP_SETUP", v)
	stats.set_bool(MPX() .. "BS_IMANI_D_APP_STRAND", v)
	stats.set_bool(MPX() .. "BS_IMANI_D_APP_PARTY", v)
	stats.set_bool(MPX() .. "BS_IMANI_D_APP_PARTY_2", v)
	stats.set_bool(MPX() .. "BS_IMANI_D_APP_PARTY_F", v)
	stats.set_bool(MPX() .. "BS_IMANI_D_APP_BILL", v)
	stats.set_bool(MPX() .. "BS_IMANI_D_APP_BILL_2", v)
	stats.set_bool(MPX() .. "BS_IMANI_D_APP_BILL_F", v)
	stats.set_bool(MPX() .. "BS_IMANI_D_APP_HOOD", v)
	stats.set_bool(MPX() .. "BS_IMANI_D_APP_HOOD_2", v)
	stats.set_bool(MPX() .. "BS_IMANI_D_APP_HOOD_F", v)
	stats_set_packed_bools(32283, 32474, v)
end

local function unlock_awards_drug_wars1(v1, v2)
	stats.set_int(MPX() .. "AWD_CALLME", v1)
	stats.set_int(MPX() .. "AWD_CHEMCOMPOUNDS", v1)
	stats.set_int(MPX() .. "AWD_RUNRABBITRUN", v2)
end

local function unlock_awards_drug_wars2(v)
	stats.set_bool(MPX() .. "AWD_ACELIQUOR", v)
	stats.set_bool(MPX() .. "AWD_TRUCKAMBUSH", v)
	stats.set_bool(MPX() .. "AWD_LOSTCAMPREV", v)
	stats.set_bool(MPX() .. "AWD_ACIDTRIP", v)
	stats.set_bool(MPX() .. "AWD_HIPPYRIVALS", v)
	stats.set_bool(MPX() .. "AWD_TRAINCRASH", v)
	stats.set_bool(MPX() .. "AWD_BACKUPB", v)
	stats.set_bool(MPX() .. "AWD_GETSTARTED", v)
	stats.set_bool(MPX() .. "AWD_CHEMREACTION", v)
	stats.set_bool(MPX() .. "AAWD_WAREHODEFEND", v)
	stats.set_bool(MPX() .. "AWD_ATTACKINVEST", v)
	stats.set_bool(MPX() .. "AWD_RESCUECOOK", v)
	stats.set_bool(MPX() .. "AWD_DRUGTRIPREHAB", v)
	stats.set_bool(MPX() .. "AWD_CARGOPLANE", v)
	stats.set_bool(MPX() .. "AWD_BACKUPB2", v)
	stats.set_bool(MPX() .. "AWD_TAXISTAR", v)
end

local function unlock_awards_chop_shop1(v1, v2, v3)
	stats.set_int(MPX() .. "AWD_CAR_DEALER", v1)
	stats.set_int(MPX() .. "AWD_SECOND_HAND_PARTS", v1)
	stats.set_int(MPX() .. "AWD_PREP_WORK", v2)
	stats.set_int(MPX() .. "AWD_VEHICLE_ROBBERIES", v3)
	stats.set_int(MPX() .. "AWD_TOW_TRUCK_SERVICE", v3)
end

local function unlock_awards_chop_shop2(v)
	stats.set_bool(MPX() .. "AWD_MAZE_BANK_ROBBERY", v)
	stats.set_bool(MPX() .. "AWD_CARGO_SHIP_ROBBERY", v)
	stats.set_bool(MPX() .. "AWD_DIAMOND_CASINO_ROBBERY", v)
	stats.set_bool(MPX() .. "AWD_MISSION_ROW_ROBBERY", v)
	stats.set_bool(MPX() .. "AWD_SUBMARINE_ROBBERY", v)
	stats.set_bool(MPX() .. "AWD_PERFECT_RUN", v)
	stats.set_bool(MPX() .. "AWD_EXTRA_MILE", v)
	stats.set_bool(MPX() .. "AWD_BOLINGBROKE", v)
	stats.set_bool(MPX() .. "AWD_GETTING_SET_UP", v)
	stats.set_bool(MPX() .. "AWD_CHICKEN_FACTORY_RAID", v)
	stats.set_bool(MPX() .. "AWD_HELPING_HAND2", v)
	stats.set_bool(MPX() .. "AWD_SURPRISE_ATTACK", v)
	stats.set_bool(MPX() .. "AWD_ALL_OUT_RAID", v)
	stats.set_bool(MPX() .. "AWD_WEAPON_ARSENAL", v)
	stats.set_bool(MPX() .. "AWD_HELPING_HAND2", v)
end

--Local "complete" Functions--

local function complete_cayo_perico_preps()
	stats.set_int(MPX() .. "H4CNF_UNIFORM", -1)
	stats.set_int(MPX() .. "H4CNF_GRAPPEL", -1)
	stats.set_int(MPX() .. "H4CNF_TROJAN", 5)
	stats.set_int(MPX() .. "H4CNF_WEP_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_ARM_DISRP", 3)
	stats.set_int(MPX() .. "H4CNF_HEL_DISRP", 3)
	stats.set_int(MPX() .. "H4_PLAYTHROUGH_STATUS", 10)
	sleep(0.5)
	HIP:set_int(CPRSl, 2)
end

local function complete_diamond_casino_preps()
	stats.set_int(MPX() .. "H3OPT_DISRUPTSHIP", 3)
	stats.set_int(MPX() .. "H3OPT_KEYLEVELS", 2)
	stats.set_int(MPX() .. "H3OPT_BITSET0", -1)
	stats.set_int(MPX() .. "H3OPT_BITSET1", -1)
	stats.set_int(MPX() .. "H3OPT_COMPLETEDPOSIX", -1)
end

local function complete_salvage_yard_preps(value)
	stats.set_int(MPX() .. "SALV23_GEN_BS", value)
	stats.set_int(MPX() .. "SALV23_SCOPE_BS", value)
	stats.set_int(MPX() .. "SALV23_FM_PROG", value)
	stats.set_int(MPX() .. "SALV23_INST_PROG", value)
end

--Heist Tool Implementation--

function create_agency_submenu()
	agency:add_array_item("VIP Contract", get_names_from_table(agency_contracts), function()
		return states.i1
	end, function(contract)
		states.i1 		  = contract
		local contract_id = (contract ~= 1) and get_id_from_table(agency_contracts, contract - 1) or nil
		if contract ~= 1 then
			stats.set_int(MPX() .. "FIXER_STORY_BS", contract_id)
		elseif contract == 12 then
			stats.set_int(MPX() .. "FIXER_STORY_BS", contract_id)
			stats.set_int(MPX() .. "FIXER_STORY_STRAND", -1)
		end
	end)

	agency:add_action("Complete Preps", function()
		stats.set_int(MPX() .. "FIXER_GENERAL_BS", -1)
		stats.set_int(MPX() .. "FIXER_COMPLETED_BS", -1)
		stats.set_int(MPX() .. "FIXER_STORY_COOLDOWN", -1)
	end)

	agency:add_action("Max Payout (after start)", function() globals.set_int(APg, 2500000) end)

	agency:add_action("Cooldown Killer", function() globals.set_int(ACKg, 0) end)

	agency:add_action("Skip Cutscene", function() menu.end_cutscene() end)

	agency:add_bare_item("", function()
		if FMC20:is_active() then
			return "Instant Finish [Outdated] | 〔" .. is_instant_finish_available(FMC20SHl) .. "〕"
		else
			return "Instant Finish [Outdated]: Waiting..."
		end
	end, function()
		if FMC20:is_active() then
			FMC20:set_int(AIFl1, 51338752)
			FMC20:set_int(AIFl2, 50)
		end
	end, null, null)

	agency:add_action(SPACE, null)

	agency_n = agency:add_submenu(README)
	agency_n:add_action("                 After all choices and", null)
	agency_n:add_action("            pressing «Complete Preps»", null)
	agency_n:add_action("                  just wait some time", null)
end

function create_auto_shop_submenu()
	auto_shop:add_array_item("Auto Shop Mission", auto_shop_missions, function()
		return states.i2
	end, function(mission)
		states.i2 = mission
		if mission ~= 1 then
			stats.set_int(MPX() .. "TUNER_CURRENT", mission - 2)
		end
	end)

	auto_shop:add_action("Complete Preps", function()
		local current_mission = stats.get_int(MPX() .. "TUNER_CURRENT")
		local tuner_gen_bs = (current_mission == 1) and 4351 or 12543
		stats.set_int(MPX() .. "TUNER_GEN_BS", tuner_gen_bs)
		sleep(0.5)
		THP:set_int(ASRBl, 2)
	end)

	auto_shop:add_action("Reload Planning Board", function() THP:set_int(ASRBl, 2) end)

	auto_shop:add_action("Max Payout (after start)", function()
		globals_set_ints(ASPg1, ASPg2, 1, 2000000)
		globals.set_float(ASFg, 0)
	end)

	auto_shop:add_action("Cooldown Killer", function()
		for i = 0, 7 do
			stats.set_int(MPX() .. "TUNER_CONTRACT" .. i .. "_POSIX", 0)
		end
		globals.set_int(ASCKg, 0)
	end)

	auto_shop:add_bare_item("", function()
		if FMC20:is_active() then
			return "Instant Finish | 〔" .. is_instant_finish_available(FMC20SHl) .. "〕"
		else
			return "Instant Finish: Waiting for Heist..."
		end
	end, function()
		if FMC20:is_active() then
			FMC20:set_int(ASIFl1, 51338977)
			FMC20:set_int(ASIFl2, 101)
		end
	end, null, null)

	auto_shop:add_action(SPACE, null)

	auto_shop_n = auto_shop:add_submenu(README)
	auto_shop_n:add_action("               Reload Planning Board:", null)
	auto_shop_n:add_action("  Use this after you made changes in setup", null)
end

function create_apartment_submenu()
	apartment:add_action("Change Session", function() change_session(0) end)

	apartment:add_action("Complete Preps (any heist)", function() stats.set_int(MPX() .. "HEIST_PLANNING_STAGE", -1) end)

	apartment_cuts = apartment:add_submenu("Cuts")

	apartment_team = 2
	apartment_cuts:add_array_item("Team", {"Duo", "Squad"}, function()
		return states.i68
	end, function(team)
		states.i68 = team
		if team == 1 then
			apartment_team = 2
			apartment_player1 = "On"
			apartment_player2 = "On"
			apartment_player3 = "Off"
			apartment_player4 = "Off"
		elseif team == 2 then
			apartment_team = 4
			apartment_player1 = "On"
			apartment_player2 = "On"
			apartment_player3 = "On"
			apartment_player4 = "On"
		end
	end)

	apartment_cut = 0
	apartment_cuts:add_array_item("Presets", get_names_from_table(cut_presets_apartment), function()
		return states.i4
	end, function(preset)
		states.i4 = preset
		if preset ~= 1 then
			apartment_cut = get_id_from_table(cut_presets_apartment, preset - 1)
		else
			apartment_cut = 0
		end
	end)

	apartment_player1 = "On"
	apartment_cuts:add_bare_item("", function()
		return "Player 1 |〔" .. apartment_player1 .. "〕"
	end, function()
		if apartment_player1 == "On" then
			apartment_player1 = "Off"
		else
			apartment_player1 = "On"
		end
	end, null, null)

	apartment_player2 = "On"
	apartment_cuts:add_bare_item("", function() 
		return "Player 2 |〔" .. apartment_player2 .. "〕"
	end, function()
		if apartment_player2 == "On" then
			apartment_player2 = "Off"
		else
			apartment_player2 = "On"
		end
	end, null, null)

	apartment_player3 = "Off"
	apartment_cuts:add_bare_item("", function() 
		return "Player 3 |〔" .. apartment_player3 .. "〕"
	end, function()
		if apartment_player3 == "On" then
			apartment_player3 = "Off"
		else
			apartment_player3 = "On"
		end
	end, null, null)

	apartment_player4 = "Off"
	apartment_cuts:add_bare_item("", function() 
		return "Player 4 |〔" .. apartment_player4 .. "〕"
	end, function()
		if apartment_player4 == "On" then
			apartment_player4 = "Off"
		else
			apartment_player4 = "On"
		end
	end, null, null)

	apartment_cuts:add_action("Apply Cuts", function()
		globals.set_int(ACg1, 100 - (apartment_cut * apartment_team))
		globals.set_int(ACg2, (apartment_player2 == "On") and apartment_cut or 0)
		globals.set_int(ACg3, (apartment_player3 == "On") and apartment_cut or 0)
		globals.set_int(ACg4, (apartment_player4 == "On") and apartment_cut or 0)
		sleep(1)
		globals.set_int(ACFg1, 1)
		globals.set_int(ACFg2, 4)
		globals.set_int(ACFg2, 3)
		sleep(1)
		globals.set_int(ACg5, (apartment_player1 == "On") and apartment_cut or 0)
	end)

	apartment_cuts:add_action(SPACE, null)

	apartment_cuts_n = apartment_cuts:add_submenu(README)
	apartment_cuts_n:add_action("                        Apply Cuts:", null)
	apartment_cuts_n:add_action(" You'll see only your own cut changed; Ask", null)
	apartment_cuts_n:add_action("  teammates if they see their updated cuts", null)

	apartment_extra = apartment:add_submenu("Extra")

	apartment_extra:add_action("Skip Cutscene", function() menu.end_cutscene() end)

	apartment_extra:add_action("Bypass Fleeca Hack", function() FMC:set_int(AFHl, 7) end)

	apartment_extra:add_action("Bypass Fleeca Drill", function() FMC:set_float(AFDl, 100) end)

	apartment_extra:add_action("Unlock All Jobs", function()
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_0", globals.get_int(AUAJg1))
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_0_L", 5)
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_1", globals.get_int(AUAJg2))
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_1_L", 5)
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_2", globals.get_int(AUAJg3))
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_2_L", 5)
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_3", globals.get_int(AUAJg4))
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_3_L", 5)
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_4", globals.get_int(AUAJg5))
		stats.set_int(MPX() .. "HEIST_SAVED_STRAND_4_L", 5)
	end)

	apartment_extra:add_action(SPACE, null)

	apartment_extra_n = apartment_extra:add_submenu(README)
	apartment_extra_n:add_action("                     Unlock All Jobs:", null)
	apartment_extra_n:add_action("  Activate the option and restart the game", null)

	apartment:add_bare_item("", function()
		if FMC:is_active() then
			return "Instant Finish | 〔" .. is_instant_finish_available(FMCSHl) .. "〕"
		else
			return "Instant Finish: Waiting for Heist..."
		end
	end, function()
		if FMC:is_active() then
			FMC:set_int(AIFl3, 12)
			FMC:set_int(AIFl4, 99999)
			FMC:set_int(AIFl5, 99999)
		end
	end, null, null)

	apartment:add_action(SPACE, null)

	apartment_n = apartment:add_submenu(README)
	apartment_n:add_action("           Complete Preps (for fleeca):", null)
	apartment_n:add_action("    Pay for the preparation, start the first", null)
	apartment_n:add_action("   mission and as soon as you are sent to", null)
	apartment_n:add_action("  scout, change the session, come back to", null)
	apartment_n:add_action("  planning room, press «Complete Preps»", null)
	apartment_n:add_action(" near white board and press «E» and leave", null)
	apartment_n:add_action(SPACE, null)
	apartment_n:add_action("       Complete Preps (for other heists):", null)
	apartment_n:add_action("  Start the mission and leave after the 1st", null)
	apartment_n:add_action("   cutscene ends, press «Complete Preps»", null)
	apartment_n:add_action("         near white board and press «E»", null)
end

function create_cayo_perico_submenu()
	cayo_perico_data_saver = cayo_perico:add_submenu("Data Saver")

	cayo_perico_data_saver:add_bare_item("", function()
		local current_target 	 = stats.get_int(MPX() .. "H4CNF_TARGET")
		local cayo_perico_target = (cayo_perico_difficulty ~= "None or Legit") and cayo_perico_targets[current_target + 2] or "None"
		return "Primary Target: " .. cayo_perico_target
	end, null, null, null)

	cayo_perico_data_saver:add_bare_item("", function()
		local targets = {
			{id = "H4LOOT_CASH_C", name = "Cash"},
			{id = "H4LOOT_WEED_C", name = "Weed"},
			{id = "H4LOOT_COKE_C", name = "Coke"},
			{id = "H4LOOT_GOLD_C", name = "Gold"},
			{id =  "H4LOOT_PAINT", name = "Arts"}
		}
		return get_cayo_perico_targets("Compound", targets)
	end, null, null, null)

	cayo_perico_data_saver:add_bare_item("", function()
		local targets = {
			{id = "H4LOOT_CASH_I", name = "Cash"},
			{id = "H4LOOT_WEED_I", name = "Weed"},
			{id = "H4LOOT_COKE_I", name = "Coke"},
			{id = "H4LOOT_GOLD_I", name = "Gold"}
		}
		return get_cayo_perico_targets("Island", targets)
	end, null, null, null)

	cayo_perico_data_saver:add_bare_item("", function()
		return get_name_from_table_by_stat("Difficulty", cayo_perico_approaches, "H4_PROGRESS", "None or Legit")
	end, null, null, null)

	cayo_perico_data_saver:add_bare_item("", function()
		return get_name_from_table_by_stat("Approach", cayo_perico_approaches, "H4_MISSIONS", "None or Legit")
	end, null, null, null)

	cayo_perico_data_saver:add_bare_item("", function()
		local current_weapons     = stats.get_int(MPX() .. "H4CNF_WEAPONS")
		local cayo_perico_weapons = (current_weapons ~= 0) and cayo_perico_loadout[current_weapons + 1] or "None"
		return "Weapons: " .. cayo_perico_weapons
	end, null, null, null)

	cayo_perico_preset = false
	cayo_perico_data_saver:add_bare_item("Save Heist Preset", function()
		local status = (cayo_perico_preset) and "Saved" or "Unsaved"
		return "Save Heist Preset | 〔" .. status .. "〕"
	end, function()
		cayo_perico_preset = not cayo_perico_preset
		sleep(0.5)
		if cayo_perico_preset then
			cayo_perico_target_preset 	  = stats.get_int(MPX() .. "H4CNF_TARGET")
			cayo_perico_c_cash_preset 	  = stats.get_int(MPX() .. "H4LOOT_CASH_C")
			cayo_perico_c_weed_preset 	  = stats.get_int(MPX() .. "H4LOOT_WEED_C")
			cayo_perico_c_coke_preset 	  = stats.get_int(MPX() .. "H4LOOT_COKE_C")
			cayo_perico_c_gold_preset 	  = stats.get_int(MPX() .. "H4LOOT_GOLD_C")
			cayo_perico_c_arts_preset 	  = stats.get_int(MPX() .. "H4LOOT_PAINT")
			cayo_perico_i_cash_preset 	  = stats.get_int(MPX() .. "H4LOOT_CASH_I")
			cayo_perico_i_weed_preset 	  = stats.get_int(MPX() .. "H4LOOT_WEED_I")
			cayo_perico_i_coke_preset 	  = stats.get_int(MPX() .. "H4LOOT_COKE_I")
			cayo_perico_i_gold_preset 	  = stats.get_int(MPX() .. "H4LOOT_GOLD_I")
			cayo_perico_difficulty_preset = stats.get_int(MPX() .. "H4LOOT_CASH_C")
			cayo_perico_approach_preset	  = stats.get_int(MPX() .. "H4LOOT_CASH_C")
			cayo_perico_weapons_preset    = stats.get_int(MPX() .. "H4LOOT_CASH_C")
		end
	end, null, null)

	cayo_perico_data_saver:add_action("Apply Saved Preset", function()
		if cayo_perico_preset then
			stats.set_int(MPX() .. "H4CNF_TARGET", cayo_perico_target_preset)
			stats.set_int(MPX() .. "H4LOOT_CASH_C", cayo_perico_c_cash_preset)
			stats.set_int(MPX() .. "H4LOOT_CASH_C_SCOPED", cayo_perico_c_cash_preset)
			stats.set_int(MPX() .. "H4LOOT_WEED_C", cayo_perico_c_weed_preset)
			stats.set_int(MPX() .. "H4LOOT_WEED_C_SCOPED", cayo_perico_c_weed_preset)
			stats.set_int(MPX() .. "H4LOOT_COKE_C", cayo_perico_c_coke_preset)
			stats.set_int(MPX() .. "H4LOOT_COKE_C_SCOPED", cayo_perico_c_coke_preset)
			stats.set_int(MPX() .. "H4LOOT_GOLD_C", cayo_perico_c_gold_preset)
			stats.set_int(MPX() .. "H4LOOT_GOLD_C_SCOPED", cayo_perico_c_gold_preset)
			stats.set_int(MPX() .. "H4LOOT_PAINT", cayo_perico_c_arts_preset)
			stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", cayo_perico_c_arts_preset)
			stats.set_int(MPX() .. "H4LOOT_CASH_I", cayo_perico_i_cash_preset)
			stats.set_int(MPX() .. "H4LOOT_CASH_I_SCOPED", cayo_perico_i_cash_preset)
			stats.set_int(MPX() .. "H4LOOT_WEED_I", cayo_perico_i_weed_preset)
			stats.set_int(MPX() .. "H4LOOT_WEED_I_SCOPED", cayo_perico_i_weed_preset)
			stats.set_int(MPX() .. "H4LOOT_COKE_I", cayo_perico_i_coke_preset)
			stats.set_int(MPX() .. "H4LOOT_COKE_I_SCOPED", cayo_perico_i_coke_preset)
			stats.set_int(MPX() .. "H4LOOT_GOLD_I", cayo_perico_i_gold_preset)
			stats.set_int(MPX() .. "H4LOOT_GOLD_I_SCOPED", cayo_perico_i_gold_preset)
			stats.set_int(MPX() .. "H4_PROGRESS", cayo_perico_difficulty_preset)
			stats.set_int(MPX() .. "H4_MISSIONS", cayo_perico_approach_preset)
			stats.set_int(MPX() .. "H4CNF_WEAPONS", cayo_perico_weapons_preset)
			stats.set_int(MPX() .. "H4LOOT_CASH_V", 90000)
			stats.set_int(MPX() .. "H4LOOT_WEED_V", 147870)
			stats.set_int(MPX() .. "H4LOOT_COKE_V", 200095)
			stats.set_int(MPX() .. "H4LOOT_GOLD_V", 330350)
			stats.set_int(MPX() .. "H4LOOT_PAINT_V", 189500)
			complete_cayo_perico_preps()
		end
	end)

	cayo_perico_data_saver:add_action(SPACE, null)

	cayo_perico_data_saver_n = cayo_perico_data_saver:add_submenu(README)
	cayo_perico_data_saver_n:add_action("                    Save Heist Preset:", null)
	cayo_perico_data_saver_n:add_action("    Use to save your heist planning screen", null)
	cayo_perico_data_saver_n:add_action(SPACE, null)
	cayo_perico_data_saver_n:add_action("                  Apply Saved Preset:", null)
	cayo_perico_data_saver_n:add_action("   Use to make your heist planning screen", null)
	cayo_perico_data_saver_n:add_action("   the same as it was before saving preset", null)

	cayo_perico_preps = cayo_perico:add_submenu("Preps")

	cayo_perico_preps:add_array_item("Primary Target", cayo_perico_targets, function()
		return states.i5
	end, function(target)
		states.i5 = target
		if target ~= 1 then
			stats.set_int(MPX() .. "H4CNF_TARGET", target - 2)
		end
	end)

	cayo_perico_s_targets = cayo_perico_preps:add_submenu("Secondary Targets")

	cayo_perico_s_targets:add_array_item("Fill Compound Storages", cayo_perico_targets_none, function()
		return states.i6
	end, function(target)
		states.i6 			= target
		states.i8 			= 1
		local target_values = {
			[1] = {  0,   0,   0,   0, "C",      0,      0},
			[2] = {255,   0,   0,   0, "C", "CASH",  90000},
			[3] = {  0, 255,   0,   0, "C", "WEED", 147870},
			[4] = {  0,   0, 255,   0, "C", "COKE", 200095},
			[5] = {  0,   0,   0, 255, "C", "GOLD", 330350}
		}
		local values = target_values[target]
		if values then
			set_cayo_perico_targets(table.unpack(values))
		end
	end)

	cayo_perico_s_targets:add_array_item("Fill Island Storages", cayo_perico_targets_none, function()
		return states.i7
	end, function(target)
		states.i6 			= target
		states.i8 			= 1
		local target_values = {
			[1] = {       0,        0,        0,        0, "I",      0,      0},
			[2] = {16777215,        0,        0,        0, "I", "CASH",  90000},
			[3] = {       0, 16777215,        0,        0, "I", "WEED", 147870},
			[4] = {       0,        0, 16777215,        0, "I", "COKE", 200095},
			[5] = {       0,        0,        0, 16777215, "I", "GOLD", 330350}
		}
		local values 		= target_values[target]
		if values then
			set_cayo_perico_targets(table.unpack(values))
		end
	end)

	cayo_perico_s_targets:add_toggle("Add Paintings", function() return states.b2 end, function() states.b2 = not states.b2 toggle_cayo_perico_paintings(states.b2) end)

	cayo_perico_det_method = cayo_perico_s_targets:add_submenu("Detailed Method")

	cayo_perico_det_method:add_array_item("Compound Target (only one)", cayo_perico_targets_select, function()
		return states.i8
	end, function(target)
		states.i8 			= target
		states.i6 			= 1
		local target_values = {
			[2] = {"CASH", "H4LOOT_CASH_V",  90000},
			[3] = {"WEED", "H4LOOT_WEED_V", 147870},
			[4] = {"COKE", "H4LOOT_COKE_V", 200095},
			[5] = {"GOLD", "H4LOOT_GOLD_V", 330350}
		}
		if target == 1 then
			states.i9 = 1
		else
			local values = target_values[target]
			if values then
				compound_target = values[1]
				stats.set_int(MPX() .. values[2], values[3])
			end
		end
		set_cayo_perico_targets(0, 0, 0, 0, "C", 0, 0)
	end)

	cayo_perico_det_method:add_array_item("Compound Target Amount", list_0_8, function()
		return states.i9
	end, function(amount)
		if compound_target ~= nil then
			states.i9 			  = amount
			local compound_amount = cayo_perico_targets_amount1[amount]
			stats.set_int(MPX() .. "H4LOOT_" .. compound_target .. "_C", compound_amount)
			stats.set_int(MPX() .. "H4LOOT_" .. compound_target .. "_C_SCOPED", compound_amount)
		end
	end)

	cayo_perico_det_method:add_array_item("Compound Arts Amount", list_0_7, function()
		return states.i10
	end, function(amount)
		states.i10  = amount
		arts_amount = cayo_perico_targets_amount2[amount]
		stats.set_int(MPX() .. "H4LOOT_PAINT", arts_amount)
		stats.set_int(MPX() .. "H4LOOT_PAINT_SCOPED", arts_amount)
		stats.set_int(MPX() .. "H4LOOT_PAINT_V", 189500)
	end)

	cayo_perico_det_method:add_array_item("Island Target (only one)", cayo_perico_targets_select, function()
		return states.i11
	end, function(target)
		states.i11 			= target
		states.i7  			= 1
		local target_values = {
			[2] = {"CASH", "H4LOOT_CASH_V",  90000},
			[3] = {"WEED", "H4LOOT_WEED_V", 147870},
			[4] = {"COKE", "H4LOOT_COKE_V", 200095},
			[5] = {"GOLD", "H4LOOT_GOLD_V", 330350}
		}
		if target == 1 then
			states.i12 = 1
		else
			local values = target_values[target]
			if values then
				compound_target = values[1]
				stats.set_int(MPX() .. values[2], values[3])
			end
		end
		set_cayo_perico_targets(0, 0, 0, 0, "I", 0, 0)
	end)

	cayo_perico_det_method:add_array_item("Island Target Amount", list_0_24, function()
		return states.i12
	end, function(amount)
		if island_target ~= nil then
			states.i12    = amount
			island_amount = cayo_perico_targets_amount3[amount]
			stats.set_int(MPX() .. "H4LOOT_" .. island_target .. "_I", island_amount)
			stats.set_int(MPX() .. "H4LOOT_" .. island_target .. "_I_SCOPED", island_amount)
		end
	end)

	cayo_perico_preps:add_array_item("Difficulty", get_names_from_table(cayo_perico_difficulties), function()
		return states.i13
	end, function(difficulty)
		states.i13 = difficulty
		if difficulty ~= 1 then
			stats.set_int(MPX() .. "H4_PROGRESS", get_id_from_table(cayo_perico_difficulties, difficulty - 1))
		end
	end)

	cayo_perico_preps:add_array_item("Approach", get_names_from_table(cayo_perico_approaches), function()
		return states.i14
	end, function(approach)
		states.i14 = approach
		if approach ~= 1 then
			stats.set_int(MPX() .. "H4_MISSIONS", get_id_from_table(cayo_perico_approaches, approach - 1))
		end
	end)

	cayo_perico_preps:add_array_item("Weapons", cayo_perico_loadout, function()
		return states.i15
	end, function(weapons)
		states.i15 = weapons
		if weapons ~= 1 then
			stats.set_int(MPX() .. "H4CNF_WEAPONS", weapons - 1)
		end
	end)

	cayo_perico_preps:add_action("Complete Preps", function() complete_cayo_perico_preps() end)

	cayo_perico_preps:add_action("Reload Planning Screen", function() HIP:set_int(CPRSl, 2) end)

	cayo_perico_preps:add_action("Unselect All", function() reset_states_range("i", 10, 21, 1) states.b3 = false end)

	cayo_perico_preps:add_action(SPACE, null)

	cayo_perico_preps_n = cayo_perico_preps:add_submenu(README)
	cayo_perico_preps_n:add_action("                 After all choices and", null)
	cayo_perico_preps_n:add_action("            pressing «Complete Preps»", null)
	cayo_perico_preps_n:add_action("                  just wait some time", null)
	cayo_perico_preps_n:add_action(SPACE, null)
	cayo_perico_preps_n:add_action("               Reload Planning Screen:", null)
	cayo_perico_preps_n:add_action("  Use this after you made changes in setup", null)

	cayo_perico_cuts = cayo_perico:add_submenu("Cuts")

	cayo_perico_cuts:add_array_item("Presets", get_names_from_table(cut_presets), function()
		return states.i16
	end, function(preset)
		states.i16 = preset
		if preset ~= 1 then
			globals.set_int(GCg, get_id_from_table(cut_presets, preset - 1))
			globals_set_ints(CPCg1, CPCg4, 1, get_id_from_table(cut_presets, preset - 1))
		end
	end)

	cayo_perico_cuts:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(CPCg1) end, function(cut) globals.set_int(CPCg1, cut) end)
	cayo_perico_cuts:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(CPCg2) end, function(cut) globals.set_int(CPCg2, cut) end)
	cayo_perico_cuts:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(CPCg3) end, function(cut) globals.set_int(CPCg3, cut) end)
	cayo_perico_cuts:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(CPCg4) end, function(cut) globals.set_int(CPCg4, cut) end)
	cayo_perico_cuts:add_int_range("Self (non-host)", 1, 0, 999, function() return globals.get_int(GCg) end, function(cut) globals.set_int(GCg, cut) end)

	cayo_perico_extra = cayo_perico:add_submenu("Extra")

	cayo_perico_extra:add_action("Skip Cutscene", function() menu.end_cutscene() end)

	cayo_perico_cd_killer  = cayo_perico_extra:add_submenu("Cooldown Killer")

	cayo_perico_cd_killer:add_action("Kill Cooldown (after solo)", function()
		stats.set_int(MPX() .. "H4_TARGET_POSIX", 1659643454)
		stats.set_int(MPX() .. "H4_COOLDOWN", 0)
		stats.set_int(MPX() .. "H4_COOLDOWN_HARD", 0)
	end)

	cayo_perico_cd_killer:add_action("Kill Cooldown (after with friends)", function()
		stats.set_int(MPX() .. "H4_TARGET_POSIX", 1659429119)
		stats.set_int(MPX() .. "H4_COOLDOWN", 0)
		stats.set_int(MPX() .. "H4_COOLDOWN_HARD", 0)
	end)

	cayo_perico_cd_killer:add_array_item("Session", cayo_perico_sessions, function()
		return states.i17
	end, function(session)
		states.i17 = session
		change_session((session == 1) and -1 or 8)
	end)

	cayo_perico_cd_killer:add_action(SPACE, null)

	cayo_perico_cooldown_killer_n = cayo_perico_cd_killer:add_submenu(README)
	cayo_perico_cooldown_killer_n:add_action("         Choose a cooldown, go offline", null)
	cayo_perico_cooldown_killer_n:add_action("                and come back online", null)

	cayo_perico_extra:add_toggle("Hecker", function() return states.b3 end, function() states.b3 = not states.b3 toggle_cayo_perico_hecker(states.b3) end)

	cayo_perico_extra:add_toggle("Woman's Bag", function() return states.b4 end, function() states.b4 = not states.b4 toggle_cayo_perico_womans_bag(states.b4) end)

	cayo_perico_extra:add_action("Bypass Fingerprint Hack", function()
		if FMC20:get_int(CPFHl) == 4 then
			FMC20:set_int(CPFHl, 5)
		end
	end)

	cayo_perico_extra:add_action("Bypass Plasma Cutter Cut", function() FMC20:set_float(CPPCCl, 100) end)

	cayo_perico_extra:add_action("Bypass Drainage Pipe Cut", function()
		local CPSTCl_value = FMC20:get_int(CPSTCl)
		if CPSTCl_value >= 3 or CPSTCl_value <= 6 then
			FMC20:set_int(CPSTCl, 6)
		end
	end)

	cayo_perico_extra:add_action("Unlock All POI", function()
		stats.set_int(MPX() .. "H4CNF_BS_GEN", -1)
		stats.set_int(MPX() .. "H4CNF_BS_ENTR", 63)
		stats.set_int(MPX() .. "H4CNF_BS_ABIL", 63)
		stats.set_int(MPX() .. "H4CNF_APPROACH", -1)
		sleep(0.5)
		HIP:set_int(CPRSl, 2)
	end)

	cayo_perico_extra:add_action(SPACE, null)

	cayo_perico_extra_n = cayo_perico_extra:add_submenu(README)
	cayo_perico_extra_n:add_action("                           Hecker:", null)
	cayo_perico_extra_n:add_action(" Pressing «H» will trigger bypass any hack", null)
	cayo_perico_extra_n:add_action(SPACE, null)
	cayo_perico_extra_n:add_action("                      Woman's Bag:", null)
	cayo_perico_extra_n:add_action("       Changes your bag size to infinity", null)
	cayo_perico_extra_n:add_action(SPACE, null)
	cayo_perico_extra_n:add_action("                For the first robbery:", null)
	cayo_perico_extra_n:add_action("           Use «Unlock All POI» option", null)

	cayo_perico_tps = cayo_perico:add_submenu("Teleports")

	cayo_perico_tps_c = cayo_perico_tps:add_submenu("Compound")

	cayo_perico_tps_c:add_action("Office", function() teleport(5005.557617, -5754.321289, 27.545269, 0, 0, 0) end)

	cayo_perico_tps_c:add_action("Primary Target", function() teleport(5007.763184, -5756.029785, 14.184443, 0, 0, 0) end)

	cayo_perico_tps_c:add_array_item("Storage", get_names_from_table(cayo_perico_storages), function()
		return states.i19
	end, function(storage)
		states.i19 = storage
		if storage ~= 1 then
			teleport_heist(storage, cayo_perico_storages)
		end
	end)

	cayo_perico_tps_c:add_action("Main Exit", function() teleport(4990.194824, -5716.448730, 18.580215, 0, 0, 0) end)

	cayo_perico_tps_c:add_action("Water Escape", function() teleport(4639.124023, -6010.004883, -7.475036, 0, 0, 0) end)

	cayo_perico_tps_i = cayo_perico_tps:add_submenu("Island")

	cayo_perico_tps_i:add_array_item("Airport", get_names_from_table(cayo_perico_airport), function()
		return states.i20
	end, function(loot)
		states.i20 = loot
		if loot ~= 1 then
			teleport_heist(loot, cayo_perico_airport)
		end
	end)

	cayo_perico_tps_i:add_array_item("Main Dock", get_names_from_table(cayo_perico_m_dock), function()
		return states.i21
	end, function(loot)
		states.i21 = loot
		if loot ~= 1 then
			teleport_heist(loot, cayo_perico_m_dock)
		end
	end)

	cayo_perico_tps_i:add_array_item("North Dock", get_names_from_table(cayo_perico_n_dock), function()
		return states.i22
	end, function(loot)
		states.i22 = loot
		if loot ~= 1 then
			teleport_heist(loot, cayo_perico_n_dock)
		end
	end)

	cayo_perico_tps_i:add_action("Cord Field Loot", function() teleport(5330.717285, -5270.096191, 31.886055, 0, 0, 0) end)

	cayo_perico_scope_out = cayo_perico_tps:add_submenu("Scope Out")

	cayo_perico_scope_out:add_action("Power Station", function() teleport(4478.291992, -4580.129883, 4.258523, 0, 0, 0) end)

	cayo_perico_scope_out:add_array_item("Towers", get_names_from_table(cayo_perico_towers), function()
		return states.i23
	end, function(tower)
		states.i23 = tower
		if tower ~= 1 then
			teleport_heist(tower, cayo_perico_towers)
		end
	end)

	cayo_perico_scope_out:add_array_item("Bolt Cutters", get_names_from_table(cayo_perico_bolts), function()
		return states.i24
	end, function(bolt)
		states.i24 = bolt
		if bolt ~= 1 then
			teleport_heist(bolt, cayo_perico_bolts)
		end
	end)

	cayo_perico_scope_out:add_array_item("Cutting Powders", get_names_from_table(cayo_perico_powders), function()
		return states.i25
	end, function(powder)
		states.i25 = powder
		if powder ~= 1 then
			teleport_heist(powder, cayo_perico_powders)
		end
	end)

	cayo_perico_scope_out:add_array_item("Grappling Hooks", get_names_from_table(cayo_perico_hooks), function()
		return states.i26
	end, function(hook)
		states.i26 = hook
		if hook ~= 1 then
			teleport_heist(hook, cayo_perico_hooks)
		end
	end)

	cayo_perico_scope_out:add_array_item("Guard Clothes", get_names_from_table(cayo_perico_clothes), function()
		return states.i27
	end, function(clothes)
		states.i27 = clothes
		if clothes ~= 1 then
			teleport_heist(clothes, cayo_perico_clothes)
		end
	end)

	cayo_perico_scope_out:add_array_item("Signal Boxes", get_names_from_table(cayo_perico_boxes), function()
		return states.i28
	end, function(box)
		states.i28 = box
		if box ~= 1 then
			teleport_heist(box, cayo_perico_boxes)
		end
	end)

	cayo_perico_scope_out:add_array_item("Supply Trucks", get_names_from_table(cayo_perico_trucks), function()
		return states.i29
	end, function(truck)
		states.i29 = truck
		if truck ~= 1 then
			teleport_heist(truck, cayo_perico_trucks)
		end
	end)

	cayo_perico:add_bare_item("", function()
		if FMC20:is_active() then
			return "Instant Finish | 〔" .. is_instant_finish_available(FMC20SHl) .. "〕"
		else
			return "Instant Finish: Waiting for Heist..."
		end
	end, function()
		if FMC20:is_active() then
			FMC20:set_int(CPIFl1, 9)
			FMC20:set_int(CPIFl2, 50)
		end
	end, null, null)
end

function create_diamond_casino_submenu()
	diamond_casino_data_saver = diamond_casino:add_submenu("Data Saver")

	diamond_casino_data_saver:add_bare_item("", function()
		local current_target = stats.get_int(MPX() .. "H3OPT_TARGET")
		local target_names 	 = get_names_from_table(diamond_casino_targets)
		local diamond_casino_target = (diamond_casino_approach ~= "None") and target_names[current_target + 2] or "None"
		return "Target: " .. diamond_casino_target
	end, null, null, null)

	diamond_casino_data_saver:add_bare_item("", function()
		local current_approach 		= stats.get_int(MPX() .. "H3OPT_APPROACH")
		local current_hard_approach = stats.get_int(MPX() .. "H3_HARD_APPROACH")
		diamond_casino_approach     = "None"
		for i = 1, 3 do
			if current_approach == i then
				diamond_casino_approach = (current_approach == current_hard_approach) and diamond_casino_approaches[i + 1] or diamond_casino_approaches[i + 4]
				break
			end
		end
		return "Approach: " .. diamond_casino_approach
	end, null, null, null)

	diamond_casino_data_saver:add_bare_item("", function()
		return get_name_from_table_by_stat("Gunman", diamond_casino_gunmans, "H3OPT_CREWWEAP", "None")
	end, null, null, null)

	diamond_casino_data_saver:add_bare_item("", function()
		return get_name_from_table_by_stat("Driver", diamond_casino_drivers, "H3OPT_CREWDRIVER", "None")
	end, null, null, null)

	diamond_casino_data_saver:add_bare_item("", function()
		return get_name_from_table_by_stat("Hacker", diamond_casino_hackers, "H3OPT_CREWHACKER", "None")
	end, null, null, null)


	diamond_casino_data_saver:add_bare_item("", function()
		current_masks 	    = stats.get_int(MPX() .. "H3OPT_MASKS")
		diamond_casino_mask = (current_masks ~= 0) and diamond_casino_masks[current_masks + 1] or "None"
		return "Masks: " .. diamond_casino_mask
	end, null, null, null)

	diamond_casino_preset = false
	diamond_casino_data_saver:add_bare_item("", function()
		local status = (diamond_casino_preset) and "Saved" or "Unsaved"
		return "Save Heist Preset | 〔" .. status .. "〕"
	end, function()
		diamond_casino_preset = not diamond_casino_preset
		sleep(0.5)
		if diamond_casino_preset then
			diamond_casino_target_preset 		= stats.get_int(MPX() .. "H3OPT_TARGET")
			diamond_casino_approach_preset		= stats.get_int(MPX() .. "H3OPT_APPROACH")
			diamond_casino_hard_approach_preset = stats.get_int(MPX() .. "H3_HARD_APPROACH")
			diamond_casino_last_approach_preset = stats.get_int(MPX() .. "H3_LAST_APPROACH")
			diamond_casino_gunman_preset	    = stats.get_int(MPX() .. "H3OPT_CREWWEAP")
			diamond_casino_weapons_preset 		= stats.get_int(MPX() .. "H3OPT_WEAPS")
			diamond_casino_driver_preset 		= stats.get_int(MPX() .. "H3OPT_CREWDRIVER")
			diamond_casino_vehicles_preset		= stats.get_int(MPX() .. "H3OPT_VEHS")
			diamond_casino_hacker_preset 		= stats.get_int(MPX() .. "H3OPT_CREWHACKER")
			diamond_casino_masks_preset 		= stats.get_int(MPX() .. "H3OPT_MASKS")
		end
	end, null, null)

	diamond_casino_data_saver:add_action("Apply Saved Preset", function()
		if diamond_casino_preset then
			stats.set_int(MPX() .. "H3OPT_TARGET", diamond_casino_target_preset)
			stats.set_int(MPX() .. "H3OPT_APPROACH", diamond_casino_approach_preset)
			stats.set_int(MPX() .. "H3_HARD_APPROACH", diamond_casino_hard_approach_preset)
			stats.set_int(MPX() .. "H3_LAST_APPROACH", diamond_casino_last_approach_preset)
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", diamond_casino_gunman_preset)
			stats.set_int(MPX() .. "H3OPT_WEAPS", diamond_casino_weapons_preset)
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", diamond_casino_driver_preset)
			stats.set_int(MPX() .. "H3OPT_VEHS", diamond_casino_vehicles_preset)
			stats.set_int(MPX() .. "H3OPT_CREWHACKER", diamond_casino_hacker_preset)
			stats.set_int(MPX() .. "H3OPT_MASKS", diamond_casino_masks_preset)
			complete_diamond_casino_preps()
		end
	end)

	diamond_casino_data_saver:add_action(SPACE, null)

	diamond_casino_data_saver_n = diamond_casino_data_saver:add_submenu(README)
	diamond_casino_data_saver_n:add_action("                    Save Heist Preset:", null)
	diamond_casino_data_saver_n:add_action("     Use to save your heist planning board", null)
	diamond_casino_data_saver_n:add_action(SPACE, null)
	diamond_casino_data_saver_n:add_action("                  Apply Saved Preset:", null)
	diamond_casino_data_saver_n:add_action("    Use to make your heist planning board", null)
	diamond_casino_data_saver_n:add_action("   the same as it was before saving preset", null)

	diamond_casino_preps = diamond_casino:add_submenu("Preps")

	diamond_casino_preps:add_array_item("Target", get_names_from_table(diamond_casino_targets), function()
		return states.i30
	end, function(target)
		states.i30 = target
		if target ~= 1 then
			stats.set_int(MPX() .. "H3OPT_TARGET", get_id_from_table(diamond_casino_targets, target - 1))
		end
	end)

	diamond_casino_preps:add_array_item("Approach", diamond_casino_approaches, function()
		return states.i31
	end, function(approach)
		states.i31 			  = approach
		local approach_values = {
			[2] = {3, 2, 1, 1},
			[3] = {3, 1, 2, 2},
			[4] = {1, 2, 3, 3},
			[5] = {2, 1, 3, 1},
			[6] = {1, 2, 3, 2},
			[7] = {2, 3, 1, 3}
		}
		local values = approach_values[approach]
		if values then
			set_diamond_casino_approach(table.unpack(values))
		end
		stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
		diamond_casino_weapons_index = 1
	end)

	diamond_casino_weapons_index = 1
	diamond_casino_preps:add_array_item("Gunman", get_names_from_table(diamond_casino_gunmans), function()
		return states.i32
	end, function(gunman)
		states.i32 = gunman
		if gunman ~= 1 then
			selected_gunman = diamond_casino_gunmans[gunman - 1]
			stats.set_int(MPX() .. "H3OPT_CREWWEAP", selected_gunman.id)
			stats.set_int(MPX() .. "H3OPT_WEAPS", 0)
		else
			selected_gunman = nil
		end
		diamond_casino_weapons_index = 1
	end)

	diamond_casino_preps:add_bare_item("", function()
		local current_loadout = get_diamond_casino_loadout(states.i31 - 1, selected_gunman)
		return "Weapons | 〔" .. current_loadout[diamond_casino_weapons_index] .. "〕"
	end, function()
		if selected_gunman ~= nil then
			diamond_casino_weapons_index = diamond_casino_weapons_index + 1
			if diamond_casino_weapons_index == 3 then
				diamond_casino_weapons_index = 1
			end
			stats.set_int(MPX() .. "H3OPT_WEAPS", diamond_casino_weapons_index - 1)
		end
	end, null, null)

	diamond_casino_vehicles_index = 1
	diamond_casino_preps:add_array_item("Driver", get_names_from_table(diamond_casino_drivers), function()
		return states.i33
	end, function(driver)
		states.i33 = driver
		if driver ~= 1 then
			selected_driver = diamond_casino_drivers[driver - 1]
			stats.set_int(MPX() .. "H3OPT_CREWDRIVER", selected_driver.id)
		else
			selected_driver = nil
		end
		diamond_casino_vehicles_index = 1
	end)

	diamond_casino_preps:add_bare_item("", function()
		local current_vehicles = (selected_driver ~= nil) and selected_driver.vehicles or {"Select Driver"}
		return "Vehicles | 〔" .. current_vehicles[diamond_casino_vehicles_index] .. "〕"
	end, function()
		if selected_driver ~= nil then
			diamond_casino_vehicles_index = diamond_casino_vehicles_index + 1
			if diamond_casino_vehicles_index == 5 then
				diamond_casino_vehicles_index = 1
			end
			stats.set_int(MPX() .. "H3OPT_VEHS", diamond_casino_vehicles_index - 1)
		end
	end, null, null)

	diamond_casino_preps:add_array_item("Hacker", get_names_from_table(diamond_casino_hackers), function()
		return states.i34
	end, function(hacker)
		states.i34 = hacker
		if hacker ~= 1 then
			stats.set_int(MPX() .. "H3OPT_CREWHACKER", get_id_from_table(diamond_casino_hackers, hacker - 1))
		end
	end)

	diamond_casino_preps:add_array_item("Masks", diamond_casino_masks, function()
		return states.i35
	end, function(masks)
		states.i35 = masks
		if hacker ~= 1 then
			stats.set_int(MPX() .. "H3OPT_MASKS", masks - 1)
		end
	end)

	diamond_casino_preps:add_action("Complete Preps", function() complete_diamond_casino_preps() end)

	diamond_casino_preps:add_action("Reload Planning Board", function() GCHP:set_int(DCRBl, 2) end)

	diamond_casino_preps:add_action("Unselect All", function() reset_states_range("i", 37, 42, 1) end)
	diamond_casino_preps:add_action(SPACE, null)

	diamond_casino_preps_n = diamond_casino_preps:add_submenu(README)
	diamond_casino_preps_n:add_action("                 After all choices and", null)
	diamond_casino_preps_n:add_action("            pressing «Complete Preps»", null)
	diamond_casino_preps_n:add_action("                  just wait some time", null)
	diamond_casino_preps_n:add_action(SPACE, null)
	diamond_casino_preps_n:add_action("               Reload Planning Board:", null)
	diamond_casino_preps_n:add_action("  Use this after you made changes in setup", null)

	diamond_casino_cuts = diamond_casino:add_submenu("Cuts")

	diamond_casino_cuts:add_array_item("Presets", get_names_from_table(cut_presets), function()
		return states.i36
	end, function(preset)
		states.i36 = preset
		if preset ~= 1 then
			globals.set_int(GCg, get_id_from_table(cut_presets, preset - 1))
			globals_set_ints(DCCg1, DCCg4, 1, get_id_from_table(cut_presets, preset - 1))
		end
	end)

	diamond_casino_cuts:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(DCCg1) end, function(cut) globals.set_int(DCCg1, cut) end)
	diamond_casino_cuts:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(DCCg2) end, function(cut) globals.set_int(DCCg2, cut) end)
	diamond_casino_cuts:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(DCCg3) end, function(cut) globals.set_int(DCCg3, cut) end)
	diamond_casino_cuts:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(DCCg4) end, function(cut) globals.set_int(DCCg4, cut) end)
	diamond_casino_cuts:add_int_range("Self (non-host)", 1, 0, 999, function() return globals.get_int(GCg) end, function(cut) globals.set_int(GCg, cut) end)

	diamond_casino_extra = diamond_casino:add_submenu("Extra")

	diamond_casino_extra:add_action("Skip Cutscene", function() menu.end_cutscene() end)

	diamond_casino_extra:add_action("Cooldown Killer", function()
		stats.set_int(MPX() .. "H3_COMPLETEDPOSIX", -1)
		stats.set_int("MPPLY_H3_COOLDOWN", -1)
	end)

	diamond_casino_extra:add_toggle("Autograbber (slow af)", function() return states.b7 end, function() states.b7 = not states.b7 toggle_diamond_casino_autograbber() end)

	diamond_casino_extra:add_toggle("Hecker", function() return states.b8 end, function() states.b8 = not states.b8 toggle_diamond_casino_hecker(states.b8) end)

	diamond_casino_extra:add_action("Bypass Fingerprint Hack", function()
		if FMC:get_int(DCFHl) == 4 then
			FMC:set_int(DCFHl, 5)
		end
	end)

	diamond_casino_extra:add_action("Bypass Keypad Hack", function()
		if FMC:get_int(DCKHl) ~= 4 then
			FMC:set_int(DCKHl, 5)
		end
	end)

	diamond_casino_extra:add_action("Bypass Drill Vault Door", function() FMC:set_int(DCDVDl1, FMC:get_int(DCDVDl2)) end)

	diamond_casino_extra:add_action("Unlock All POI", function()
		stats.set_int(MPX() .. "H3OPT_POI", -1)
		stats.set_int(MPX() .. "H3OPT_ACCESSPOINTS", -1)
	end)

	diamond_casino_extra:add_action("Unlock Cancellation", function()
		stats.set_int(MPX() .. "CAS_HEIST_NOTS", -1)
		stats.set_int(MPX() .. "CAS_HEIST_FLOW", -1)
	end)

	diamond_casino_extra:add_action(SPACE, null)

	diamond_casino_extra_n = diamond_casino_extra:add_submenu(README)
	diamond_casino_extra_n:add_action("                    Cooldown Killer:", null)
	diamond_casino_extra_n:add_action("    Use outside arcade, wait up to 5 mins", null)
	diamond_casino_extra_n:add_action(SPACE, null)
	diamond_casino_extra_n:add_action("                           Hecker:", null)
	diamond_casino_extra_n:add_action(" Pressing «H» will trigger bypass any hack", null)
	diamond_casino_extra_n:add_action(SPACE, null)
	diamond_casino_extra_n:add_action("                For the first robbery:", null)
	diamond_casino_extra_n:add_action("               Use «Unlock» options", null)

	diamond_casino_tps = diamond_casino:add_submenu("Teleports")

	diamond_casino_tps:add_array_item("Staff Room", get_names_from_table(diamond_casino_rooms), function()
		return states.i37
	end, function(room)
		states.i37 = room
		teleport_heist(room, diamond_casino_rooms)
	end)

	diamond_casino_tps:add_array_item("Vaults", get_names_from_table(diamond_casino_vaults), function()
		return states.i38
	end, function(vault)
		states.i38 = vault
		if vault ~= 1 then
			teleport_heist(vault, diamond_casino_vaults)
		end
	end)

	diamond_casino_tps:add_array_item("Mini-Vaults", get_names_from_table(diamond_casino_m_vaults), function()
		return states.i39
	end, function(mini_vault)
		states.i39 = mini_vault
		if mini_vault ~= 1 then
			teleport_heist(mini_vault, diamond_casino_m_vaults)
		end
	end)
end

function create_doomsday_submenu()
	doomsday:add_action("Teleport to Screen (use inside base)", function() teleport(352.23, 4874.45, -62.09, 0, 0, 0) end)

	doomsday_preps = doomsday:add_submenu("Preps")

	doomsday_preps:add_array_item("Doomsday Act", get_names_from_table(doomsday_acts), function()
		return states.i40
	end, function(act)
		states.i40 = act
		local values = doomsday_acts[act - 1]
		if values then
			set_doomsday_act(values.id[1], values.id[2])
		end
	end)

	doomsday_preps:add_action("Complete Preps", function() stats.set_int(MPX() .. "GANGOPS_FM_MISSION_PROG", -1) end)

	doomsday_preps:add_action("Reset Preps", function()	set_doomsday_act(240, 0) end)

	doomsday_preps:add_action(SPACE, null)

	doomsday_preps_n = doomsday_preps:add_submenu(README)
	doomsday_preps_n:add_action("                 After all choices and", null)
	doomsday_preps_n:add_action("            pressing «Complete Preps»", null)
	doomsday_preps_n:add_action("      leave your base and come back in", null)

	doomsday_cuts  = doomsday:add_submenu("Cuts")

	doomsday_cuts:add_array_item("Presets", get_names_from_table(cut_presets), function()
		return states.i41
	end, function(preset)
		states.i41 = preset
		if preset ~= 1 then
			globals.set_int(GCg, get_id_from_table(cut_presets, preset - 1))
			globals_set_ints(DCg1, DCg4, 1, get_id_from_table(cut_presets, preset - 1))
		end
	end)

	doomsday_cuts:add_int_range("Player 1", 1, 0, 999, function() return globals.get_int(DCg1) end, function(cut) globals.set_int(DCg1, cut) end)
	doomsday_cuts:add_int_range("Player 2", 1, 0, 999, function() return globals.get_int(DCg2) end, function(cut) globals.set_int(DCg2, cut) end)
	doomsday_cuts:add_int_range("Player 3", 1, 0, 999, function() return globals.get_int(DCg3) end, function(cut) globals.set_int(DCg3, cut) end)
	doomsday_cuts:add_int_range("Player 4", 1, 0, 999, function() return globals.get_int(DCg4) end, function(cut) globals.set_int(DCg4, cut) end)
	doomsday_cuts:add_int_range("Self (non-host)", 1, 0, 999, function() return globals.get_int(GCg) end, function(cut) globals.set_int(GCg, cut) end)

	doomsday_extra = doomsday:add_submenu("Extra")

	doomsday_extra:add_action("Skip Cutscene", function() menu.end_cutscene() end)

	doomsday_extra:add_action("Bypass Data Breaches Hack", function() FMC:set_int(DDBHl, 2) end)

	doomsday_extra:add_action("Bypass Doomsday Scenario Hack", function() FMC:set_int(DDSHl, 3) end)

	doomsday:add_bare_item("", function()
		if FMC:is_active() then
			return "Instant Finish | 〔" .. is_instant_finish_available(FMCSHl) .. "〕"
		else
			return "Instant Finish: Waiting for Heist..."
		end
	end, function()
		if FMC:is_active() then
			FMC:set_int(DIFl1, 12)
			FMC:set_int(DIFl2, 150)
			FMC:set_int(DIFl3, 99999)
			FMC:set_int(DIFl4, 99999)
			FMC:set_int(DIFl5, 80)
		end
	end, null, null)
end

function create_salvage_yard_submenu()
	salvage_yard_rob_type   = salvage_yard:add_submenu("Alter Robbery Type")
	salvage_yard_veh_type   = salvage_yard:add_submenu("Alter Vehicle Type")
	salvage_yard_veh_m_1    = salvage_yard_veh_type:add_submenu("Vehicle 1 Model")
	salvage_yard_veh_m_2    = salvage_yard_veh_type:add_submenu("Vehicle 2 Model")
	salvage_yard_veh_m_3    = salvage_yard_veh_type:add_submenu("Vehicle 3 Model")
	salvage_yard_veh_cost   = salvage_yard:add_submenu("⚠ Alter Vehicle Cost")
	salvage_yard_veh_status = salvage_yard:add_submenu("Alter Vehicle Status")
	salvage_yard_ava_status = salvage_yard:add_submenu("Alter Availability Status")

	salvage_yard_veh_cost:add_float_range("Salvage Value Multiplier", 0.2, 0.0, 999.0, function()
		return globals.get_float(SYSMg)
	end, function(multiplier)
		globals.set_float(SYSMg, multiplier)
	end)

	salvage_yard_veh_status:add_bare_item("", function()
		local claim_price = globals.get_int(SYCPg)
		local status = (claim_price ~= nil and claim_price == 0) and "On" or "Off"
		return "Claim for Free | 〔" .. status .. "〕"
	end, function()
		claim_price = globals.get_int(SYCPg)
		if claim_price ~= nil then
			globals.set_int(SYCPg, (claim_price == 0) and 20000 or 0)
			globals.set_int(SYCPDg, (claim_price == 0) and 10000 or 0)
		end
	end, null, null)

	for i = 1, 3 do
		salvage_yard_rob_type:add_array_item("Vehicle " .. i .. " Robbery", salvage_yard_robberies, function()
			local robbery_type = globals.get_int(SYRTg + i)
			return (robbery_type ~= nil) and robbery_type + 2 or 1
		end, function(robbery)
			globals.set_int(SYRTg + i, robbery - 2)
		end)

		salvage_yard_veh_cost:add_int_range("Vehicle " .. i .. " Sell Value", 100000, 0, 1000000, function()
			return globals.get_int(SYVVg + i)
		end, function(cost)
			globals.set_int(SYVVg + i, cost)
		end)

		salvage_yard_veh_status:add_bare_item("", function()
			local vehicle_status = globals.get_bool(SYCKg + i)
			local status = "Unknown"
			if vehicle_status ~= nil then
				status = (vehicle_status == true) and "Claimable" or "Unclaimable"
			end
			return "Vehicle " .. i .. " Status | 〔" .. status .. "〕"
		end, function()
			local vehicle_status = globals.get_bool(SYCKg + i)
			if vehicle_status ~= nil then
				globals.set_bool(SYCKg + i, (vehicle_status == false) and true or false)
			end
		end, null, null)

		salvage_yard_ava_status:add_bare_item("", function()
			local status_id = stats.get_int(MPX() .. "SALV23_VEHROB_STATUS" .. i - 1)
			local status = (localplayer ~= nil) and salvage_yard_veh_statuses[status_id + 2] or salvage_yard_veh_statuses[1]
			return "Vehicle " .. i .. " Status | 〔" .. status .. "〕"
		end, function()
			stats.set_int(MPX() .. "SALV23_VEHROB_STATUS" .. i - 1, 0)
		end, null, null)
	end

	for i = 1, 500 do
		salvage_yard_veh_m_1:add_toggle(salvage_yard_vehicles[i], function()
			return (globals.get_int(SYVTg + 1) == i) and true or false
		end, function()
			globals.set_int(SYVTg + 1, i)
		end)

		salvage_yard_veh_m_2:add_toggle(salvage_yard_vehicles[i], function()
			return (globals.get_int(SYVTg + 2) == i) and true or false
		end, function()
			globals.set_int(SYVTg + 2, i)
		end)

		salvage_yard_veh_m_3:add_toggle(salvage_yard_vehicles[i], function()
			return (globals.get_int(SYVTg + 3) == i) and true or false
		end, function()
			globals.set_int(SYVTg + 3, i)
		end)
	end

	salvage_yard:add_bare_item("", function()
		local setup_price = globals.get_int(SYSPg)
		local status = (setup_price ~= nil and setup_price == 0) and "On" or "Off"
		return "Setup for Free | 〔" .. status .. "〕"
	end, function()
		local setup_price = globals.get_int(SYSPg)
		if setup_price ~= nil then
			globals.set_int(SYSPg, (setup_price == 0) and 20000 or 0)
		end
	end, null, null)

	salvage_yard:add_action("Complete Preps", function() complete_salvage_yard_preps(-1) end)

	salvage_yard:add_action("Reset Preps", function() complete_salvage_yard_preps(0) end)

	salvage_yard:add_action("Reload Planning Screen", function() VP:set_int(SYRSl, 2) end)

	salvage_yard:add_action("Cooldown Killer", function() globals_set_ints(SYCg1, SYCg2, 1, 0) end)

	salvage_yard:add_action("Skip Weekly Cooldown", function()
		local current_week = stats.get_int(MPX() .. "SALV23_WEEK_SYNC")
		globals.set_int(SYWCg, current_week + 1)
	end)

	salvage_yard:add_action(SPACE, null)

	salvage_yard_n = salvage_yard:add_submenu(README)
	salvage_yard_n:add_action(" Do all actions before paying for the setup", null)
	salvage_yard_n:add_action(SPACE, null)
	salvage_yard_n:add_action("                  Alter Robbery Type:", null)
	salvage_yard_n:add_action("           Select mission type you want", null)
	salvage_yard_n:add_action(SPACE, null)
	salvage_yard_n:add_action("                  Alter Vehicle Type:", null)
	salvage_yard_n:add_action("           Select vehicle type you want", null)
	salvage_yard_n:add_action(SPACE, null)
	salvage_yard_n:add_action("                  Alter Vehicle Status:", null)
	salvage_yard_n:add_action(" Allows you to claim vehicle after robbery", null)
	salvage_yard_n:add_action(SPACE, null)
	salvage_yard_n:add_action("                   Alter Vehicle Cost:", null)
	salvage_yard_n:add_action("   Allows you to change vehicle sell value", null)
	salvage_yard_n:add_action(SPACE, null)
	salvage_yard_n:add_action("               Alter Availability Status:", null)
	salvage_yard_n:add_action("    Makes your mission «Available» again", null)
	salvage_yard_n:add_action(SPACE, null)
	salvage_yard_n:add_action("                    Complete Preps:", null)
	salvage_yard_n:add_action("   Pay for the preparation, wait till Jamal", null)
	salvage_yard_n:add_action("    finishes talking, press «Esc» and then", null)
	salvage_yard_n:add_action("               press «Complete Preps»", null)
	salvage_yard_n:add_action(SPACE, null)
	salvage_yard_n:add_action("                       Reset Preps:", null)
	salvage_yard_n:add_action("          Computer bugged? unbrick it;", null)
	salvage_yard_n:add_action("  call Jamal and cancel the heist after that", null)
	salvage_yard_n:add_action(SPACE, null)
	salvage_yard_n:add_action("               Reload Planning Screen:", null)
	salvage_yard_n:add_action("  Use this after you made changes in setup", null)
	salvage_yard_n:add_action(SPACE, null)
	salvage_yard_n:add_action("       ⚠ - means that earning really high", null)
	salvage_yard_n:add_action("     amount of money might result in ban", null)
	salvage_yard_n:add_action("    even though we didn't get ban reports", null)
	salvage_yard_n:add_action("       from people who use this method", null)
end

function create_heist_tool_submenu()
	create_agency_submenu()
	create_auto_shop_submenu()
	create_apartment_submenu()
	create_cayo_perico_submenu()
	create_diamond_casino_submenu()
	create_doomsday_submenu()
	create_salvage_yard_submenu()
end

--Money Tool Implementation--

function create_bunker_crash_submenu()
	bunker_crash:add_action("Teleport to Laptop (use inside bunker)", function()
		teleport(907.060000, -3207.460000, -98.490000, -1.500000, -0.000000, 0.000000)
		sleep(1)
		menu.send_key_press(69)
		sleep(7.5)
		menu.send_key_press(13)
	end)

	bunker_crash:add_action("Get Supplies", function() globals.set_int(GSIg + 6, 1) end)

	bunker_crash:add_toggle("Turkish Supplier", function() return states.b9 end, function() states.b9 = not states.b9 toggle_bunker_crash_turkish_supplier() end)

	bunker_crash:add_action("Instant Sell", function() GB:set_int(BCISl, 0) end)

	bunker_crash_ls = bunker_crash:add_submenu("Legal Stats")

	bunker_crash_ls:add_bare_item("", function()
		if localplayer == nil then
			return "Sales Made/Undertaken: In Menu"
		else
			return "Sales Made/Undertaken: " .. stats.get_int(MPX() .. "LIFETIME_BKR_SEL_COMPLETBC5") .. "/" .. stats.get_int(MPX() .. "LIFETIME_BKR_SEL_UNDERTABC5")
		end
	end, null, null, null)

	bunker_crash_ls:add_bare_item("", function()
		if localplayer == nil then
			return "Earnings: In Menu"
		else
			return "Earnings: $" .. format_money(stats.get_int(MPX() .. "LIFETIME_BKR_SELL_EARNINGS5"))
		end
	end, null, null, null)

	bunker_crash_s_missions = 999
	bunker_crash_ls:add_int_range("New Sell Missions", 10, 0, INT_MAX, function()
		return bunker_crash_s_missions
	end, function(missions)
		bunker_crash_s_missions = missions
	end)

	bunker_crash_earnings = 19990000
	bunker_crash_ls:add_int_range("New Earnings", 10000, 0, INT_MAX, function()
		return bunker_crash_earnings
	end, function(earnings)
		bunker_crash_earnings = earnings
	end)

	bunker_crash_ls:add_action("Apply New Stats", function()
		if not states.b10 then
			stats.set_int(MPX() .. "LIFETIME_BKR_SEL_COMPLETBC5", bunker_crash_s_missions)
			stats.set_int(MPX() .. "LIFETIME_BKR_SEL_UNDERTABC5", bunker_crash_s_missions)
			stats.set_int(MPX() .. "BUNKER_UNITS_MANUFAC", bunker_crash_s_missions * 100)
		end
		if not states.b11 then
			stats.set_int(MPX() .. "LIFETIME_BKR_SELL_EARNINGS5", bunker_crash_earnings)
		end
	end)

	bunker_crash_ls:add_toggle("Don't Apply Missions", function() return states.b10 end, function() states.b10 = not states.b10 end)

	bunker_crash_ls:add_toggle("Don't Apply Earnings", function() return states.b11 end, function() states.b11 = not states.b11 end)

	bunker_crash_ls:add_action(SPACE, null)

	bunker_crash_legal_stats_n = bunker_crash_ls:add_submenu(README)
	bunker_crash_legal_stats_n:add_action("         To save the legal statistics, you", null)
	bunker_crash_legal_stats_n:add_action("  need to make one more sale for $5,000+", null)

	bunker_crash:add_action(SPACE, null)

	bunker_crash_n = bunker_crash:add_submenu(README)
	bunker_crash_n:add_action("                  Teleport to Laptop:", null)
	bunker_crash_n:add_action("   Use to teleport to laptop inside your bunker;", null)
	bunker_crash_n:add_action("              it also automatically sits", null)
	bunker_crash_n:add_action("            down and opens the menu", null)
	bunker_crash_n:add_action(SPACE, null)
	bunker_crash_n:add_action("                       Get Supplies:", null)
	bunker_crash_n:add_action("               Use to refill your stock", null)
	bunker_crash_n:add_action(SPACE, null)
	bunker_crash_n:add_action("                    Turkish Supplier:", null)
	bunker_crash_n:add_action("          Use this to get goods; ≈1u/1s", null)
	bunker_crash_n:add_action(SPACE, null)
	bunker_crash_n:add_action("                        Instant Sell:", null)
	bunker_crash_n:add_action("      Start the sale mission first, activate", null)
end

function create_casino_master_submenu()
	states.i42 = 0
	casino_master:add_int_range("Acquire Chips Limit", 50000, 0, INT_MAX, function()
		return states.i42
	end, function(limit)
		states.i42 = limit
		globals_set_ints(CMACLg1, CMACLg2, 1, limit)
	end)

	casino_master:add_action("⚠ Bypass Casino Limits", function()
		stats.set_int("MPPLY_CASINO_CHIPS_WON_GD", 0)
		stats.set_int("MPPLY_CASINO_CHIPS_WONTIM", 0)
		stats.set_int("MPPLY_CASINO_GMBLNG_GD", 0)
		stats.set_int("MPPLY_CASINO_BAN_TIME", 0)
		stats.set_int("MPPLY_CASINO_CHIPS_PURTIM", 0)
		stats.set_int("MPPLY_CASINO_CHIPS_PUR_GD", 0)
	end)

	casino_master_bj = casino_master:add_submenu("Blackjack")

	casino_master_bj:add_bare_item("", function()
		if localplayer ~= nil then
			local current_table = BJ:get_int(CMBJPTl + 1 + (get_localplayer_id() * CMBJPTSl) + 4)
			if current_table ~= nil and current_table ~= -1 then
				local card = BJ:get_int(CMBJCl + CMBJDl + 1 + (current_table * 13) + 1)
				return "Dealer's Face Down Card: " .. get_casino_master_card_name(card)
			else
				return "Dealer's Face Down Card: Unknown"
			end
		else
			return "Dealer's Face Down Card: Unknown"
		end
	end, null, null, null)

	casino_master_bj:add_action("⚠ Trick The Dealer", function()
		if localplayer ~= nil then
			local current_table = BJ:get_int(CMBJPTl + 1 + (get_localplayer_id() * CMBJPTSl) + 4)
			if current_table ~= nil and current_table ~= -1 then
				BJ:set_int(CMBJCl + CMBJDl + 1 + (current_table * 13) + 1, 11)
				BJ:set_int(CMBJCl + CMBJDl + 1 + (current_table * 13) + 2, 12)
				BJ:set_int(CMBJCl + CMBJDl + 1 + (current_table * 13) + 3, 13)
				BJ:set_int(CMBJCl + CMBJDl + 1 + (current_table * 13) + 12, 3)
			end
		end
	end)

	casino_master_bj:add_action(SPACE, null)

	casino_master_bj_n = casino_master_bj:add_submenu(README)
	casino_master_bj_n:add_action("       ⚠ - means that earning really high", null)
	casino_master_bj_n:add_action("     amount of money might result in ban", null)
	casino_master_bj_n:add_action("    even though we didn't get ban reports", null)
	casino_master_bj_n:add_action("       from people who use this method", null)

	casino_master_lw = casino_master:add_submenu("Lucky Wheel")

	casino_master_lw:add_array_item("⚠ Give Prize", get_names_from_table(lucky_wheel_prizes), function()
		return states.i44
	end, function(prize)
		states.i44 = 1
		if prize ~= 1 then
			CLW:set_int(CMGLPl1, get_id_from_table(lucky_wheel_prizes, prize - 1))
			CLW:set_int(CMGLPl2, 11)
		end
	end)

	casino_master_lw:add_action(SPACE, null)

	casino_master_lw_n = casino_master_lw:add_submenu(README)
	casino_master_lw_n:add_action("    ⚠ - means that getting the prize more", null)
	casino_master_lw_n:add_action("     than once per day might result in ban", null)

	casino_master_p = casino_master:add_submenu("Poker")

	casino_master_p:add_bare_item("", function()
		if localplayer ~= nil then
			local current_table = TCP:get_int(CMPTl + 1 + (get_localplayer_id() * CMPTSl) + 2)
			if current_table ~= nil and current_table ~= -1 then
				local card1 = TCP:get_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 1 + (get_localplayer_id() * 3))
				local card2 = TCP:get_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 2 + (get_localplayer_id() * 3))
				local card3 = TCP:get_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 3 + (get_localplayer_id() * 3))
				return "My Cards: " .. get_casino_master_card_name(card1) .. " " .. get_casino_master_card_name(card2) .. " " .. get_casino_master_card_name(card3)
			else
				return "My Cards: Unknowns"
			end
		else
			return "My Cards: Unknowns"
		end
	end, null, null, null)

	casino_master_p:add_bare_item("", function()
		if localplayer ~= nil then
			local current_table = TCP:get_int(CMPTl + 1 + (get_localplayer_id() * CMPTSl) + 2)
			if current_table ~= nil and current_table ~= -1 then
				local dealer_id = get_casino_master_p_dealer_id(current_table)
				local card1 	= TCP:get_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 1 + (dealer_id * 3))
				local card2 	= TCP:get_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 2 + (dealer_id * 3))
				local card3 	= TCP:get_int(CMPCl + CMPCDl + 1 + (current_table * CMPDSl) + 2 + 3 + (dealer_id * 3))
				return "Dealer's Cards: " .. get_casino_master_card_name(card1) .. " " .. get_casino_master_card_name(card2) .. " " .. get_casino_master_card_name(card3)
			else
				return "Dealer's Cards: Unknowns"
			end
		else
			return "Dealer's Cards: Unknowns"
		end
	end, null, null, null)

	casino_master_p:add_action("⚠ Give Straight Flush", function()
		if localplayer ~= nil then
			local current_table = TCP:get_int(CMPTl + 1 + (get_localplayer_id() * CMPTSl) + 2)
			if current_table ~= nil and current_table ~= -1 then
				set_casino_master_p_cards(get_localplayer_id(), current_table, 50, 51, 52)
			end
		end
	end)

	casino_master_p:add_action("⚠ Trick The Dealer", function()
		if localplayer ~= nil then
			local current_table = TCP:get_int(CMPTl + 1 + (get_localplayer_id() * CMPTSl) + 2)
			if current_table ~= nil and current_table ~= -1 then
				dealer_id = get_casino_master_p_dealer_id(current_table)
				set_casino_master_p_cards(dealer_id, current_table, 2, 17, 32)
			end
		end
	end)

	casino_master_p:add_action(SPACE, null)

	casino_master_p_n = casino_master_p:add_submenu(README)
	casino_master_p_n:add_action("  Give Straight Flush and Trick The Dealer:", null)
	casino_master_p_n:add_action("       Use features during the animation", null)
	casino_master_p_n:add_action("              where you sit in the chair", null)
	casino_master_p_n:add_action(SPACE, null)
	casino_master_p_n:add_action("       ⚠ - means that earning really high", null)
	casino_master_p_n:add_action("     amount of money might result in ban", null)
	casino_master_p_n:add_action("    even though we didn't get ban reports", null)
	casino_master_p_n:add_action("       from people who use this method", null)

	casino_master_r = casino_master:add_submenu("Roulette")

	casino_master_r:add_action("⚠ Land On Black 13 (after 00:00)", function()
		if localplayer ~= nil then
			for i = 0, 6 do
				CR:set_int(CMRMTl + CMROTl + CMRBTl + i, 13)
			end
		end
	end)

	casino_master_r:add_action(SPACE, null)

	casino_master_r_n = casino_master_r:add_submenu(README)
	casino_master_r_n:add_action("       ⚠ - means that earning really high", null)
	casino_master_r_n:add_action("     amount of money might result in ban", null)
	casino_master_r_n:add_action("    even though we didn't get ban reports", null)
	casino_master_r_n:add_action("       from people who use this method", null)

	casino_master_sm = casino_master:add_submenu("Slot Machines")

	casino_master_sm:add_action("⚠ Rig Slots", function() set_casino_master_sm_status(6) end)

	casino_master_sm:add_action("Lose Slots", function() set_casino_master_sm_status(0) end)

	casino_master_sm:add_action(SPACE, null)

	casino_master_sm_n = casino_master_sm:add_submenu(README)
	casino_master_sm_n:add_action("   ⚠ - means that the option is unsafe and", null)
	casino_master_sm_n:add_action("             using it might result in ban", null)

	casino_master:add_action(SPACE, null)

	casino_master_n = casino_master:add_submenu(README)
	casino_master_n:add_action("    ⚠ - means that using this option isn't", null)
	casino_master_n:add_action("    recommended for earning more chips", null)
end

function create_hangar_cargo_vip_submenu()
	hangar_cargo_vip:add_action("Start Solo Session", function() change_session(8) end)

	hangar_cargo_vip:add_action("Get Some Cargo", function() stats_set_packed_bool(36828, true) end)

	hangar_cargo_vip:add_toggle("Cargo Loop", function() return states.b11 end, function() states.b11 = not states.b11 toggle_hangar_cargo_vip_loop() end)

	hangar_cargo_vip_ppp = hangar_cargo_vip:add_submenu("⚠ Price per Piece (max 4mil)")

	for i = 1, 8 do
		hangar_cargo_vip_ppp:add_int_range(hangar_cargo_vip_cargoes[i], 30000, 0, 4000000, function()
			return globals.get_int(HCVPg + i)
		end, function(price)
			globals.set_int(HCVPg + i, price)
		end)
	end

	hangar_cargo_vip:add_int_range("Instant Air Cargo Sell", 1, 0, 15, function()
		return 0
	end, function(delivered)
		globals.set_float(HCVRCg, 0)
		GS:set_int(HCVISl1, delivered)
		sleep(1)
		GS:set_int(HCVISl2, -1)
	end)

	hangar_cargo_vip_ls = hangar_cargo_vip:add_submenu("Legal Stats")

	hangar_cargo_vip_ls:add_bare_item("", function()
		if localplayer == nil then
			return "Buy Made/Undertaken: In Menu"
		else
			return "Buy Made/Undertaken: " .. stats.get_int(MPX() .. "LFETIME_HANGAR_BUY_COMPLET") .. "/" .. stats.get_int(MPX() .. "LFETIME_HANGAR_BUY_UNDETAK")
		end
	end, null, null, null)

	hangar_cargo_vip_ls:add_bare_item("", function()
		if localplayer == nil then
			return "Sales Made/Undertaken: In Menu"
		else
			return "Sales Made/Undertaken: " .. stats.get_int(MPX() .. "LFETIME_HANGAR_SEL_COMPLET") .. "/" .. stats.get_int(MPX() .. "LFETIME_HANGAR_SEL_UNDETAK")
		end
	end, null, null, null)

	hangar_cargo_vip_ls:add_bare_item("", function()
		if localplayer == nil then
			return "Earnings: In Menu"
		else
			return "Earnings: $" .. format_money(stats.get_int(MPX() .. "LFETIME_HANGAR_EARNINGS"))
		end
	end, null, null, null)

	hangar_cargo_vip_b_missions = 1000
	hangar_cargo_vip_ls:add_int_range("New Buy Missions", 10, 0, INT_MAX, function()
		return hangar_cargo_vip_b_missions
	end, function(missions)
		hangar_cargo_vip_b_missions = missions
	end)

	hangar_cargo_vip_s_missions = 999
	hangar_cargo_vip_ls:add_int_range("New Sell Missions", 10, 0, INT_MAX, function()
		return hangar_cargo_vip_s_missions
	end, function(missions)
		hangar_cargo_vip_s_missions = missions
	end)

	hangar_cargo_vip_earnings = 19970000
	hangar_cargo_vip_ls:add_int_range("New Earnings", 30000, 0, INT_MAX, function()
		return hangar_cargo_vip_earnings
	end, function(earnings)
		hangar_cargo_vip_earnings = earnings
	end)

	hangar_cargo_vip_ls:add_action("Apply New Stats", function()
		if not states.b11 then
			stats.set_int(MPX() .. "LFETIME_HANGAR_BUY_COMPLET", hangar_cargo_vip_b_missions)
			stats.set_int(MPX() .. "LFETIME_HANGAR_BUY_UNDETAK", hangar_cargo_vip_b_missions)
			stats.set_int(MPX() .. "LFETIME_HANGAR_SEL_COMPLET", hangar_cargo_vip_s_missions)
			stats.set_int(MPX() .. "LFETIME_HANGAR_SEL_UNDETAK", hangar_cargo_vip_s_missions)
		end
		if not states.b12 then
			stats.set_int(MPX() .. "LFETIME_HANGAR_EARNINGS", hangar_cargo_vip_earnings)
		end
	end)

	hangar_cargo_vip_ls:add_toggle("Don't Apply Missions", function() return states.b11 end, function() states.b11 = not states.b11 end)

	hangar_cargo_vip_ls:add_toggle("Don't Apply Earnings", function() return states.b12 end, function() states.b12 = not states.b12 end)

	hangar_cargo_vip_ls:add_action(SPACE, null)

	hangar_cargo_vip_ls_n = hangar_cargo_vip_ls:add_submenu(README)
	hangar_cargo_vip_ls_n:add_action("         To save the legal statistics, you", null)
	hangar_cargo_vip_ls_n:add_action(" need to make one more sale for $30,000+", null)

	hangar_cargo_vip:add_action(SPACE, null)

	hangar_cargo_vip_n = hangar_cargo_vip:add_submenu(README)
	hangar_cargo_vip_n:add_action("                   Start Solo Session:", null)
	hangar_cargo_vip_n:add_action("        Use if you aren't alone in session", null)
	hangar_cargo_vip_n:add_action(SPACE, null)
	hangar_cargo_vip_n:add_action("                Instant Air Cargo Sell:", null)
	hangar_cargo_vip_n:add_action("      Select number of «Total Delivered»", null)
	hangar_cargo_vip_n:add_action(SPACE, null)
	hangar_cargo_vip_n:add_action("       ⚠ - means that earning really high", null)
	hangar_cargo_vip_n:add_action("     amount of money might result in ban", null)
	hangar_cargo_vip_n:add_action("    even though we didn't get ban reports", null)
	hangar_cargo_vip_n:add_action("       from people who use this method", null)
end

function create_money_editor_submenu()
	cash_remover = money_editor:add_submenu("Cash Remover (Real)")

	for i = 1, 10 do
		cash_remover:add_array_item("Number #" .. i, list_0_9, function()
			return def_num_curs[i]
		end, function(number)
			def_nums[i] 	= list_0_9[number]
			def_num_curs[i] = number
		end)
	end

	cash_remover:add_bare_item("", function()
		local cash_str = ""
		for i = 1, 10 do
			cash_str = cash_str .. def_nums[i]
		end
		cash_to_remove = tonumber(cash_str)
		if cash_to_remove > INT_MAX then
			cash_to_remove = INT_MAX
		end
		return "Remove Cash: $" ..  format_money(cash_to_remove)
	end, function()
		globals.set_int(CRg, cash_to_remove)
		if states.b12 then
			sleep(1)
			reset_def_nums(1, 10, 1)
		end
	end, null, null)

	states.b12 = true
	cash_remover:add_toggle("Reset Value", function() return states.b12 end, function() states.b12 = not states.b12 end)

	cash_remover:add_action(SPACE, null)

	cash_remover_n = cash_remover:add_submenu(README)
	cash_remover_n:add_action("                        Reset Value:", null)
	cash_remover_n:add_action("  Resets «Remove Cash» value after using", null)

	story_chars = money_editor:add_submenu("Story Characters (Real)")

	for i = 1, 3 do
		story_chars:add_int_range(money_editor_story_chars[i] .. "'s Cash", 1000000, 0, INT_MAX, function()
			return stats.get_int("SP" .. i - 1 .. "_TOTAL_CASH")
		end, function(cash)
			stats.set_int("SP" .. i - 1 .. "_TOTAL_CASH", cash)
		end)
	end

	totals = money_editor:add_submenu("Earned n Spent (Stats)")

	money_editor_total_earned = "Not Selected"
	totals:add_array_item("Earned From", get_names_from_table(money_editor_earned_from), function()
		return states.i45
	end, function(selected_from)
		states.i45 				  = selected_from
		states.i46 				  = 1
		if selected_from ~= 1 then
			money_editor_total_earned = get_id_from_table(money_editor_earned_from, selected_from - 1)
			money_editor_total_spent  = "Not Selected"
		else
			money_editor_total_earned = "Not Selected"
		end
	end)

	money_editor_total_spent = "Not Selected"
	totals:add_array_item("Spent On", get_names_from_table(money_editor_spent_on), function()
		return states.i46
	end, function(selected_spent)
		states.i45 				  = 1
		states.i46 				  = selected_spent
		if selected_spent ~= 1 then
			money_editor_total_earned = "Not Selected"
			money_editor_total_spent  = get_id_from_table(money_editor_spent_on, selected_spent - 1)
		else
			money_editor_total_spent = "Not Selected"
		end
	end)

	totals:add_bare_item("", function()
		if states.i45 == 1 then
			return "Current Earned: " .. money_editor_total_earned
		elseif states.i45 == 2 then
			return "Current Total Earned: $" .. format_money(stats.get_int(money_editor_total_earned))
		else
			return "Current Earned: $" .. format_money(stats.get_int(MPX() .. money_editor_total_earned))
		end
	end, null, null, null)

	totals:add_bare_item("", function()
		if states.i46 == 1 then
			return "Current Spent: " .. money_editor_total_spent
		elseif states.i46 == 2 then
			return "Current Total Spent: $" .. format_money(stats.get_int(money_editor_total_spent))
		else
			return "Current Spent: $" .. format_money(stats.get_int(MPX() .. money_editor_total_spent))
		end
	end, null, null, null)

	for i = 11, 20 do
		totals:add_array_item("Number #" .. i - 10, list_0_9, function()
			return def_num_curs[i]
		end, function(number)
			def_nums[i] 	= list_0_9[number]
			def_num_curs[i] = number
		end)
	end

	totals:add_bare_item("", function()
		local cash_str = ""
		for i = 11, 20 do
			cash_str = cash_str .. def_nums[i]
		end
		cash_to_change = tonumber(cash_str)
		if cash_to_change > INT_MAX then
			cash_to_change = INT_MAX
		end
		return "Change Value: $" .. format_money(cash_to_change)
	end, function()
		if states.i45 == 1 then
			if states.i46 == 2 then
				stats.set_int(money_editor_total_spent, cash_to_change)
			else
				stats.set_int(MPX() .. money_editor_total_spent, cash_to_change)
			end
		else
			if states.i45 == 2 then
				stats.set_int(money_editor_total_earned, cash_to_change)
			else

				stats.set_int(MPX() .. money_editor_total_earned, cash_to_change)
			end
		end
		if states.b13 then
			sleep(1)
			reset_def_nums(11, 20, 1)
		end
	end, null, null)

	states.b13 = true
	totals:add_toggle("Reset Value", function() return states.b13 end, function() states.b13 = not states.b13 end)

	totals:add_action("Make Total Earned n Spent The Same", function() stats.set_int("MPPLY_TOTAL_EVC", stats.get_int("MPPLY_TOTAL_SVC")) end)

	totals:add_action("Make Total Spent n Earned The Same", function() stats.set_int("MPPLY_TOTAL_SVC", stats.get_int("MPPLY_TOTAL_EVC")) end)

	totals:add_action(SPACE, null)

	totals_n = totals:add_submenu(README)
	totals_n:add_action("   To save the new statistics, you need to", null)
	totals_n:add_action("    earn or spend somehow some money", null)
	totals_n:add_action(SPACE, null)
	totals_n:add_action("                        Reset Value:", null)
	totals_n:add_action("  Resets «Change Value» value after using", null)
end

function create_nightclub_helper_submenu()
	nightclub_helper_info = nightclub_helper:add_submenu("Data Collector")

	nightclub_helper_info:add_bare_item("", function()
		return "Popularity: " .. math.floor(stats.get_int(MPX() .. "CLUB_POPULARITY") / 10) .. "%"
	end, null, null, null)

	nightclub_helper_info:add_bare_item("", function()
		return "Safe: $" .. format_money(stats.get_int(MPX() .. "CLUB_SAFE_CASH_VALUE"))
	end, null, null, null)

	nightclub_helper_info:add_bare_item("", function()
		local cargo_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_0")
		if cargo_amount == 0 then
			return "Cargo n Shipments: $0 (0/50)"
		else
			return "Cargo n Shipments: $" .. format_money(globals.get_int(NHCNSg) * cargo_amount) .. " (" .. cargo_amount .. "/50)"
		end
	end, null, null, null)

	nightclub_helper_info:add_bare_item("", function()
		local sporting_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_1")
		if sporting_amount == 0 then
			return "Sporting Goods: $0 (0/100)"
		else
			return "Sporting Goods: $" .. format_money(globals.get_int(NHSGg) * sporting_amount) .. " (" .. sporting_amount .. "/100)"
		end
	end, null, null, null)

	nightclub_helper_info:add_bare_item("", function()
		local imports_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_2")
		if imports_amount == 0 then
			return "S.A. Imports: $0 (0/10)"
		else
			return "S.A. Imports: $" .. format_money(globals.get_int(NHSAIg) * imports_amount) .. " (" .. imports_amount .. "/10)"
		end
	end, null, null, null)

	nightclub_helper_info:add_bare_item("", function()
		local pharmaceut_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_3")
		if pharmaceut_amount == 0 then
			return "Pharmaceut. Research: $0 (0/20)"
		else
			return "Pharmaceut. Research: $" .. format_money(globals.get_int(NHPRg) * pharmaceut_amount) .. " (" .. pharmaceut_amount .. "/20)"
		end
	end, null, null, null)

	nightclub_helper_info:add_bare_item("", function()
		local organic_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_4")
		if organic_amount == 0 then
			return "Organic Produce: $0 (0/80)"
		else
			return "Organic Produce: $" .. format_money(globals.get_int(NHOPg) * organic_amount) .. " (" .. organic_amount .. "/80)"
		end
	end, null, null, null)

	nightclub_helper_info:add_bare_item("", function()
		local printing_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_5")
		if printing_amount == 0 then
			return "Printing n Copying: $0 (0/60)"
		else
			return "Printing n Copying: $" .. format_money(globals.get_int(NHPNCg) * printing_amount) .. " (" .. printing_amount .. "/60)"
		end
	end, null, null, null)

	nightclub_helper_info:add_bare_item("", function()
		local cash_amount = stats.get_int(MPX() .. "HUB_PROD_TOTAL_6")
		if cash_amount == 0 then
			return "Cash Creation: $0 (0/40)"
		else
			return "Cash Creation: $" .. format_money(globals.get_int(NHCCg) * cash_amount) .. " (" .. cash_amount .. "/40)"
		end
	end, null, null, null)

	nightclub_helper:add_action("Start Solo Session", function() change_session(8) end)

	nightclub_helper:add_toggle("Cooldown Killer", function() return states.b14 end, function() states.b14 = not states.b14 toggle_nightclub_helper_cd_killer(states.b14) end)

	nightclub_helper:add_toggle("Turkish Supplier", function() return states.b15 end, function() states.b15 = not states.b15 toggle_nightclub_helper_turkish_supplier() end)

	nightclub_helper:add_array_item("Popularity", nightclub_helper_popularity, function()
		return states.i47
	end, function(popularity)
		if popularity == 2 then
			stats.set_int(MPX() .. "CLUB_POPULARITY", 1000)
		elseif popularity == 3 then
			stats.set_int(MPX() .. "CLUB_POPULARITY", 0)
		end
	end)

	nightclub_helper:add_array_item("Safe", nightclub_helper_safe, function()
		return states.i48
	end, function(safe)
		if safe == 2 then
			stats.set_int(MPX() .. "CLUB_POPULARITY", 0)
			sleep(0.2)
			globals.set_int(NLISg, 300000)
			globals.set_int(NLSCg, 300000)
			stats.set_int(MPX() .. "CLUB_PAY_TIME_LEFT", -1)
			states.i48 = safe
		elseif safe == 3 then
			states.i48 = 1
			AMN:set_int(NLCl, 1)
		end
	end)

	nightclub_helper:add_array_item("⚠ Max Payout (4mil)", get_names_from_table(nighclub_helper_cargoes), function()
		return states.i49
	end, function(payout)
		states.i49 = payout
		if payout ~= 1 then
			local current_cargo = stats.get_int(MPX() .. get_id_from_table(nighclub_helper_cargoes, payout - 1))
			if current_cargo ~= 0 then
				globals.set_int(NHCNSg, math.floor(4000000 / current_cargo))
			end
		end
	end)

	nightclub_helper:add_action("Default Payout", function()
		states.i49 = 1
		globals.set_int(NHCNSg, 10000)
		globals.set_int(NHSGg, 5000)
		globals.set_int(NHSAIg, 27000)
		globals.set_int(NHPRg, 11475)
		globals.set_int(NHOPg, 2025)
		globals.set_int(NHPNCg, 1350)
		globals.set_int(NHCCg, 4725)
	end)

	nightclub_helper_ls = nightclub_helper:add_submenu("Legal Stats")

	nightclub_helper_ls:add_bare_item("", function()
		if localplayer == nil then
			return "Sales Made: In Menu"
		else
			return "Sales Made: " .. stats.get_int(MPX() .. "HUB_SALES_COMPLETED")
		end
	end, null, null, null)

	nightclub_helper_ls:add_bare_item("", function()
		if localplayer == nil then
			return "Earnings: In Menu"
		else
			return "Earnings: $" .. format_money(stats.get_int(MPX() .. "HUB_EARNINGS"))
		end
	end, null, null, null)

	nightclub_helper_s_missions = 999
	nightclub_helper_ls:add_int_range("New Sell Missions", 10, 0, INT_MAX, function()
		return nightclub_helper_s_missions
	end, function(missions)
		nightclub_helper_s_missions = missions
	end)

	nightclub_helper_earnings = 19990000
	nightclub_helper_ls:add_int_range("New Earnings", 10000, 0, INT_MAX, function()
		return nightclub_helper_earnings
	end, function(earnings)
		nightclub_helper_earnings = earnings
	end)

	nightclub_helper_ls:add_action("Apply New Stats", function()
		if not states.b16 then
			stats.set_int(MPX() .. "HUB_SALES_COMPLETED", nightclub_helper_s_missions)
		end
		if not states.b17 then
			stats.set_int(MPX() .. "HUB_EARNINGS", nightclub_helper_earnings)
		end
	end)

	nightclub_helper_ls:add_toggle("Don't Apply Missions", function() return states.b16 end, function() states.b16 = not states.b16 end)

	nightclub_helper_ls:add_toggle("Don't Apply Earnings", function() return states.b17 end, function() states.b17 = not states.b17 end)

	nightclub_helper_ls:add_action(SPACE, null)

	nightclub_helper_ls_n = nightclub_helper_ls:add_submenu(README)
	nightclub_helper_ls_n:add_action("         To save the legal statistics, you", null)
	nightclub_helper_ls_n:add_action("  need to make one more sale for $5,000+", null)

	nightclub_helper:add_action(SPACE, null)

	nightclub_helper_n = nightclub_helper:add_submenu(README)
	nightclub_helper_n:add_action("                   Start Solo Session:", null)
	nightclub_helper_n:add_action("        Use if you aren't alone in session", null)
	nightclub_helper_n:add_action(SPACE, null)
	nightclub_helper_n:add_action("                    Turkish Supplier:", null)
	nightclub_helper_n:add_action("         Use this to get goods; ≈1p/10s", null)
	nightclub_helper_n:add_action(SPACE, null)
	nightclub_helper_n:add_action("       ⚠ - means that earning really high", null)
	nightclub_helper_n:add_action("     amount of money might result in ban", null)
	nightclub_helper_n:add_action("    even though we didn't get ban reports", null)
	nightclub_helper_n:add_action("       from people who use this method", null)
end

function create_special_cargo_vip_submenu()
	special_cargo_vip_afk = special_cargo_vip:add_submenu("AFK Mode")

	special_cargo_vip_afk_delay = 0.5
	states.b18 					= true
	special_cargo_vip_afk:add_toggle("Default Delay (0.5s)", function()
		return states.b18
	end, function()
		states.b18 					= not states.b18
		states.i50 					= 0.5
		special_cargo_vip_afk_delay = 0.5
	end)

	states.i50 = 0.5
	special_cargo_vip_afk:add_float_range("Custom Delay (s)", 0.1, 0.5, 5.0, function()
		return states.i50
	end, function(delay)
		if delay ~= 0.5 then
			states.b18 = false
		else
			states.b18 = true
		end
		states.i50 					= delay
		special_cargo_vip_afk_delay = delay
	end)

	special_cargo_vip_w_type = 0
	special_cargo_vip_afk:add_array_item("Warehouse Type", special_cargo_vip_wars, function()
		return states.i51
	end, function(warehouse)
		states.i51 				 = warehouse
		special_cargo_vip_w_type = warehouse - 1
	end)

	special_cargo_vip_r_cash = 0
	states.i52 				 = 0
	special_cargo_vip_afk:add_int_range("Required Cash (0 = inf)", 1000000, 0, INT_MAX, function()
		return states.i52
	end, function(cash)
		states.i52 				 = cash
		special_cargo_vip_r_cash = cash
	end)

	special_cargo_vip_stop_afk = 0
	special_cargo_vip_afk:add_toggle("⚠ Toggle AFK Mode (buggy)", function()
		return states.b19
	end, function()
		if special_cargo_vip_w_type ~= 0 then
			states.b19 = not states.b19
			toggle_special_cargo_vip_afk()
		end
	end)

	special_cargo_vip_afk:add_action(SPACE, null)

	special_cargo_vip_afk_n = special_cargo_vip_afk:add_submenu(README)
	special_cargo_vip_afk_n:add_action("                      Custom Delay:", null)
	special_cargo_vip_afk_n:add_action("  Change this if you aren't getting money", null)
	special_cargo_vip_afk_n:add_action(SPACE, null)
	special_cargo_vip_afk_n:add_action("                   Warehouse Type:", null)
	special_cargo_vip_afk_n:add_action("           Select your warehouse type", null)
	special_cargo_vip_afk_n:add_action(SPACE, null)
	special_cargo_vip_afk_n:add_action("                     Required Cash:", null)
	special_cargo_vip_afk_n:add_action("     Choose amount of money you want", null)
	special_cargo_vip_afk_n:add_action("               to get with AFK mode;", null)
	special_cargo_vip_afk_n:add_action("     first transaction will always be 6mil", null)
	special_cargo_vip_afk_n:add_action(SPACE, null)
	special_cargo_vip_afk_n:add_action("                  Toggle AFK Mode:", null)
	special_cargo_vip_afk_n:add_action("     Activate when your character enters", null)
	special_cargo_vip_afk_n:add_action("  and completely stops in the warehouse;", null)
	special_cargo_vip_afk_n:add_action("          don't move the camera before", null)
	special_cargo_vip_afk_n:add_action("               and during activation;", null)
	special_cargo_vip_afk_n:add_action("    disable only while entering warehouse;", null)
	special_cargo_vip_afk_n:add_action(SPACE, null)
	special_cargo_vip_afk_n:add_action("   ⚠ - means that the option is unsafe and", null)
	special_cargo_vip_afk_n:add_action("             using it might result in ban", null)
	special_cargo_vip_afk_n:add_action(SPACE, null)

	easter_egg = special_cargo_vip_afk_n:add_submenu("Easter Egg")
	easter_egg:add_action(" Woah, you found me! Take this prize then:", null)
	easter_egg:add_action("                   Receive The Prize", function()
		globals.set_int(CLg, 1)
		sleep(10)
		menu.suicide_player()
	end)

	special_cargo_vip_settings = special_cargo_vip:add_submenu("Settings")

	special_cargo_vip_settings:add_action("Start Solo Session", function() change_session(8) end)

	special_cargo_vip_crate_back = false
	special_cargo_vip_settings:add_toggle("Disable CrateBack", function() return special_cargo_vip_crate_back end, function() special_cargo_vip_crate_back = not special_cargo_vip_crate_back end)

	special_cargo_vip_disable_rp = true
	special_cargo_vip_settings:add_toggle("Disable RP Gain", function() return special_cargo_vip_disable_rp end, function() special_cargo_vip_disable_rp = not special_cargo_vip_disable_rp end)

	special_cargo_vip_crates = special_cargo_vip_settings:add_submenu("Get Crates")

	special_cargo_vip_crates:add_action("1-3 per Press", function() stats_set_packed_bools(32359, 32363, true) end)

	special_cargo_vip_crates:add_toggle("Crates Loop", function() return states.b20 end, function() states.b20 = not states.b20 toggle_special_cargo_vip_loop() end)

	special_cargo_vip_crates:add_int_range("Instant Buy", 1, 1, 111, function()
		return states.i53
	end, function(crates)
		states.i53 = crates
		GCB:set_int(SCVIBl1, 1)
		GCB:set_int(SCVIBl2, crates)
		GCB:set_int(SCVIBl3, 6)
		GCB:set_int(SCVIBl4, 4)
	end)

	special_cargo_vip_crates:add_action(SPACE, null)

	special_cargo_vip_crates_n = special_cargo_vip_crates:add_submenu(README)
	special_cargo_vip_crates_n:add_action("                       Instant Buy:", null)
	special_cargo_vip_crates_n:add_action("       Start the buy mission first, select", null)
	special_cargo_vip_crates_n:add_action("      the number of crates and activate", null)

	special_cargo_vip_ls = special_cargo_vip_settings:add_submenu("Legal Stats")

	special_cargo_vip_ls:add_bare_item("", function()
		if localplayer == nil then
			return "Buy Made/Undertaken: In Menu"
		else
			return "Buy Made/Undertaken: " .. stats.get_int(MPX() .. "LIFETIME_BUY_COMPLETE") .. "/" .. stats.get_int(MPX() .. "LIFETIME_BUY_UNDERTAKEN")
		end
	end, null, null, null)

	special_cargo_vip_ls:add_bare_item("", function()
		if localplayer == nil then
			return "Sales Made/Undertaken: In Menu"
		else
			return "Sales Made/Undertaken: " .. stats.get_int(MPX() .. "LIFETIME_SELL_COMPLETE") .. "/" .. stats.get_int(MPX() .. "LIFETIME_SELL_UNDERTAKEN")
		end
	end, null, null, null)

	special_cargo_vip_ls:add_bare_item("", function()
		if localplayer == nil then
			return "Earnings: In Menu"
		else
			return "Earnings: $" .. format_money(stats.get_int(MPX() .. "LIFETIME_CONTRA_EARNINGS"))
		end
	end, null, null, null)

	special_cargo_vip_b_missions = 1000
	special_cargo_vip_ls:add_int_range("New Buy Missions", 10, 0, INT_MAX, function()
		return special_cargo_vip_b_missions
	end, function(missions)
		special_cargo_vip_b_missions = missions
	end)

	special_cargo_vip_s_missions = 999
	special_cargo_vip_ls:add_int_range("New Sell Missions", 10, 0, INT_MAX, function()
		return special_cargo_vip_s_missions
	end, function(missions)
		special_cargo_vip_s_missions = missions
	end)

	special_cargo_vip_earnings = 19990000
	special_cargo_vip_ls:add_int_range("New Earnings", 10000, 0, INT_MAX, function()
		return special_cargo_vip_earnings
	end, function(earnings)
		special_cargo_vip_earnings = earnings
	end)

	special_cargo_vip_ls:add_action("Apply New Stats", function()
		if not states.b21 then
			stats.set_int(MPX() .. "LIFETIME_BUY_COMPLETE", special_cargo_vip_b_missions)
			stats.set_int(MPX() .. "LIFETIME_BUY_UNDERTAKEN", special_cargo_vip_b_missions)
			stats.set_int(MPX() .. "LIFETIME_SELL_COMPLETE", special_cargo_vip_s_missions)
			stats.set_int(MPX() .. "LIFETIME_SELL_UNDERTAKEN", special_cargo_vip_s_missions)
		end
		if not states.b22 then
			stats.set_int(MPX() .. "LIFETIME_CONTRA_EARNINGS", special_cargo_vip_earnings)
		end
	end)

	special_cargo_vip_ls:add_toggle("Don't Apply Missions", function() return states.b21 end, function() states.b21 = not states.b21 end)

	special_cargo_vip_ls:add_toggle("Don't Apply Earnings", function() return states.b22 end, function() states.b22 = not states.b22 end)

	special_cargo_vip_ls:add_action(SPACE, null)

	special_cargo_vip_ls_n = special_cargo_vip_ls:add_submenu(README)

	special_cargo_vip_ls_n:add_action("         To save the legal statistics, you", null)
	special_cargo_vip_ls_n:add_action(" need to make one more sale for $10,000+", null)

	special_cargo_vip_settings:add_action("Clean Office", function()
		stats.set_int(MPX() .. "LIFETIME_BUY_COMPLETE", 1)
		stats.set_int(MPX() .. "LIFETIME_BUY_UNDERTAKEN", 1)
		stats.set_int(MPX() .. "LIFETIME_SELL_COMPLETE", 1)
		stats.set_int(MPX() .. "LIFETIME_SELL_UNDERTAKEN", 1)
		stats.set_int(MPX() .. "LIFETIME_CONTRA_EARNINGS", 1)
		sleep(1)
		change_session(8)
	end)

	special_cargo_vip_settings:add_action(SPACE, null)

	special_cargo_vip_settings_n = special_cargo_vip_settings:add_submenu(README)
	special_cargo_vip_settings_n:add_action("                   Start Solo Session:", null)
	special_cargo_vip_settings_n:add_action("        Use if you aren't alone in session", null)
	special_cargo_vip_settings_n:add_action(SPACE, null)
	special_cargo_vip_settings_n:add_action("                   Disable CrateBack:", null)
	special_cargo_vip_settings_n:add_action(" Disables the return of crates after its sale", null)
	special_cargo_vip_settings_n:add_action(SPACE, null)
	special_cargo_vip_settings_n:add_action("                    Disable RP Gain:", null)
	special_cargo_vip_settings_n:add_action("           Disables earning experience", null)
	special_cargo_vip_settings_n:add_action(SPACE, null)
	special_cargo_vip_settings_n:add_action("                       Clean Office:", null)
	special_cargo_vip_settings_n:add_action("       Removes money from your office;", null)
	special_cargo_vip_settings_n:add_action("   to save the result, make one more sale", null)

	special_cargo_vip_manual = special_cargo_vip:add_submenu("Manual Mode")

	special_cargo_vip_man_delay = 0.5
	states.b23 					= true
	special_cargo_vip_manual:add_toggle("Default Delay (0.5s)", function()
		return states.b23
	end, function()
		states.b23 					= not states.b23
		states.i54 					= 0.5
		special_cargo_vip_man_delay = 0.5
	end)

	states.i54 = 0.5
	special_cargo_vip_manual:add_float_range("Custom Delay (s)", 0.1, 0.5, 5.0, function()
		return states.i54
	end, function(delay)
		if delay ~= 0.5 then
			states.b23 = false
		else
			states.b23 = true
		end
		states.i54 					= delay
		special_cargo_vip_man_delay = delay
	end)

	special_cargo_vip_manual:add_toggle("Cooldown Killer", function() return states.b24 end, function() states.b24 = not states.b24 toggle_special_cargo_vip_cd_killer(states.b24) end)

	special_cargo_vip_manual:add_array_item("⚠ Set Price", get_names_from_table(special_cargo_vip_prices), function()
		return states.i55
	end, function(price)
		states.i55 = price
		if price ~= 1 then
			set_special_cargo_vip_price(get_id_from_table(special_cargo_vip_prices, price - 1))
		end
	end)

	special_cargo_vip_manual:add_bare_item("", function()
		if states.i55 == 1 then
			return "Price per Crate: Not Selected"
		else
			return "Price per Crate: $" .. format_money(globals.get_int(SCVPg))
		end
	end, null, null, null)

	special_cargo_vip_manual:add_action("Instant Sell", function()
		globals.set_float(XMg, (special_cargo_vip_disable_rp) and 0 or 1)
		if special_cargo_vip_crate_back then
			if GCS:is_active() then
				stats_set_packed_bools(32359, 32363, true)
			end
		end
		GCS:set_int(SCVMTl, 7)
		sleep(special_cargo_vip_man_delay)
		GCS:set_int(SCVISl, 99999)
		sleep(3)
		set_special_cargo_vip_price(globals.get_int(SCVPg))
		GCS:set_int(SCVISl, 99999)
	end)

	special_cargo_vip_manual:add_action(SPACE, null)

	special_cargo_vip_manual_n = special_cargo_vip_manual:add_submenu(README)
	special_cargo_vip_manual_n:add_action("                      Custom Delay:", null)
	special_cargo_vip_manual_n:add_action("  Change this if you aren't getting money", null)
	special_cargo_vip_manual_n:add_action(SPACE, null)
	special_cargo_vip_manual_n:add_action("                        Instant Sell:", null)
	special_cargo_vip_manual_n:add_action("        Always choose to sell one crate;", null)
	special_cargo_vip_manual_n:add_action("      start the sale mission first, activate", null)
	special_cargo_vip_manual_n:add_action("            after leaving the warehouse", null)
	special_cargo_vip_manual_n:add_action(SPACE, null)
	special_cargo_vip_manual_n:add_action("   ⚠ - means that the option is unsafe and", null)
	special_cargo_vip_manual_n:add_action("             using it might result in ban", null)
end

function create_cheap_loop_submenu()
	cheap_loop_delay = 3.0
	states.b25 		 = true
	cheap_loop:add_toggle("Default Delay (3s)", function()
		return states.b25
	end, function()
		states.b25 		 = not states.b25
		states.i56 		 = 3.0
		cheap_loop_delay = 3.0
	end)

	states.i56 = 3.0
	cheap_loop:add_float_range("Custom Delay (s)", 0.1, 1.0, 5.0, function()
		return states.i56
	end, function(delay)
		if delay ~= 3.0 then
			states.b25 = false
		else
			states.b25 = true
		end
		states.i56 		 = delay
		cheap_loop_delay = delay
	end)

	cheap_loop_r_cash  = 0
	states.i57 		   = 0
	cheap_loop:add_int_range("Required Chips (0 = inf)", 50000, 0, INT_MAX, function()
		return states.i57
	end, function(cash)
		states.i57 		   = cash
		cheap_loop_r_cash  = cash
		cheap_loop_m_count = 0
	end)

	cheap_loop_m_made  = 0
	cheap_loop_m_count = 0
	cheap_loop:add_toggle("5k chips (AFK)", function() return states.b26 end, function() states.b26 = not states.b26 toggle_cheap_loop_afk() end)

	cheap_loop:add_bare_item("", function()
		return "Chips Made: " .. format_money((cheap_loop_m_made ~= 0) and cheap_loop_m_made .. "000" or cheap_loop_m_made)
	end, null, null, null)

	cheap_loop:add_action(SPACE, null)

	cheap_loop_n = cheap_loop:add_submenu(README)
	cheap_loop_n:add_action("                     Required Cash:", null)
	cheap_loop_n:add_action("     Choose amount of money you want", null)
	cheap_loop_n:add_action("               to get with AFK mode", null)
	cheap_loop_n:add_action(SPACE, null)
	cheap_loop_n:add_action("                        Chips Made:", null)
	cheap_loop_n:add_action("     Reselect the option to see the result;", null)
	cheap_loop_n:add_action("       works better with «Default» delay", null)
end

function create_death_loop_submenu()
	death_loop_delay = 1.0
	states.b27 		 = true
	death_loop:add_toggle("Default Delay (1s)", function()
		return states.b27
	end, function()
		states.b27 		 = not states.b27
		states.i58 		 = 1.0
		death_loop_delay = 1.0
	end)

	death_loop:add_float_range("Custom Delay (s)", 0.1, 0.3, 5.0, function()
		return states.i58
	end, function(delay)
		if delay ~= 1.0 then
			states.b27 = false
		else
			states.b27 = true
		end
		states.i58 		 = delay
		death_loop_delay = delay
	end)

	death_loop_r_cash = 0
	states.i59 		  = 0
	death_loop:add_int_range("Required Cash (0 = inf)", 100000, 0, INT_MAX, function()
		return states.i59
	end, function(cash)
		states.i59 		   = cash
		death_loop_r_cash  = cash
		death_loop_m_count = 0
	end)

	death_loop_m_made  = 0
	death_loop_m_count = 0
	death_loop:add_toggle("$50k (AFK)", function() return states.b28 end, function() states.b28 = not states.b28 toggle_death_loop_afk() end)

	death_loop:add_bare_item("", function()
		return "Money Made: $" .. format_money((death_loop_m_made ~= 0) and death_loop_m_made .. "0000" or death_loop_m_made)
	end, null, null, null)

	death_loop:add_action(SPACE, null)

	death_loop_n = death_loop:add_submenu(README)

	death_loop_n:add_action("                     Required Cash:", null)
	death_loop_n:add_action("     Choose amount of money you want", null)
	death_loop_n:add_action("               to get with AFK mode", null)
	death_loop_n:add_action(SPACE, null)
	death_loop_n:add_action("                       Money Made:", null)
	death_loop_n:add_action("     Reselect the option to see the result;", null)
	death_loop_n:add_action("       works better with «Default» delay", null)
end

function create_night_loop_submenu()
	night_loop_delay = 1.0
	states.b29 		 = true
	night_loop:add_toggle("Default Delay (1s)", function()
		return states.b29
	end, function()
		states.b29 		 = not states.b29
		states.i60 		 = 1.0
		night_loop_delay = 1.0
	end)

	night_loop:add_float_range("Custom Delay (s)", 0.1, 1.0, 5.0, function()
		return states.i60
	end, function(delay)
		if delay ~= 1.0 then
			states.b29 = false
		else
			states.b29 = true
		end
		states.i60 		 = delay
		night_loop_delay = delay
	end)

	night_loop_r_cash  = 0
	states.i61 		   = 0
	night_loop:add_int_range("Required Cash (0 = inf)", 300000, 0, INT_MAX, function()
		return states.i61
	end, function(cash)
		states.i61 		   = cash
		night_loop_r_cash  = cash
		night_loop_m_count = 0
	end)

	night_loop_m_made  = 0
	night_loop_m_count = 0
	night_loop:add_toggle("$300k (AFK)", function() return states.b30 end, function() states.b30 = not states.b30 toggle_night_loop_afk() end)

	night_loop:add_bare_item("", function()
		return "Money Made: $" .. format_money((night_loop_m_made ~= 0) and night_loop_m_made .. "00000" or night_loop_m_made)
	end, null, null, null)

	night_loop:add_action(SPACE, null)

	night_loop_n = night_loop:add_submenu(README)
	night_loop_n:add_action("  Come inside your nightclub and activate", null)
	night_loop_n:add_action(SPACE, null)
	night_loop_n:add_action("                       Custom Delay:", null)
	night_loop_n:add_action("  Change this if you aren't getting money", null)
	night_loop_n:add_action(SPACE, null)
	night_loop_n:add_action("                     Required Cash:", null)
	night_loop_n:add_action("     Choose amount of money you want", null)
	night_loop_n:add_action("               to get with AFK mode", null)
	night_loop_n:add_action(SPACE, null)
	night_loop_n:add_action("                       Money Made:", null)
	night_loop_n:add_action("     Reselect the option to see the result;", null)
	night_loop_n:add_action("       works better with «Default» delay", null)
end

function create_op_loop_submenu()
	op_loop_delay = 1.0
	states.b31	  = true
	op_loop:add_toggle("Default Delay (1s)", function()
		return states.b31
	end, function()
		states.b31    = not states.b31
		states.i62    = 1.0
		op_loop_delay = 1.0
	end)

	op_loop:add_float_range("Custom Delay (s)", 0.1, 0.3, 5.0, function()
		return states.i62
	end, function(delay)
		if delay ~= 1.0 then
			states.b31 = false
		else
			states.b31 = true
		end
		states.i62    = delay
		op_loop_delay = delay
	end)

	op_loop_r_cash = 0
	states.i63     = 0
	op_loop:add_int_range("Required Cash (0 = inf)", 1000000, 0, INT_MAX, function()
		return states.i63
	end, function(cash)
		states.i63 		= cash
		op_loop_r_cash  = cash
		op_loop_m_count = 0
	end)

	op_loop_m_made = 0
	op_loop_m_count = 0
	op_loop:add_toggle("$180k (AFK)", function() return states.b32 end, function() states.b32 = not states.b32 toggle_op_loop_afk() end)

	op_loop:add_bare_item("", function()
		return "Money Made: $" .. format_money((op_loop_m_made ~= 0) and op_loop_m_made .. "0000" or op_loop_m_made)
	end, null, null, null)

	op_loop:add_action(SPACE, null)

	op_loop_n = op_loop:add_submenu(README)
	op_loop_n:add_action("                     Required Cash:", null)
	op_loop_n:add_action("     Choose amount of money you want", null)
	op_loop_n:add_action("               to get with AFK mode", null)
	op_loop_n:add_action(SPACE, null)
	op_loop_n:add_action("                       Money Made:", null)
	op_loop_n:add_action("     Reselect the option to see the result;", null)
	op_loop_n:add_action("       works better with «Default» delay", null)
end

function create_orbital_loop_submenu()

	orbital_loop_warn = false
	orbital_loop:add_toggle("⚠ I Know What I'm Doing", function() return orbital_loop_warn end, function() orbital_loop_warn = not orbital_loop_warn end)

	orbital_loop_delay = 30
	orbital_loop:add_bare_item("", function()
		local status = (orbital_loop_delay == 30) and "Ready" or orbital_loop_delay .. "s"
		return "Give $500k |〔" .. status .. "〕"
	end, function()
		if localplayer ~= nil and orbital_loop_warn and orbital_loop_delay == 30 then
			globals.set_int(ORg, 1)
			sleep(3)
			globals.set_int(ORg, 0)
			sleep(1)
			orbital_loop_delay = 29
			while orbital_loop_delay ~= 0 do
				sleep(1)
				orbital_loop_delay = orbital_loop_delay - 1
			end
			orbital_loop_delay = 30
		end
	end, null, null)

	orbital_loop:add_toggle("$500k (AFK)", function() return states.b33 end, function() states.b33 = not states.b33 toggle_orbital_loop_afk() end)

	orbital_loop:add_action(SPACE, null)

	orbital_loop_n = orbital_loop:add_submenu(README)
	orbital_loop_n:add_action("   ⚠ - means that the option is unsafe and", null)
	orbital_loop_n:add_action("             using it might result in ban", null)
end

function create_money_tool_submenu()
	create_bunker_crash_submenu()
	create_casino_master_submenu()
	create_hangar_cargo_vip_submenu()
	create_money_editor_submenu()
	create_nightclub_helper_submenu()
	create_special_cargo_vip_submenu()
	create_cheap_loop_submenu()
	create_death_loop_submenu()
	create_night_loop_submenu()
	create_op_loop_submenu()
	create_orbital_loop_submenu()
end

--Unlock Tool Implementation--

function create_achievements_submenu()
	char_stats_achivs = char_stats:add_submenu("Achievements")

	char_stats_achivs1b1 = char_stats_achivs:add_submenu("Unlock One By One")

	for i = 1, 77 do
		char_stats_achivs1b1:add_action(achievements[i], function() globals.set_int(AUg, i) end)
	end

	char_stats_achivs:add_toggle("Unlock All", function() return states.b34 end, function() states.b34 = not states.b34 toggle_achievement_unlocker_loop() end)

	char_stats_achivs:add_action(SPACE, null)

	char_stats_achivs_n = char_stats_achivs:add_submenu(README)
	char_stats_achivs_n:add_action("                         Unlock All:", null)
	char_stats_achivs_n:add_action("  Unlocks all achievements auto; ≈10 mins", null)
end

function create_awards_submenu()
	char_stats_awards = char_stats:add_submenu("Awards")

	char_stats_awards1b1 = char_stats_awards:add_submenu("Unlock One By One")

	char_stats_awards1b1:add_action("Victory", function()
		unlock_awards_victory1(100, 50, 25, 10)
		unlock_awards_victory2(1500, 800, 750, 500, 250, 3593, 1002)
		unlock_awards_victory3(true)
	end)

	char_stats_awards1b1:add_action("General", function()
		unlock_awards_general1(50000, 500, 200, 100, 50, 25)
		unlock_awards_general2(100, 25, 1598)
		unlock_awards_general3(true)
	end)

	char_stats_awards1b1:add_action("Weapons", function() unlock_awards_weapons(1000, -1) end)

	char_stats_awards1b1:add_action("Crimes", function() unlock_awards_crimes(32698547, 18000000, 5000, 4500, 4000, 3593, 1002, 1000, 833, 800, 700, 650, 500, 300, 168, 138, 120, 100, 98, 50, 48, 28, 25, 20, 10) end)

	char_stats_awards1b1:add_action("Vehicles", function()
		unlock_awards_vehicles1(2069146067, 1000, 500, 100, 50, 30, 25, 20, 5, 4, -1)
		unlock_awards_vehicles2(true)
	end)

	char_stats_awards1b1:add_action("Combat", function()
		unlock_awards_combat1(10000, 1000, 900, 700, 500, 499, 100, 50, 25)
		unlock_awards_combat2(true)
	end)

	char_stats_awards1b1:add_action("Heists", function()
		unlock_awards_heists1(50, 25, -1)
		unlock_awards_heists2(25, -1, true)
		unlock_awards_heists3(true)
	end)

	char_stats_awards1b1:add_action("Doomsday", function()
		for i = 16, 48, 8 do
			stats.set_masked_int(MPX() .. "DLCSMUGCHARPSTAT_INT260", 3, i, 8)
		end
		unlock_awards_dday1(10, -1, -229384)
		unlock_awards_dday2(100, true)
		unlock_awards_dday3(true)
	end)

	char_stats_awards1b1:add_action("After Hours", function()
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT380", 20, 0, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 50, 8, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 100, 16, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 20, 24, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 80, 32, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 60, 40, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 40, 48, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 10, 56, 8)
		unlock_awards_ahours1(20721002, 5721002, 3600000, 784672, 507822, 1001, 1000, 700, 200, 120, 100, 20, 4, -1)
		unlock_awards_ahours2(true)
	end)

	char_stats_awards1b1:add_action("Arena War", function()
		stats.set_masked_int(MPX() .. "ARENAWARSPSTAT_INT", 1, 35, 8)
		unlock_awards_arena_war1(86400000, 5055000, 1000000, 61000, 55000, 1000, 500, 200, 100, 50, 20, 0, -1)
		unlock_awards_arena_war2(true)
	end)

	char_stats_awards1b1:add_action("Diamond Casino n Resort", function()
		unlock_awards_dcasino_resort1(50, 5, -1)
		unlock_awards_dcasino_resort2(true)
	end)

	char_stats_awards1b1:add_action("Diamond Casino Heist", function()
		unlock_awards_dcasino1(3000000, 1000000, 950000, 100000, 40000, 100, 50, 40, 20, -1)
		unlock_awards_dcasino2(true)
	end)

	char_stats_awards1b1:add_action("Arcade", function()
		set_awards_arcade_scgw_init(69644, 50333, 63512, 46136, 21638, 2133, 1215, 2444, 38023, 2233)
		set_awards_arcade_footage_init(0, 64, 8457, 91275, 53260, 78663, 25103, 102401, 12672, 74380)
		set_awards_arcade_footage_score(284544, 275758, 100000, 90000, 80000, 70000, 60000, 50000, 40000, 30000)
		unlock_awards_arcade1(69644, INT_MAX + 1, 3000000, 1000000, 950000, 100000, 40000, 50, 40, 20, -1)
		unlock_awards_arcade2(true)
	end)

	char_stats_awards1b1:add_action("LS Summer Special", function()
		stats.set_masked_int(MPX() .. "SU20PSTAT_INT", 1, 35, 8)
		unlock_awards_sspecial(true)
	end)

	char_stats_awards1b1:add_action("Cayo Perico", function()
		unlock_awards_cayo_perico1(1000000000, 1800000, 1000000, 500000, 100, 80, -1)
		unlock_awards_cayo_perico2(true)
	end)

	char_stats_awards1b1:add_action("LS Tuners", function()
		unlock_awards_tuners1(240, 100, 50, 40)
		unlock_awards_tuners2(true)
	end)

	char_stats_awards1b1:add_action("Contract", function()
		unlock_awards_contract1(19734860, 510, 85, 60, 50, 10, -1)
		unlock_awards_contract2(true)
	end)

	char_stats_awards1b1:add_action("LS Drug Wars", function()
		unlock_awards_drug_wars1(50, 5)
		unlock_awards_drug_wars2(true)
	end)

	char_stats_awards1b1:add_action("Chop Shop", function()
		unlock_awards_chop_shop1(5000000, 100, 50)
		unlock_awards_chop_shop2(true)
	end)

	char_stats_awards:add_action("Unlock All", function()
		for i = 16, 48, 8 do
			stats.set_masked_int(MPX() .. "DLCSMUGCHARPSTAT_INT260", 3, i, 8)
		end
		stats.set_masked_int(MPX() .. "SU20PSTAT_INT", 1, 35, 8)
		stats.set_masked_int(MPX() .. "ARENAWARSPSTAT_INT", 1, 35, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT380", 20, 0, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 50, 8, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 100, 16, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 20, 24, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 80, 32, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 60, 40, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 40, 48, 8)
		stats.set_masked_int(MPX() .. "BUSINESSBATPSTAT_INT379", 10, 56, 8)
		unlock_awards_victory1(100, 50, 25, 10)
		unlock_awards_victory2(1500, 800, 750, 500, 250, 3593, 1002)
		unlock_awards_victory3(true)
		unlock_awards_general1(50000, 500, 200, 100, 50, 25)
		unlock_awards_general2(100, 25, 1598)
		unlock_awards_general3(true)
		unlock_awards_weapons(1000, -1)
		unlock_awards_crimes(32698547, 18000000, 5000, 4500, 4000, 3593, 1002, 1000, 833, 800, 700, 650, 500, 300, 168, 138, 120, 100, 98, 50, 48, 28, 25, 20, 10)
		unlock_awards_vehicles1(2069146067, 1000, 500, 100, 50, 30, 25, 20, 5, 4, -1)
		unlock_awards_vehicles2(true)
		unlock_awards_combat1(10000, 1000, 900, 700, 500, 499, 100, 50, 25)
		unlock_awards_combat2(true)
		unlock_awards_heists1(50, 25, -1)
		unlock_awards_heists2(25, -1, true)
		unlock_awards_heists3(true)
		unlock_awards_dday1(10, -1, -229384)
		unlock_awards_dday2(100, true)
		unlock_awards_dday3(true)
		unlock_awards_ahours1(20721002, 5721002, 3600000, 784672, 507822, 1001, 1000, 700, 200, 120, 100, 20, 4, -1)
		unlock_awards_ahours2(true)
		unlock_awards_arena_war1(86400000, 5055000, 1000000, 61000, 55000, 1000, 500, 200, 100, 50, 20, 0, -1)
		unlock_awards_arena_war2(true)
		unlock_awards_dcasino_resort1(50, 5, -1)
		unlock_awards_dcasino_resort2(true)
		unlock_awards_dcasino1(3000000, 1000000, 950000, 100000, 40000, 100, 50, 40, 20, -1)
		unlock_awards_dcasino2(true)
		set_awards_arcade_scgw_init(69644, 50333, 63512, 46136, 21638, 2133, 1215, 2444, 38023, 2233)
		set_awards_arcade_footage_init(0, 64, 8457, 91275, 53260, 78663, 25103, 102401, 12672, 74380)
		set_awards_arcade_footage_score(284544, 275758, 100000, 90000, 80000, 70000, 60000, 50000, 40000, 30000)
		unlock_awards_arcade1(69644, INT_MAX + 1, 3000000, 1000000, 950000, 100000, 40000, 50, 40, 20, -1)
		unlock_awards_arcade2(true)
		unlock_awards_sspecial(true)
		unlock_awards_cayo_perico1(1000000000, 1800000, 1000000, 500000, 100, 80, -1)
		unlock_awards_cayo_perico2(true)
		unlock_awards_tuners1(240, 100, 50, 40)
		unlock_awards_tuners2(true)
		unlock_awards_contract1(19734860, 510, 85, 60, 50, 10, -1)
		unlock_awards_contract2(true)
		unlock_awards_drug_wars1(50, 5)
		unlock_awards_drug_wars2(true)
		unlock_awards_chop_shop1(5000000, 100, 50)
		unlock_awards_chop_shop2(true)
	end)

	char_stats_awards:add_action("Reset All",function()
		unlock_awards_victory1(0, 0, 0, 0)
		unlock_awards_victory2(0, 0, 0, 0, 0, 0, 0)
		unlock_awards_victory3(false)
		unlock_awards_general1(0, 0, 0, 0, 0, 0)
		unlock_awards_general2(0, 0, 0)
		unlock_awards_general3(false)
		unlock_awards_weapons(0, 0)
		unlock_awards_crimes(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		unlock_awards_vehicles1(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		unlock_awards_vehicles2(false)
		unlock_awards_combat1(0, 0, 0, 0, 0, 0, 0, 0, 0)
		unlock_awards_combat2(false)
		unlock_awards_heists1(0, 0, 0)
		unlock_awards_heists2(0, 0, false)
		unlock_awards_heists3(false)
		unlock_awards_dday1(0, 0, 0)
		unlock_awards_dday2(0, false)
		unlock_awards_ahours1(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		unlock_awards_ahours2(false)
		unlock_awards_arena_war1(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		unlock_awards_arena_war2(false)
		unlock_awards_dcasino_resort1(0, 0, 0)
		unlock_awards_dcasino_resort2(false)
		unlock_awards_dcasino1(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		unlock_awards_dcasino2(false)
		set_awards_arcade_scgw_init(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		set_awards_arcade_footage_init(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		set_awards_arcade_footage_score(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		unlock_awards_arcade1(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
		unlock_awards_arcade2(false)
		unlock_awards_sspecial(false)
		unlock_awards_cayo_perico1(0, 0, 0, 0, 0, 0,0)
		unlock_awards_cayo_perico2(false)
		unlock_awards_tuners1(0, 0, 0, 0)
		unlock_awards_tuners2(false)
		unlock_awards_contract1(0, 0, 0, 0, 0, 0, 0)
		unlock_awards_contract2(false)
		unlock_awards_drug_wars1(0, 0)
		unlock_awards_drug_wars2(false)
		unlock_awards_chop_shop1(0, 0, 0)
		unlock_awards_chop_shop2(false)
	end)

	char_stats_awards:add_action(SPACE, null)

	char_stats_awards_n = char_stats_awards:add_submenu(README)
	char_stats_awards_n:add_action("    	 Unlocking «After Hours» awards will ", null)
	char_stats_awards_n:add_action("  cause a transaction error multiple times;", null)
	char_stats_awards_n:add_action("        some awards can be temporarily", null)
end

function create_characterteristics_submenu()
	char_stats_chars = char_stats:add_submenu("Characteristics")

	char_stats_chars:add_toggle("Max Stats", function()
		for i = 1, #char_stats_skills do
			if stats.get_int(MPX() .. char_stats_skills[i].skill) ~= 100 then
				return false
			end
		end
		return true
	end, function()
		for i = 1, #char_stats_skills do
			stats.set_int(MPX() .. "SCRIPT_INCREASE_" .. char_stats_skills[i].increase, 100)
		end
	end)

	char_stats_chars:add_toggle("Fast Run n Reload", function() return states.b35 end, function() states.b35 = not states.b35 toggle_fast_run_n_reload(states.b35) end)

	for _, skill in ipairs(char_stats_skill_labels) do
		char_stats_chars:add_bare_item("", function()
			return skill.label .. get_char_skill_status(skill.stat, skill.labels)
		end, null, null, null)
	end

	char_stats_chars:add_float_range("Mental State", 5.0, 0.0, 100.0, function()
		return stats.get_float(MPX() .. "PLAYER_MENTAL_STATE")
	end, function(state)
		stats.set_float(MPX() .. "PLAYER_MENTAL_STATE", state)
	end)

	char_stats_chars:add_action(SPACE, null)

	char_stats_chars_n = char_stats_chars:add_submenu(README)
	char_stats_chars_n:add_action("                  Fast Run n Reload:", null)
	char_stats_chars_n:add_action("      Change session to apply the result", null)
end

function create_collectibles_submenu()
	char_stats_cols = char_stats:add_submenu("Collectibles")

	char_stats_t_cols = char_stats_cols:add_submenu("Unlock All (Temp. + No Rewards)")

	char_stats_t_cols:add_bare_item("", function() return get_char_collectible("Action Figures", AFo, 100) end, function() globals.set_int(AFo, 100) end, null, null)
	char_stats_t_cols:add_bare_item("", function() return get_char_collectible("LD Organics", LDOo, 100) end, function() globals.set_int(LDOo, 100) end, null, null)
	char_stats_t_cols:add_bare_item("", function() return get_char_collectible("Playing Cards", PCo, 54) end, function() globals.set_int(PCo, 54) end, null, null)
	char_stats_t_cols:add_bare_item("", function() return get_char_collectible("Signal Jammers", SJo, 50) end, function() globals.set_int(SJo, 50) end, null, null)
	char_stats_t_cols:add_bare_item("", function() return get_char_collectible("Snowmen", So, 25) end, function() globals.set_int(So, 25) end, null, null)
	char_stats_t_cols:add_bare_item("", function() return get_char_collectible("Movie Props", MPo, 10) end, function() globals.set_int(MPo, 10) end, null, null)

	char_stats_p_cols = char_stats_cols:add_submenu("Unlock All (Temp. + Rewards)")

	char_stats_p_cols:add_bare_item("", function() return get_char_collectible("Action Figures", AFo, 100) end, function() globals.set_int(AFo, 99) end, null, null)
	char_stats_p_cols:add_bare_item("", function() return get_char_collectible("LD Organics", LDOo, 100) end, function() globals.set_int(LDOo, 99) end, null, null)
	char_stats_p_cols:add_bare_item("", function() return get_char_collectible("Playing Cards", PCo, 54) end, function() globals.set_int(PCo, 53) end, null, null)
	char_stats_p_cols:add_bare_item("", function() return get_char_collectible("Signal Jammers", SJo, 50) end, function() globals.set_int(SJo, 49) end, null, null)
	char_stats_p_cols:add_bare_item("", function() return get_char_collectible("Snowmen", So, 25) end, function() globals.set_int(So, 24) end, null, null)
	char_stats_p_cols:add_bare_item("", function() return get_char_collectible("Movie Props", MPo, 10) end, function() globals.set_int(MPo, 9) end, null, null)

	char_stats_p_cols_jol = char_stats_p_cols:add_submenu("Jack O' Lantern")

	char_stats_p_cols_jol:add_array_item("Unlock", get_names_from_table(char_stats_lanterns), function()
		return states.i64
	end, function(unlock)
		states.i64 = unlock
		if unlock ~= 1 then
			globals.set_int(JOLo, get_id_from_table(char_stats_lanterns, unlock - 1))
		end
	end)

	char_stats_p_cols_jol:add_int_range("Set Jack O' Lanterns", 1, 0, 200, function()
		return globals.get_int(JOLo)
	end, function(value)
		globals.set_int(JOLo, value)
	end)

	char_stats_p_cols_jol:add_action(SPACE, null)

	char_stats_p_cols_jol_n = char_stats_p_cols_jol:add_submenu(README)
	char_stats_p_cols_jol_n:add_action("     First, find the item you want, select", null)
	char_stats_p_cols_jol_n:add_action("    an option, and then pick up the item", null)

	char_stats_p_cols:add_action(SPACE, null)

	char_stats_p_cols_n = char_stats_p_cols:add_submenu(README)
	char_stats_p_cols_n:add_action("     First, find the item you want, select", null)
	char_stats_p_cols_n:add_action("    an option, and then pick up the item", null)
end

function create_crew_rank_submenu()
	char_stats_crew_rank = char_stats:add_submenu("Crew Rank")

	char_stats_crew_rank:add_bare_item("", function()
		local crew_rank = (localplayer ~= nil) and stats.get_int("MPPLY_CURRENT_CREW_RANK") or "In Menu"
		return "Current Crew Rank: " .. crew_rank
	end, null, null, null)

	for i = 21, 24 do
		char_stats_crew_rank:add_array_item("Number #" .. i - 20, list_0_9, function()
			return def_num_curs[i]
		end, function(number)
			def_nums[i] 	= list_0_9[number]
			def_num_curs[i] = number
		end)
	end

	char_stats_crew_rank:add_bare_item("", function()
		new_crew_rank = tonumber((def_nums[21] == 0) and def_nums[22] .. def_nums[23] .. def_nums[24] or def_nums[21] .. def_nums[22] .. def_nums[23] .. def_nums[24])
		if new_crew_rank == 0 then
			new_crew_rank = "Not Selected"
		elseif new_crew_rank > 8000 then
			new_crew_rank = 8000
		end
		return "Set Crew Rank: " .. new_crew_rank
	end, function()
		if new_crew_rank ~= "Not Selected" then
			for i = 0, 4 do
				stats.set_int("MPPLY_CREW_LOCAL_XP_" .. i, convert_rank_to_rp(new_crew_rank))
			end
			if states.b36 then
				sleep(1)
				reset_def_nums(21, 24, 1)
			end
		end
	end, null, null)

	states.b36 = true
	char_stats_crew_rank:add_toggle("Reset Value", function() return states.b36 end, function() states.b36 = not states.b36 end)

	char_stats_crew_rank:add_action(SPACE, null)

	char_stats_crew_rank_n = char_stats_crew_rank:add_submenu(README)
	char_stats_crew_rank_n:add_action("     Select one of five crews and set rank;", null)
	char_stats_crew_rank_n:add_action(" you may need to change session to apply", null)
	char_stats_crew_rank_n:add_action(SPACE, null)
	char_stats_crew_rank_n:add_action("                        Reset Value:", null)
	char_stats_crew_rank_n:add_action("  Resets «Set Crew Rank» value after using", null)
end

function create_rank_submenu()
	char_stats_rank = char_stats:add_submenu("Rank")

	char_stats_rank:add_bare_item("", function()
		local rank = (localplayer ~= nil) and stats.get_int(MPX() .. "CHAR_RANK_FM") or "In Menu"
		return "Current Rank: " .. rank
	end, null, null, null)

	for i = 25, 28 do
		char_stats_rank:add_array_item("Number #" .. i - 24, list_0_9, function()
			return def_num_curs[i]
		end, function(number)
			def_nums[i]		= list_0_9[number]
			def_num_curs[i] = number
		end)
	end

	char_stats_rank:add_bare_item("", function()
		new_rank = tonumber((def_nums[25] == 0) and def_nums[26] .. def_nums[27] .. def_nums[28] or def_nums[25] .. def_nums[26] .. def_nums[27] .. def_nums[28])
		if new_rank == 0 then
			new_rank = "Not Selected"
		elseif new_rank > 8000 then
			new_rank = 8000
		end
		return "Set Rank: " .. new_rank
	end, function()
		if new_rank ~= "Not Selected" then
			stats.set_int(MPX() .. "CHAR_SET_RP_GIFT_ADMIN", convert_rank_to_rp(new_rank))
			if states.b38 then
				stats.set_int("MPPLY_GLOBALXP", convert_rank_to_rp(new_rank))
			end
			if not states.b39 then
				sleep(1)
				change_session(8)
			end
			if states.b37 then
				sleep(1)
				reset_def_nums(25, 28, 1)
			end
		end
	end, null, null)

	states.b37 = true
	char_stats_rank:add_toggle("Reset Value", function() return states.b37 end, function() states.b37 = not states.b37 end)

	char_stats_rank:add_toggle("Change Global RP Stat", function() return states.b38 end, function() states.b38 = not states.b38 end)

	char_stats_rank:add_toggle("Fix Story Mode Issue", function() return states.b39 end, function() states.b39 = not states.b39 end)

	char_stats_rank:add_action(SPACE, null)

	char_stats_rank_n = char_stats_rank:add_submenu(README)
	char_stats_rank_n:add_action("                        Reset Value:", null)
	char_stats_rank_n:add_action("      Resets «Set Rank» value after using", null)
	char_stats_rank_n:add_action(SPACE, null)
	char_stats_rank_n:add_action("                 Fix Story Mode Issue:", null)
	char_stats_rank_n:add_action("   You'll need to change session manually", null)
end

function create_kd_changer_submenu()
	char_stats_kd = char_stats:add_submenu("K/D Changer")

	char_stats_kd:add_bare_item("", function()
		return "Current K/D Ratio: " .. stats.get_float("MPPLY_KILL_DEATH_RATIO")
	end, null, null, null)

	for i = 29, 38 do
		char_stats_kd:add_array_item("Number #" .. i - 28, list_0_9, function()
			return def_num_curs[i]
		end, function(number)
			def_nums[i] 	= list_0_9[number]
			def_num_curs[i] = number
		end)
	end

	char_stats_kd:add_bare_item("", function()
		kd_to_change = tonumber(def_nums[29] .. def_nums[30] .. def_nums[31] .. def_nums[32] .. def_nums[33] .. def_nums[34] .. def_nums[35] .. def_nums[36] .. def_nums[37] .. def_nums[38])
		if kd_to_change > INT_MAX then
			kd_to_change = INT_MAX
		end
		return "Set K/D Ratio: " .. kd_to_change
	end, function()
		stats.set_float("MPPLY_KILL_DEATH_RATIO", kd_to_change)
		stats.set_int("MPPLY_KILLS_PLAYERS", kd_to_change)
		stats.set_int("MPPLY_DEATHS_PLAYER", 0)
		if states.b40 then
			sleep(1)
			reset_def_nums(29, 38, 1)
		end
	end, null, null)

	states.b40 = true
	char_stats_kd:add_toggle("Reset Value", function() return states.b40 end, function() states.b40 = not states.b40 end)

	char_stats_kd_det_method = char_stats_kd:add_submenu("Detailed Method")

	char_stats_kd_det_method:add_bare_item("", function()
		return "Current K/D Ratio: " .. stats.get_float("MPPLY_KILL_DEATH_RATIO")
	end, null, null, null)

	kills = 0
	char_stats_kd_det_method:add_int_range("New Kills", 1, 0, INT_MAX, function()
		return kills
	end, function(new_kills)
		kills = new_kills
	end)

	deaths = 0
	char_stats_kd_det_method:add_int_range("New Deaths", 1, 0, INT_MAX, function()
		return deaths
	end, function(new_deaths)
		deaths = new_deaths
	end)

	char_stats_kd_det_method:add_bare_item("", function()
		new_kd = tonumber(string.format("%.2f", kills / deaths))
		if new_kd == nil then
			new_kd = 0.0
		end
		return "Set K/D Ratio: " .. new_kd
	end, function()
		stats.set_float("MPPLY_KILL_DEATH_RATIO", new_kd)
		stats.set_int("MPPLY_KILLS_PLAYERS", kills)
		stats.set_int("MPPLY_DEATHS_PLAYER", deaths)
		if states.b41 then
			kills  = 0
			deaths = 0
		end
	end, null, null)

	states.b41 = true
	char_stats_kd_det_method:add_toggle("Reset Value", function() return states.b41 end, function() states.b41 = not states.b41 end)

	char_stats_kd_det_method:add_action(SPACE, null)

	char_stats_kd_det_method_n = char_stats_kd_det_method:add_submenu(README)
	char_stats_kd_det_method_n:add_action("                        Reset Value:", null)
	char_stats_kd_det_method_n:add_action("  Resets «Set K/D Ratio» value after using", null)

	char_stats_kd:add_action(SPACE, null)

	char_stats_kd_n = char_stats_kd:add_submenu(README)
	char_stats_kd_n:add_action("                        Reset Value:", null)
	char_stats_kd_n:add_action("  Resets «Set K/D Ratio» value after using", null)
end

function create_char_stats_submenu()
	char_stats:add_toggle("Sex Changer", function() return states.b42 end, function() states.b42 = not states.b42 toggle_sex_changer(states.b42) end)

	char_stats:add_action(SPACE, null)

	char_stats_n = char_stats:add_submenu(README)
	char_stats_n:add_action("                       Sex Changer:", null)
	char_stats_n:add_action("     Unlocks «Change Sex» option while", null)
	char_stats_n:add_action("                editing your character", null)
end

function create_arena_war_submenu()
	fac_unlocks_arena_war = facilities_unlocks:add_submenu("Arena War")

	fac_unlocks_arena_war:add_action("Unlock All Vehicles (Temp.)", function() stats_set_packed_bools(24992, 24999, true) end)

	fac_unlocks_arena_war:add_action("Unlock Trade Prices for Headlights", function() stats_set_packed_bools(24980, 24991, true) end)

	fac_unlocks_arena_war:add_action("Unlock Trade Prices for Vehicles", function() stats_set_packed_bools(24963, 25109, true) end)

	local function set_arena_war_stats(tier, points)
		stats.set_int(MPX() .. "ARENAWARS_AP_TIER", tier)
		stats.set_int(MPX() .. "ARENAWARS_AP", points)
	end
	fac_unlocks_arena_war:add_array_item("Unlock Vehicle", get_names_from_table(arena_war_vehicles), function()
		return states.i65
	end, function(vehicle)
		states.i65 = vehicle
		if vehicle ~= 1 then
			local selected_vehicle = arena_war_vehicles[vehicle - 1]
			set_arena_war_stats(selected_vehicle.tier, selected_vehicle.points)
			if not states.b43 then
				sleep(1)
				change_session(8)
			end
		end
	end)

	fac_unlocks_arena_war:add_action("Suicide", function() menu.suicide_player() end)

	fac_unlocks_arena_war:add_toggle("Fix Story Mode Issue", function() return states.b43 end, function() states.b43 = not states.b43 end)

	fac_unlocks_arena_det_method = fac_unlocks_arena_war:add_submenu("Detailed Method")

	fac_unlocks_arena_det_method:add_int_range("Sponsorship Tier", 1, 0, 1000, function()
		return stats.get_int(MPX() .. "ARENAWARS_AP_TIER")
	end, function(tier)
		stats.set_int(MPX() .. "ARENAWARS_AP_TIER", tier)
	end)

	fac_unlocks_arena_det_method:add_int_range("Arena Points", 10, 0, 10040, function()
		return stats.get_int(MPX() .. "ARENAWARS_AP")
	end, function(points)
		stats.set_int(MPX() .. "ARENAWARS_AP", points)
	end)

	fac_unlocks_arena_det_method:add_action("Change Session", function() change_session(8) end)

	fac_unlocks_arena_war:add_action(SPACE, null)

	fac_unlocks_arena_war_n = fac_unlocks_arena_war:add_submenu(README)
	fac_unlocks_arena_war_n:add_action("                      Unlock Vehicle:", null)
	fac_unlocks_arena_war_n:add_action("       First, make the following settings:", null)
	fac_unlocks_arena_war_n:add_action("Join Next Mode from Spectator Box: Open", null)
	fac_unlocks_arena_war_n:add_action("                Allow Spectators: On", null)
	fac_unlocks_arena_war_n:add_action("                 Matchmaking: Open", null)
	fac_unlocks_arena_war_n:add_action("    select the vehicle you want to unlock;", null)
	fac_unlocks_arena_war_n:add_action("                        Navigate to:", null)
	fac_unlocks_arena_war_n:add_action("    Online -> Jobs -> Rockstar Created ->", null)
	fac_unlocks_arena_war_n:add_action("        -> Arena War -> Start Wreck It I", null)
	fac_unlocks_arena_war_n:add_action("       if you receive an Alert, press Enter;", null)
	fac_unlocks_arena_war_n:add_action("    wait for the carnage to begin, suicide", null)
	fac_unlocks_arena_war_n:add_action("     and spin the wheel until you get AP", null)
	fac_unlocks_arena_war_n:add_action(SPACE, null)
	fac_unlocks_arena_war_n:add_action("                 Fix Story Mode Issue:", null)
	fac_unlocks_arena_war_n:add_action("   You'll need to change session manually", null)
end

function create_bunker_submenu()
	fac_unlocks_bunker = facilities_unlocks:add_submenu("Bunker")

	fac_unlocks_bunker:add_toggle("Unlock All", function() return states.b44 end, function() states.b44 = not states.b44 toggle_bunker_unlocker_loop() end)

	fac_unlocks_bunker:add_action("Unlock Shooting Range Rewards", function()
		stats.set_int(MPX() .. "SR_HIGHSCORE_1", 690)
		stats.set_int(MPX() .. "SR_HIGHSCORE_2", 1860)
		stats.set_int(MPX() .. "SR_HIGHSCORE_3", 2690)
		stats.set_int(MPX() .. "SR_HIGHSCORE_4", 2660)
		stats.set_int(MPX() .. "SR_HIGHSCORE_5", 2650)
		stats.set_int(MPX() .. "SR_HIGHSCORE_6", 450)
		stats.set_int(MPX() .. "SR_TARGETS_HIT", 269)
		stats.set_int(MPX() .. "SR_WEAPON_BIT_SET", -1)
		stats.set_bool(MPX() .. "SR_TIER_1_REWARD", true)
		stats.set_bool(MPX() .. "SR_TIER_3_REWARD", true)
		stats.set_bool(MPX() .. "SR_INCREASE_THROW_CAP", true)
	end)

	fac_unlocks_bunker:add_action(SPACE, null)

	fac_unlocks_bunker_n = fac_unlocks_bunker:add_submenu(README)
	fac_unlocks_bunker_n:add_action("          Set staff equally, activate and", null)
	fac_unlocks_bunker_n:add_action(" then all researches will unlock one by one", null)
end

function create_lscm_submenu()
	fac_unlocks_lscm = facilities_unlocks:add_submenu("LS Car Meet")

	fac_unlocks_lscm:add_action("Unlock All", function() 
		for i = LSCMMg1, LSCMMg2 do
			globals.set_float(i, 99999.0)
		end
	end)

	fac_unlocks_lscm:add_action("Unlock Trade Prices for Headlights", function() stats_set_packed_bools(24980, 24991, true) end)

	fac_unlocks_lscm:add_action("Unlock Podium Prize", function()
		stats.set_bool(MPX() .. "CARMEET_PV_CHLLGE_CMPLT", true)
		stats.set_bool(MPX() .. "CARMEET_PV_CLMED", false)
	end)

	fac_unlocks_lscm:add_action(SPACE, null)

	fac_unlocks_lscmNote = fac_unlocks_lscm:add_submenu(README)

	fac_unlocks_lscmNote:add_action("                         Unlock All:", null)
	fac_unlocks_lscmNote:add_action("      Buy a membership, activate, sit in", null)
	fac_unlocks_lscmNote:add_action("          a test car and go to the track;", null)
	fac_unlocks_lscmNote:add_action("      if your level is not 1, then activate", null)
	fac_unlocks_lscmNote:add_action("    and buy something in the LSCM store;", null)
	fac_unlocks_lscmNote:add_action("   if you've used LS Tuners awards unlock", null)
	fac_unlocks_lscmNote:add_action(" before, all unlocks will be temporary only", null)
end

function create_lsc_submenu()
	fac_unlocks_lsc = facilities_unlocks:add_submenu("LS Customs")

	fac_unlocks_lsc:add_action("Unlock All", function()
		for i = 1, 7 do
			stats.set_int(MPX() .. "CHAR_FM_CARMOD_" .. i .. "_UNLCK", -1)
		end
		stats.set_int(MPX() .. "AWD_DROPOFF_CAP_PACKAGES", 100)
		stats.set_int(MPX() .. "AWD_KILL_CARRIER_CAPTURE", 100)
		stats.set_int(MPX() .. "NUMBER_SLIPSTREAMS_IN_RACE", 100)
		stats.set_int(MPX() .. "AWD_NIGHTVISION_KILLS", 100)
		stats.set_int(MPX() .. "AWD_WIN_CAPTURES", 50)
		stats.set_int(MPX() .. "AWD_FINISH_HEISTS", 50)
		stats.set_int(MPX() .. "AWD_FINISH_HEIST_SETUP_JOB", 50)
		stats.set_int(MPX() .. "AWD_RACES_WON", 50)
		stats.set_int(MPX() .. "AWD_WIN_LAST_TEAM_STANDINGS", 50)
		stats.set_int(MPX() .. "AWD_ONLY_PLAYER_ALIVE_LTS", 50)
		stats.set_int(MPX() .. "TOTAL_RACES_WON", 50)
		stats.set_int(MPX() .. "NUMBER_TURBO_STARTS_IN_RACE", 50)
		stats.set_int(MPX() .. "RACES_WON", 50)
		stats.set_int(MPX() .. "USJS_COMPLETED", 50)
		stats.set_int(MPX() .. "USJS_FOUND", 50)
		stats.set_int(MPX() .. "USJS_TOTAL_COMPLETED", 50)
		stats.set_int(MPX() .. "AWD_FM_GTA_RACES_WON", 50)
		stats.set_int(MPX() .. "AWD_FM_RACES_FASTEST_LAP", 50)
		stats.set_int(MPX() .. "AWD_FMBASEJMP", 25)
		stats.set_int(MPX() .. "AWD_FMWINAIRRACE", 25)
		stats.set_int(MPX() .. "AWD_FM_RACE_LAST_FIRST", 25)
		stats.set_int(MPX() .. "AWD_FMRALLYWONDRIVE", 25)
		stats.set_int(MPX() .. "AWD_FMRALLYWONNAV", 25)
		stats.set_int(MPX() .. "AWD_FMWINSEARACE", 25)
		stats.set_int(MPX() .. "MOST_FLIPS_IN_ONE_JUMP", 5)
		stats.set_int(MPX() .. "MOST_SPINS_IN_ONE_JUMP", 5)
	end)

	fac_unlocks_lsc:add_action("Enable Hidden Liveries", function()
		for i = 0, 20 do
			stats.set_int("MPPLY_XMASLIVERIES" .. i, -1)
		end
	end)

	fac_unlocks_lsc:add_action("Enable Taxi Liveries", function()
		stats.set_int(MPX() .. "AWD_TAXIDRIVER", 50)
		stats.set_masked_int(MPX() .. "DLC22022PSTAT_INT536", 10, 16, 8)
	end)

	fac_unlocks_lsc:add_action("Enable Xmas Plates", function() stats.set_int("MPPLY_XMAS23_PLATES0", -1) end)

	forge_model    = false
	old_forge_hash = 0
	fac_unlocks_lsc:add_toggle("Enable Forge Model", function()
		return forge_model
	end, function()
		forge_model = not forge_model
		if forge_model then
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				old_forge_hash = localplayer:get_current_vehicle():get_model_hash()
				localplayer:get_current_vehicle():set_model_hash(-1008861746)
			end
		else
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				localplayer:get_current_vehicle():set_model_hash(old_forge_hash)
			end
		end
	end)

	fac_unlocks_lsc_cus_mods = fac_unlocks_lsc:add_submenu("Custom Modifications")

	fac_unlocks_lsc_cus_wheels = fac_unlocks_lsc_cus_mods:add_submenu("Custom Wheels")

	f1_model    = false
	old_f1_hash = 0
	fac_unlocks_lsc_cus_wheels:add_toggle("F1 Wheels", function()
		return f1_model
	end, function()
		f1_model = not f1_model
		if f1_model then
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				old_f1_hash = localplayer:get_current_vehicle():get_model_hash()
				localplayer:get_current_vehicle():set_model_hash(1492612435)
			end
		else
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				localplayer:get_current_vehicle():set_model_hash(old_f1_hash)
			end
		end
	end)

	bennys_model    = false
	old_bennys_hash = 0
	fac_unlocks_lsc_cus_wheels:add_toggle("Benny's Wheels", function()
		return bennys_model
	end, function()
		bennys_model = not bennys_model
		if bennys_model then
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				old_bennys_model = localplayer:get_current_vehicle():get_model_hash()
				localplayer:get_current_vehicle():set_model_hash(196747873)
			end
		else
			if localplayer ~= nil and localplayer:is_in_vehicle() then
				localplayer:get_current_vehicle():set_model_hash(old_bennys_hash)
			end
		end
	end)

	fac_unlocks_lsc_cus_wheels:add_action(SPACE, null)

	fac_unlocks_lsc_cus_wheels_n = fac_unlocks_lsc_cus_wheels:add_submenu(README)

	fac_unlocks_lsc_cus_wheels_n:add_action("    Enable which feature you want to use", null)
	fac_unlocks_lsc_cus_wheels_n:add_action(" when you're in CEO Office Mod Shop and", null)
	fac_unlocks_lsc_cus_wheels_n:add_action("      disable after purchasing the wheels", null)

	fac_unlocks_lsc_cus_plate = fac_unlocks_lsc_cus_mods:add_submenu("Custom Plate")

	for i = 39, 46 do
		def_nums[i] = "."
		fac_unlocks_lsc_cus_plate:add_array_item("Symbol #" .. i - 38, number_plate_chars, function()
			return def_num_curs[i]
		end, function(number)
			def_nums[i] 	= number_plate_chars[number]
			def_num_curs[i] = number
		end)
	end

	fac_unlocks_lsc_cus_plate:add_bare_item("", function()
		local plate = ""
		for i = 39, 46 do
			plate = plate .. is_symbol_space(def_nums[i])
		end
		return "Apply Plate: " .. plate
	end, function()
		local new_plate = def_nums[21] .. def_nums[22] .. def_nums[23]  .. def_nums[24]  .. def_nums[25]  .. def_nums[26]  .. def_nums[27]  .. def_nums[28] 
		if localplayer ~= nil and localplayer:is_in_vehicle() then
			localplayer:get_current_vehicle():set_number_plate_text(new_plate)
		end
		if states.b45 then
			sleep(1)
			for i = 39, 46 do
				def_nums[i] = "."
			end
		end
	end, null, null)

	states.b45 = true
	fac_unlocks_lsc_cus_plate:add_toggle("Reset Value", function() return states.b45 end, function() states.b45 = not states.b45 end)

	fac_unlocks_lsc_cus_plate:add_action(SPACE, null)

	fac_unlocks_lsc_cus_plateNote = fac_unlocks_lsc_cus_plate:add_submenu(README)

	fac_unlocks_lsc_cus_plateNote:add_action("                        «.» = space;", null)
	fac_unlocks_lsc_cus_plateNote:add_action("      Use in LSC and buy a plate to save", null)
	fac_unlocks_lsc_cus_plateNote:add_action(SPACE, null)
	fac_unlocks_lsc_cus_plateNote:add_action("                        Reset Value:", null)
	fac_unlocks_lsc_cus_plateNote:add_action("    Resets «Apply Plate» value after using", null)

	fac_unlocks_lsc:add_action(SPACE, null)

	fac_unlocks_lscNote = fac_unlocks_lsc:add_submenu(README)

	fac_unlocks_lscNote:add_action("                         Unlock All:", null)
	fac_unlocks_lscNote:add_action("    Some colors might be temporary only", null)
end

function create_misc_submenu()
	misc:add_array_item("Bad Sport Label", get_names_from_table(bad_sport_labels), function()
		return states.i66
	end, function(label)
		if label ~= 1 then
			local selected_label = bad_sport_labels[label - 1]
			set_bad_sports(selected_label.value1, selected_label.value2, selected_label.value3)
		end
	end)

	misc:add_array_item("Get Supplies", misc_supplies, function()
		return states.i67
	end, function(supplies)
		if supplies ~= 1 then
			if supplies ~= 2 then
				globals.set_int(GSIg + (supplies - 2), 1)
			else
				globals_set_ints(GSIg + 1, GSIg + 7, 1, 1)
			end
		end
	end)

	misc:add_toggle("Enable Dripfeed Vehicles", function() return states.b46 end, function() states.b46 = not states.b46 toggle_dripfeed_vehicles(states.b46) end)

	misc:add_toggle("Enable Removed Vehicles", function() return states.b47 end, function() states.b47 = not states.b47 toggle_removed_vehicles(states.b47) end)

	misc:add_toggle("Hide Me", function() return states.b48 end, function() states.b48 = not states.b48 toggle_silent_n_sneaky() end)

	misc_ind_unlocks = misc:add_submenu("Individual Unlocks")

	misc_ind_unlocks:add_action("Unlock All Parachutes", function()
		stats_set_packed_bool(3609, true)
		stats_set_packed_bools(31791, 31796, true)
		stats_set_packed_bools(34378, 34379, true)
	end)

	misc_ind_unlocks:add_action("Unlock All Tattoos", function()
		for i = 0, 53 do
			stats.set_int(MPX() .. "TATTOO_FM_UNLOCKS_" .. i, -1)
		end
		stats.set_int(MPX() .. "TATTOO_FM_CURRENT_32", -1)
	end)

	misc_ind_unlocks:add_action("Unlock Diamond Casino Outfits", function() stats_set_packed_bools(28225, 28248, true) end)

	misc_ind_unlocks:add_action("Unlock Flight School Gold Medals", function()
			for i = 0, 9 do
				stats.set_int("MPPLY_PILOT_SCHOOL_MEDAL_" .. i , -1)
				stats.set_int(MPX() .. "PILOT_SCHOOL_MEDAL_" .. i, -1)
				stats.set_bool(MPX() .. "PILOT_ASPASSEDLESSON_" .. i, true)
			end
			stats.set_int("MPPLY_NUM_CAPTURES_CREATED", 100)
		end)

	misc_ind_unlocks:add_action("Unlock Trade Prices for Cop Cars", function()
		stats.set_int(MPX() .. "SALV23_GEN_BS", -1)
		stats.set_int(MPX() .. "SALV23_INST_PROG", -1)
		stats.set_int(MPX() .. "SALV23_SCOPE_BS", -1)
		stats.set_int(MPX() .. "MOST_TIME_ON_3_PLUS_STARS", 300000)
	end)

	misc_gunvan = misc:add_submenu("Modify Gun Van Weapons")

	misc_gunvan:add_action("Teleport to Gun Van", function()
		local location = globals.get_int(GVLg)
		teleport(gunvan_locations[location][1], gunvan_locations[location][2], gunvan_locations[location][3], 0, 0, 0)
	end)

	misc_gunvan_weaps = misc_gunvan:add_submenu("Weapons")

	weap_slot1 = misc_gunvan_weaps:add_submenu("1-slot")
	weap_slot2 = misc_gunvan_weaps:add_submenu("2-slot")
	weap_slot3 = misc_gunvan_weaps:add_submenu("3-slot")
	weap_slot4 = misc_gunvan_weaps:add_submenu("4-slot")
	weap_slot5 = misc_gunvan_weaps:add_submenu("5-slot")
	weap_slot6 = misc_gunvan_weaps:add_submenu("6-slot")
	weap_slot7 = misc_gunvan_weaps:add_submenu("7-slot")
	weap_slot8 = misc_gunvan_weaps:add_submenu("8-slot")
	weap_slot9 = misc_gunvan_weaps:add_submenu("9-slot")

	for i = 1, 86 do
		weap_slot1:add_toggle(gunvan_weapons[i].name, function()
			return (gunvan_weapons[i].hash == globals.get_int(GVWSg + 1)) and true or false
		end, function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 1, gunvan_weapons[i].hash)
		end)

		weap_slot2:add_toggle(gunvan_weapons[i].name, function()
			return (gunvan_weapons[i].hash == globals.get_int(GVWSg + 2)) and true or false
		end, function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 2, gunvan_weapons[i].hash)
		end)

		weap_slot3:add_toggle(gunvan_weapons[i].name, function()
			return (gunvan_weapons[i].hash == globals.get_int(GVWSg + 3)) and true or false
		end, function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 3, gunvan_weapons[i].hash)
		end)

		weap_slot4:add_toggle(gunvan_weapons[i].name, function()
			return (gunvan_weapons[i].hash == globals.get_int(GVWSg + 4)) and true or false
		end, function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 4, gunvan_weapons[i].hash)
		end)

		weap_slot5:add_toggle(gunvan_weapons[i].name, function()
			return (gunvan_weapons[i].hash == globals.get_int(GVWSg + 5)) and true or false
		end, function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 5, gunvan_weapons[i].hash)
		end)

		weap_slot6:add_toggle(gunvan_weapons[i].name, function()
			return (gunvan_weapons[i].hash == globals.get_int(GVWSg + 6)) and true or false
		end, function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 6, gunvan_weapons[i].hash)
		end)

		weap_slot7:add_toggle(gunvan_weapons[i].name, function()
				if gunvan_weapons[i].hash == globals.get_int(GVWSg + 7) then
					return true
				else
					return false
				end
		end, function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 7, gunvan_weapons[i].hash)
		end)

		weap_slot8:add_toggle(gunvan_weapons[i].name, function()
			return (gunvan_weapons[i].hash == globals.get_int(GVWSg + 8)) and true or false
		end, function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 8, gunvan_weapons[i].hash)
		end)

		weap_slot9:add_toggle(gunvan_weapons[i].name, function()
			return (gunvan_weapons[i].hash == globals.get_int(GVWSg + 9)) and true or false
		end, function()
			globals.set_int(GVSg, 0)
			globals.set_int(GVWSg + 9, gunvan_weapons[i].hash)
		end)
	end

	misc_gunvan_throws = misc_gunvan:add_submenu("Throwables")

	throw_slot1 = misc_gunvan_throws:add_submenu("1-slot")
	throw_slot2 = misc_gunvan_throws:add_submenu("2-slot")
	throw_slot3 = misc_gunvan_throws:add_submenu("3-slot")

	for i = 87, 93 do
		throw_slot1:add_toggle(gunvan_weapons[i].name, function()
			return (gunvan_weapons[i].hash == globals.get_int(GVTSg + 1)) and true or false
		end, function()
			globals.set_int(GVTSg + 1, gunvan_weapons[i].hash)
		end)

		throw_slot2:add_toggle(gunvan_weapons[i].name, function()
			return (gunvan_weapons[i].hash == globals.get_int(GVTSg + 2)) and true or false
		end, function()
			globals.set_int(GVTSg + 2, gunvan_weapons[i].hash)
		end)

		throw_slot3:add_toggle(gunvan_weapons[i].name, function()
			return (gunvan_weapons[i].hash == globals.get_int(GVTSg + 3)) and true or false
		end, function()
			globals.set_int(GVTSg + 3, gunvan_weapons[i].hash)
		end)
	end

	misc_gunvan:add_toggle("Jewish Trade Skills (-10%)", function() return states.b49 end, function() states.b49 = not states.b49 toggle_gunvan_discounts(states.b49) end)

	misc_weap_liveries = misc:add_submenu("Unlock Weapon Liveries")

	misc_weap_liveries:add_toggle("Bypass Locks", function() return states.b50 end, function() states.b50 = not states.b50 toggle_bypass_locks(states.b50) end)

	misc_weap_liveries:add_action("Dildodude Camo | Micro SMG", function() stats_set_packed_bool(36788, true) end)
	misc_weap_liveries:add_action("Dildodude Camo | Pump Shotgun", function() stats_set_packed_bool(36787, true) end)
	misc_weap_liveries:add_action("Employee of the Month Fin. | Micro SMG", function() stats_set_packed_bool(41657, true) end)
	misc_weap_liveries:add_action("Santa's Helper Finish | Heavy Sniper", function() stats_set_packed_bool(42069, true) end)
	misc_weap_liveries:add_action("Season's Greetings | Pistol Mk II", function() stats_set_packed_bool(36786, true) end)
	misc_weap_liveries:add_action("Skull Santa Finish | Special Carbine", function() stats_set_packed_bool(42122, true) end)
	misc_weap_liveries:add_action("Snowman Finish | Combat Pistol", function() stats_set_packed_bool(42068, true) end)
	misc_weap_liveries:add_action("Suede Bucks Finish | Carbine Rifle", function() stats_set_packed_bool(41658, true) end)
	misc_weap_liveries:add_action("Uncle T Finish | RPG", function() stats_set_packed_bool(41659, true) end)

	misc_weap_liveries:add_action(SPACE, null)

	misc_weap_liveries_n = misc_weap_liveries:add_submenu(README)
	misc_weap_liveries_n:add_action("                       Bypass Locks:", null)
	misc_weap_liveries_n:add_action("Allows to buy any livery with lock on it", null)

	misc:add_action(SPACE, null)

	misc_n = misc:add_submenu(README)
	misc_n:add_action("                          Hide Me:", null)
	misc_n:add_action("             Hides you from player list;", null)
	misc_n:add_action("     also removes your blip from the map", null)
end

function create_unlock_tool_submenu()
	create_achievements_submenu()
	create_awards_submenu()
	create_characterteristics_submenu()
	create_collectibles_submenu()
	create_crew_rank_submenu()
	create_rank_submenu()
	create_kd_changer_submenu()
	create_char_stats_submenu()
	create_arena_war_submenu()
	create_bunker_submenu()
	create_lscm_submenu()
	create_lsc_submenu()
	create_misc_submenu()
end

--Credits Implementation--

function create_credits_submenu()
	credits:add_action("Developer: Silent", null)
	credits:add_action("Helpers #1: gaymer, Big Smoke, Slon", null)
	credits:add_action("Helpers #2: CasinoPacino, Bababoiiiii", null)
	credits:add_action("Helpers #3: Amnesia, jschaotic, Killa`B", null)
	credits:add_action("Helpers #4: Mr. Robot, L7NEG, LUKY6464", null)
	credits:add_action("Helpers #5: ShinyWasabi, gir489returns", null)
	credits:add_action("Helpers #6: Unkn0wnXit, Zeiger, Pewpew", null)
	credits:add_action("Helpers #7: ObratniyVasya, CheatChris", null)
	credits:add_action("Helpers #8: Rostal", null)
	credits:add_action("Testers #1: BirbTickles, your_local_racist", null)
	credits:add_action("Testers #2: Hvedemel, fjiafbniae, Someone", null)
	credits:add_action(SPACE, null)
	credits:add_action("Discord: silentsalo", null)
end

--Main Menu--

silent_night =         menu.add_submenu("ツ Silent Night | v2.5")
heist_tool   = silent_night:add_submenu("♠ Heist Tool")
money_tool   = silent_night:add_submenu("♣ Money Tool")
unlock_tool  = silent_night:add_submenu("♦ Unlock Tool")
credits      = silent_night:add_submenu("♥ Credits")
create_credits_submenu()

---Heist Tool Menu---

agency    	   = heist_tool:add_submenu("Agency | Safe")
auto_shop 	   = heist_tool:add_submenu("Auto Shop | Safe")
apartment 	   = heist_tool:add_submenu("Apartment | Safe")
cayo_perico    = heist_tool:add_submenu("Cayo Perico | Safe")
diamond_casino = heist_tool:add_submenu("Diamond Casino | Safe")
doomsday 	   = heist_tool:add_submenu("Doomsday | Safe")
salvage_yard   = heist_tool:add_submenu("Salvage Yard | Safe")
create_heist_tool_submenu()

--Money Tool Menu--

bunker_crash 	  = money_tool:add_submenu("Bunker Crash | Unclear")
casino_master 	  = money_tool:add_submenu("Casino Master | Unclear")
hangar_cargo_vip  = money_tool:add_submenu("Hangar Cargo VIP | Safe")
money_editor 	  = money_tool:add_submenu("Money Editor | Safe")
nightclub_helper  = money_tool:add_submenu("Nightclub Helper | Safe")
special_cargo_vip = money_tool:add_submenu("Special Cargo VIP | Detected")
cheap_loop 		  = money_tool:add_submenu("Cheap Loop | Safe")
death_loop 		  = money_tool:add_submenu("Death Loop | Unclear")
night_loop 		  = money_tool:add_submenu("Night Loop | Safe")
op_loop 		  = money_tool:add_submenu("OP Loop Jr. | Unclear")
orbital_loop 	  = money_tool:add_submenu("Orbital Loop | Detected")
create_money_tool_submenu()

--Unlock Tool Menu--

char_stats   	   = unlock_tool:add_submenu("Character Stats | Safe")
facilities_unlocks = unlock_tool:add_submenu("Facilities Unlocks | Safe")
misc 			   = unlock_tool:add_submenu("Miscellaneous | Safe")
create_unlock_tool_submenu()

---[[ Developer: Silent ]]---