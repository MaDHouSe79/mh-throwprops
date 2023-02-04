--[[ ===================================================== ]]--
--[[            MH Trow Props Script by MaDHouSe           ]]--
--[[ ===================================================== ]]--

Config = {}

Config.pickupCoolDownTimer = 5000
Config.CooldownTimer = 5000
Config.BaseVelocity = 30.0

-- if true, this means you need to buy the item in a shop 
-- you need to add the items in /[qb]/qb-shops/config.lua, for example in the Hardware Shop 
Config.BuyPropFromStore = false 

-- if need more props you can visit: https://gta-objects.xyz/objects
Config.List = {
	{prop = "prop_bin_01a",         item = "garbagebin",  hash = 1437508529},
	{prop = "prop_rub_binbag_03b",  item = "garbagebag",  hash = 1948359883},
	{prop = "prop_rub_binbag_04",   item = "garbagebag",  hash = 600967813},
    {prop = "prop_rub_binbag_05",   item = "garbagebag",  hash = 1388308576},
    {prop = "prop_luggage_01a",     item = "luggage",     hash = -206954186},
    {prop = "prop_luggage_02a",     item = "luggage",     hash = 4602238},
	{prop = "prop_roadcone02b",     item = "roadcone",    hash = 1839621839},
	{prop = "prop_bowling_ball",    item = "bowlingball", hash = -563331074},
	{prop = "prop_bowling_pin",     item = "bowlingpin",  hash = -1501785249},
	{prop = "prop_ld_shoe_01",      item = "manshoe",     hash = 1682675077},
	{prop = "prop_cs_amanda_shoe",  item = "womanshoe",   hash = 1536669612},
	{prop = "prop_rub_boxpile_02",  item = "boxpile",     hash = 1138027619},
}

Config.Animations = {
	idle           = {dict = "weapons@projectile@", name = "grip_idle",          flag = 25},
	idleWalking    = {dict = "weapons@projectile@", name = "grip_walk",          flag = 25},
	aimingLow      = {dict = "weapons@projectile@", name = "aim_l",              flag = 25},
	aimingMed      = {dict = "weapons@projectile@", name = "grenade_throw_drop", flag = 25},
	aimingHigh     = {dict = "weapons@projectile@", name = "aim_h",              flag = 25},
	aimingFullLow  = {dict = "weapons@projectile@", name = "aimlive_l",          flag = 25},
	aimingFullMed  = {dict = "weapons@projectile@", name = "aimlive_m",          flag = 25},
	aimingFullHigh = {dict = "weapons@projectile@", name = "aimlive_h",          flag = 25},
	throwingLow    = {dict = "weapons@projectile@", name = "throw_l_fb_stand",   flag = 2},
	throwingMed    = {dict = "weapons@projectile@", name = "throw_m_fb_stand",   flag = 2},
	throwingHigh   = {dict = "weapons@projectile@", name = "throw_h_fb_stand",   flag = 2},
}