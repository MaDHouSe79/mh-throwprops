--[[ ===================================================== ]]--
--[[            MH Trow Props Script by MaDHouSe           ]]--
--[[ ===================================================== ]]--

local Translations = {
    info = {
        ['press_to_throw'] = "~INPUT_AIM~ + ~INPUT_ATTACK~ to throw the object.",
    },
    target = {
        ['pickup_prop'] = "Pickup the object",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations, 
    warnOnMissing = true
})