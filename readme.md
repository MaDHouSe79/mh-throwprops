<p align="center">
    <img width="140" src="https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/128/Letter-M-icon.png" />  
    <h1 align="center">Hi 👋, I'm MaDHouSe</h1>
    <h3 align="center">A passionate allround developer </h3>    
</p>

<p align="center">
  <a href="https://github.com/MaDHouSe79/mh-throwprops/issues">
    <img src="https://img.shields.io/github/issues/MaDHouSe79/mh-throwprops"/> 
  </a>
  <a href="https://github.com/MaDHouSe79/mh-throwprops/watchers">
    <img src="https://img.shields.io/github/watchers/MaDHouSe79/mh-throwprops"/> 
  </a> 
  <a href="https://github.com/MaDHouSe79/mh-throwprops/network/members">
    <img src="https://img.shields.io/github/forks/MaDHouSe79/mh-throwprops"/> 
  </a>  
  <a href="https://github.com/MaDHouSe79/mh-throwprops/stargazers">
    <img src="https://img.shields.io/github/stars/MaDHouSe79/mh-throwprops?color=white"/> 
  </a>
  <a href="https://github.com/MaDHouSe79/mh-trowprops/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/MaDHouSe79/mh-throwprops?color=black"/> 
  </a>      
</p>

<p align="center">
  <img alig src="https://github-profile-trophy.vercel.app/?username=MaDHouSe79&margin-w=15&column=6" />
</p>

# MH Throw Props
- just throw with props :)

# Install
- 1. Create a folder `[mh] `in the folder `resources` and place the folder `mh-throwprops` inside the `[mh]` folder
- 2. Add in the server.cfg, `ensure [mh]` (make sure you ensure it after the `ensure [qb]`)


# QB Shared items
- dont forget to add the images in the qb-inventory image folder.
````lua
	-- mh-throwprops items 
	['garbagebin'] 			         = {['name'] = 'garbagebin', 			  	    ['label'] = 'Garbage Bin', 				['weight'] = 5000, 	    ['type'] = 'item', 		['image'] = 'garbagebin.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A garbage bin'},
	['garbagebag'] 			         = {['name'] = 'garbagebag', 			  	    ['label'] = 'Garbage Beg', 				['weight'] = 5000, 	    ['type'] = 'item', 		['image'] = 'garbagebag.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A garbage beg'},
	['roadcone'] 			         = {['name'] = 'roadcone', 			  	        ['label'] = 'Road Cone', 				['weight'] = 5000, 	    ['type'] = 'item', 		['image'] = 'roadcone.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A road Cone'},
	['luggage'] 			         = {['name'] = 'luggage', 			  	        ['label'] = 'Luggage', 				    ['weight'] = 5000, 	    ['type'] = 'item', 		['image'] = 'luggage.png', 		        ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Luggage'},
	['bowlingball'] 			 = {['name'] = 'bowlingball', 			  	    ['label'] = 'Bowling Ball', 		    ['weight'] = 5000, 	    ['type'] = 'item', 		['image'] = 'bowling_ball.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A bowling ball'},
	['bowlingpin'] 			         = {['name'] = 'bowlingpin', 			  	    ['label'] = 'Bowling Pin', 		        ['weight'] = 1000, 	    ['type'] = 'item', 		['image'] = 'bowling_pin.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A Bowling pin'},
	['manshoe'] 			         = {['name'] = 'manshoe', 			  	        ['label'] = 'Man Shoe', 		        ['weight'] = 1000, 	    ['type'] = 'item', 		['image'] = 'man_shoe.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A man shoe'},
	['womanshoe'] 			         = {['name'] = 'womanshoe', 			  	    ['label'] = 'Woman Shoe', 		        ['weight'] = 1000, 	    ['type'] = 'item', 		['image'] = 'lady_shoe.png', 		    ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A woman shoe'},
	['boxpile'] 			         = {['name'] = 'boxpile', 			  	        ['label'] = 'A Box', 		            ['weight'] = 1000, 	    ['type'] = 'item', 		['image'] = 'boxpile.png', 		        ['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'A box'},

````


# QB-Shops, if you want to use this with qb-shop, 
- look in mh-trowprops/config.lua and set `Config.BuyPropFromStore` to true
- to add in `Config.Products`
```lua
['props'] = {
    [1] = {
        name = 'garbagebin',
        price = 10,
        amount = 999999,
        info = {},
        type = 'item',
        slot = 1,
    },
    [2] = {
        name = 'garbagebag',
        price = 10,
        amount = 999999,
        info = {},
        type = 'item',
        slot = 2,
    },
    [3] = {
        name = 'roadcone',
        price = 10,
        amount = 999999,
        info = {},
        type = 'item',
        slot = 3,
    },
    [4] = {
        name = 'luggage',
        price = 10,
        amount = 999999,
        info = {},
        type = 'item',
        slot = 4,
    },
    [5] = {
        name = 'bowlingball',
        price = 10,
        amount = 999999,
        info = {},
        type = 'item',
        slot = 5,
    },
    [6] = {
        name = 'bowlingpin',
        price = 10,
        amount = 999999,
        info = {},
        type = 'item',
        slot = 6,
    },
    [7] = {
        name = 'manshoe',
        price = 10,
        amount = 999999,
        info = {},
        type = 'item',
        slot = 7,
    },
    [8] = {
        name = 'womanshoe',
        price = 10,
        amount = 999999,
        info = {},
        type = 'item',
        slot = 8,
    },
     [9] = {
        name = 'boxpile',
        price = 10,
        amount = 999999,
        info = {},
        type = 'item',
        slot = 9,
    },
}
```
- to add in `Config.Locations`
```lua
["Propsmarket"] = {
    ["label"] = "Throw Prop Shop",
    ["coords"] = vector4(-482.7943, -1760.9548, 18.6416, 17.5302),
    ["ped"] = 'mp_m_shopkeep_01',
    ["scenario"] = "WORLD_HUMAN_STAND_MOBILE",
    ["radius"] = 1.5,
    ["targetIcon"] = "fas fa-shopping-basket",
    ["targetLabel"] = "Open Shop",
    ["products"] = Config.Products["props"],
    ["showblip"] = true,
    ["blipsprite"] = 52,
    ["blipscale"] = 0.6,
    ["blipcolor"] = 32,
    ["delivery"] = nil
},
```

# 🙈 Youtube
- [Youtube](https://www.youtube.com/c/MaDHouSe79)

# LICENSE
[GPL LICENSE](./LICENSE)<br />
&copy; [MaDHouSe79](https://www.youtube.com/@MaDHouSe79)
