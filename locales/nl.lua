--[[ ===================================================== ]]--
--[[            MH Trow Props Script by MaDHouSe           ]]--
--[[ ===================================================== ]]--

local Translations = {
    info = {
        ['press_to_throw'] = "~INPUT_AIM~ + ~INPUT_ATTACK~ om de voorwerp te gooien.",
    },
    target = {
        ['pickup_prop'] = "Pak het voorwerp",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations, 
    warnOnMissing = true
})