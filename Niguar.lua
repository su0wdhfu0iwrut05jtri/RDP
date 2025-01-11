-- [Security]

-- [Main Requiment Webhook]
local HttpService = game:GetService("HttpService")
local PlayerCount = #game.Players:GetPlayers()

-- Mendapatkan waktu lokal dari perangkat pemain
local date = os.date("*t") -- Waktu lokal perangkat pemain
local hour = date.hour
local ampm = hour < 12 and "AM" or "PM"
local formattedTime = string.format("%02d:%02d:%02d %s", 
    ((hour - 1) % 12) + 1, 
    date.min, 
    date.sec, 
    ampm
)
local formattedDate = string.format("%02d/%02d/%04d", date.day, date.month, date.year)

-- Mendapatkan region pemain
local region = "Unknown Region" -- Default region jika gagal mendapatkannya
local success, result = pcall(function()
    return game:GetService("LocalizationService"):GetCountryRegionForPlayerAsync(game:GetService("Players").LocalPlayer)
end)

if success then
    region = result
end

local NormalHaki = {
    "Orange Soda",
    "Bright Yellow",
    "Yellow Sunshine",
    "Slimy Green",
    "Green Lizard",
    "Blue Jeans",
    "Plump Purple",
    "Fiery Rose",
    "Heat Wave",
    "Absolute Zero"
}

local LegendHaki = {
    "Snow White",
    "Pure Red",
    "Winter Sky"
}

local SwordOcon = {
    "Oroshi",
    "Saishi",
    "Shizu"
}
--Boss
local bossNamesGroups = {
    ["2753915549"] = {"The Saw", "Greybeard"},      -- First Sea
    ["4442272183"] = {"Darkbeard", "Order", "Cursed Captain"},  -- Second Sea
    ["7449423635"] = {"rip_indra True Form", "Soul Reaper", "Cake Prince", "Dough King", "Leviathan"}  -- Third Sea
}

local worldBossNames = bossNamesGroups[tostring(game.PlaceId)]

local HakiPrice
local Haki
local HakiColorDex
local HakiImage
local SwordList

-- [Place Id Check]
if game.PlaceId == 2753915549 then
    World1 = true
    Lautan = "First Sea"
elseif game.PlaceId == 4442272183 then
    World2 = true
    Lautan = "Second Sea"
elseif game.PlaceId == 7449423635 then
    World3 = true
    Lautan = "Third Sea"
end

--Haki
if not World1 then
    local PelerDealer = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer", "1")
    if PelerDealer == "Winter Sky" then
        Haki = "Winter Sky"
        HakiColorDex = 15844367
        HakiPrice = "``` ƒ 7,500 ```"
        HakiImage = "https://i.imgur.com/qZr0tVj.png"
    elseif PelerDealer == "Pure Red" then
        Haki = "Pure Red"
        HakiColorDex = 15844367
        HakiPrice = "``` ƒ 7,500 ```"
        HakiImage = "https://i.imgur.com/7SgEoF3.png"
    elseif PelerDealer == "Snow White" then
        Haki = "Snow White"
        HakiColorDex = 15844367
        HakiPrice = "``` ƒ 7,500 ```"
        HakiImage = "https://i.imgur.com/1pyIjLN.png"
    --Normal Haki
    elseif PelerDealer == "Orange Soda" then
        Haki = "Orange Soda"
        HakiColorDex = 16741120
        HakiPrice = "``` ƒ 1,500 ```"
        HakiImage = "https://i.imgur.com/lGtD8eA.png"
    elseif PelerDealer == "Bright Yellow" then
        Haki = "Bright Yellow"
        HakiColorDex = 16774912
        HakiPrice = "``` ƒ 1,500 ```"
        HakiImage = "https://i.imgur.com/nRP90Az.png"
    elseif PelerDealer == "Yellow Sunshine" then
        Haki = "Yellow Sunshine"
        HakiColorDex = 16769280
        HakiPrice = "``` ƒ 1,500 ```"
        HakiImage = "https://i.imgur.com/5dkIty2.png"
    elseif PelerDealer == "Slimy Green" then
        Haki = "Slimy Green"
        HakiColorDex = 2031360
        HakiPrice = "``` ƒ 1,500 ```"
        HakiImage = "https://i.imgur.com/MTa6d2J.png"
    elseif PelerDealer == "Green Lizard" then
        Haki = "Green Lizard"
        HakiColorDex = 12582656
        HakiPrice = "``` ƒ 1,500 ```"
        HakiImage = "https://i.imgur.com/MTa6d2J.png"
    elseif PelerDealer == "Blue Jeans" then
        Haki = "Blue Jeans"
        HakiColorDex = 39423
        HakiPrice = "``` ƒ 1,500 ```"
        HakiImage = "https://i.imgur.com/rspbAMO.png"
    elseif PelerDealer == "Plump Purple" then
        Haki = "Plump Purple"
        HakiColorDex = 8388736
        HakiPrice = "``` ƒ 1,500 ```"
        HakiImage = "https://i.imgur.com/WwKiIgC.png"
    elseif PelerDealer == "Fiery Rose" then
        Haki = "Fiery Rose"
        HakiColorDex = 16711791
        HakiPrice = "``` ƒ 1,500 ```"
        HakiImage = "https://i.imgur.com/uuvotKS.png"
    elseif PelerDealer == "Heat Wave" then
        Haki = "Heat Wave"
        HakiColorDex = 16730112
        HakiPrice = "``` ƒ 1,500 ```"
        HakiImage = "https://i.imgur.com/QFfruyF.png"
    elseif PelerDealer == "Absolute Zero" then
        Haki = "Absolute Zero"
        HakiColorDex = 209
        HakiPrice = "``` ƒ 1,500 ```" 
        HakiImage = "https://i.imgur.com/my9fRio.png"  
    end
end

--Sword
if World2 then
    local Remote = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","1")
    if game.PlaceId == 4442272183 and Remote == "Oroshi" then
        SwordList = "Oroshi"
        SwordImage = "https://i.imgur.com/3kUDqDi.png"
    elseif game.PlaceId == 4442272183 and Remote == "Saishi" then
        SwordList = "Saishi"
        SwordImage = "https://i.imgur.com/NgSzT85.png"
    elseif game.PlaceId == 4442272183 and Remote == "Shizu" then
        SwordList = "Shizu"
        SwordImage = "https://i.imgur.com/MXuxaqS.png"
    end
end

if not World1 then
    local RemoteDealer = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ColorsDealer","1")
    if table.find(LegendHaki, RemoteDealer) then
        local LegendaryHaki = {
            ["type"] = "legend",
            ["data"] = {
                ["content"] = "",
                ["username"] = "Legendary Haki",
                ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png",
                ["embeds"] = {
                    {   
                        ["author"] = {
                            ["name"] = "Thunder Z",
                            ["icon_url"] = 'https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png'
                        },
                        ["type"] = "rich",
                        ["title"] = "**Legendary Haki Color Checker**",
                        ["thumbnail"] = {
                            ["url"] = HakiImage,
                        },
                        ["color"] = HakiColorDex,
                        ["fields"] = {
                            {
                                ["name"] = "[ 💎 ]  Color :",
                                ["value"] = "```".. Haki .."```",
                            },
                            {
                                ["name"] = "**[💵] Haki Price:**",
                                ["value"] = HakiPrice
                            },
                            {
                                ["name"] = "[ 🌊 ]  Location :",
                                ["value"] = "```"..Lautan.."```"
                            },
                            {
                                ["name"] = "[ 👥 ]  Players In Server :",
                                ["value"] = "```"..PlayerCount.."/12".."```"
                            },
                            {
                                ["name"] = "[ 📃 ]  Job Id :",
                                ["value"] = "```"..game.JobId.."```"
                            },
                            {
                                ["name"] = "[ 🔗 ] Join Server - Execute this to join Server :",
                                ["value"] = "```".."game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."')".."```"
                            },
                        },
                        ["description"] =  "[Click here to Join for Roblox Web Version](https://www.roblox.com/home?placeId="..game.JobId..") | ",
                        ["footer"] = {
                            ["text"] = "Thunder Z • "..formattedDate.." at "..formattedTime.." • "..region
                        },
                        ["image"] = {
                            ["url"] = "https://i.imgur.com/2wosJIs.gif"
                        }
                    }
                }
            }
        }
        request({
            Url = "https://nodedeploy-production-1172.up.railway.app/safe-webhook", -- Ganti dengan URL Replit Anda jika digunakan secara online
            Body = HttpService:JSONEncode(LegendaryHaki),
            Method = "POST",
            Headers = {
                ["content-type"] = "application/json",
                ["authorization"] = "fd9ef5416e31069a489c5ff1f806117622383520d1a35425d9bdc428e1d3f9cc" -- Token Anda
            }
        })
    end
     --Work
    if table.find(NormalHaki, RemoteDealer) then
        local NormHaki = {
            ["type"] = "normal",
            ["data"] = {
                ["content"] = "",
                ["username"] = "Normal Haki",
                ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png",
                ["embeds"] = {
                    {   
                        ["author"] = {
                            ["name"] = "Thunder Z",
                            ["icon_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png",--'https://cdn.discordapp.com/attachments/962302731308105758/1071360247781924955/THUNDERZ_HUB_4.pnog'
                        },
                        ["type"] = "rich",
                        ["title"] = "**Normal Haki Color Checker**",
                        ["thumbnail"] = {
                            ["url"] = HakiImage,
                        },
                        ["color"] = HakiColorDex,
                        ["fields"] = {
                            {
                                ["name"] = "[ 💎 ]  Color :",
                                ["value"] = "```".. Haki .."```"
                            },
                            {
                                ["name"] = "**[💵] Haki Price:**",
                                ["value"] = HakiPrice
                            },
                            {
                                ["name"] = "[ 🌊 ]  Location :",
                                ["value"] = "```"..Lautan.."```"
                            },
                            {
                                ["name"] = "[ 👥 ]  Players In Server :",
                                ["value"] = "```"..PlayerCount.."/12".."```"
                            },
                            {
                                ["name"] = "[ 📃 ]  Job Id :",
                                ["value"] = "```"..game.JobId.."```"
                            },
                            {
                                ["name"] = "[ 🔗 ] Join Server - Execute this to join Server :",
                                ["value"] = "```".."game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."')".."```"
                            },
                        },
                        ["description"] =  "[Click here to Join for Roblox Web Version](https://www.roblox.com/home?placeId="..game.JobId..") | ",
                        ["footer"] = {
                            ["text"] = "Thunder Z • "..formattedDate.." at "..formattedTime.." • "..region
                        },
                        ["image"] = {
                            ["url"] = "https://i.imgur.com/2wosJIs.gif"
                        }
                    }
                }
            }
        }
        local response = request({
            Url = "https://nodedeploy-production-1172.up.railway.app/safe-webhook", -- Ganti dengan URL Replit Anda jika digunakan secara online
            Body = HttpService:JSONEncode(NormHaki),
            Method = "POST",
            Headers = {
                ["content-type"] = "application/json",
                ["authorization"] = "fd9ef5416e31069a489c5ff1f806117622383520d1a35425d9bdc428e1d3f9cc" -- Token Anda
            }
        })
    end
end

-- [Fruit Finder] plr.Character
local fruitstable = {}
for _, v in next, workspace:GetChildren() do
    if v.Name:find("Fruit") and (v:IsA("Model") or v:IsA("Tool")) then
        table.insert(fruitstable, "- " .. v.Name .. " (Devil Fruit)")
    end
end

if #fruitstable > 0 then
    local buahbuahan = {
        ["type"] = "fruithook",
        ["data"] = {
            ["content"] = "",
            ["username"] = "Fruit Finder",
            ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png",
            ["embeds"] = {
                {   
                    ["author"] = {
                        ["name"] = "Thunder Z",
                        ["icon_url"] = 'https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png'
                    },
                    ["type"] = "rich",
                    ["title"] = "**Fruit Spawn Checker**",
                    ["thumbnail"] = {
                        ["url"] = "https://i.imgur.com/cQhjBMz.png",
                    },
                    ["color"] = 209,
                    ["fields"] = {
                        {
                            ["name"] = "[ 🍒 ]  Fruit in Server :",
                            ["value"] = "```"..table.concat(fruits, "\n").."```"
                        },
                        {
                            ["name"] = "[ 👥 ]  Players In Server :",
                            ["value"] = "```"..PlayerCount.."/12".."```"
                        },
                        {
                            ["name"] = "[ 🌊 ]  Location :",
                            ["value"] = "```"..Lautan.."```"
                        },
                        {
                            ["name"] = "[ 📃 ]  Job Id :",
                            ["value"] = "```"..game.JobId.."```"
                        },
                        {
                            ["name"] = "[ 🔗 ] Join Server - Execute this to join Server :",
                            ["value"] = "```".."game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."')".."```"
                        },
                        
                    },
                    ["footer"] = {
                        ["text"] = "Thunder Z • "..formattedDate.." at "..formattedTime.." • "..region
                    },
                    ["image"] = {
                        ["url"] = "https://i.imgur.com/2wosJIs.gif"
                    }
                }
            }
        }
    }
    request({
        Url = "https://nodedeploy-production-1172.up.railway.app/safe-webhook", -- Ganti dengan URL Replit Anda jika digunakan secara online
        Body = HttpService:JSONEncode(buahbuahan),
        Method = "POST",
        Headers = {
            ["content-type"] = "application/json",
            ["authorization"] = "fd9ef5416e31069a489c5ff1f806117622383520d1a35425d9bdc428e1d3f9cc" -- Token Anda
        }
    })

end

-- [Mystic Island]
if World3 and game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
    if game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
        Moon = "🌕 : Full Moon 100%";
    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149052" then
        Moon = "🌔 : Full Moon 75%";
    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709143733" then
        Moon = "🌓 : Full Moon 50%";
    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709150401" then
        Moon = "🌓 : Full Moon 25%";
    elseif game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149680" then
        Moon = "🌒 : Full Moon 15%";
    else
        Moon = "🌑 : Full Moon 0%";
    end
    local mirage = {
        ["type"] = "mirageisland",
        ["data"] = {
            ["content"] = "",
            ["username"] = "Mirage Island",
            ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png",
            ["embeds"] = {
                {   
                    ["author"] = {
                        ["name"] = "Thunder Z",
                        ["icon_url"] = 'https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png'
                    },
                    ["type"] = "rich",
                    ["title"] = "**Mirage Island Checker**",
                    ["color"] = tonumber(0xf1c40f),
                    ["fields"] = {
                        {
                            ["name"] = "**[🏝️] Mirrage Status:**",
                            ["value"] = "``` Mirage Island Spawn : ✅ ```"
                        },
                        {
                            ["name"] = "**[ 🌕 ] Moon Phase :**",
                            ["value"] = "```".. Moon .."```"
                        },
                        {
                            ["name"] = "**[👥] Players In Server:**",
                            ["value"] = "``` ".. PlayerCount .."/12 ```"
                        },
                        {
                            ["name"] = "[ 📃 ]  Job Id :",
                            ["value"] = "```"..game.JobId.."```"
                        },
                        {
                            ["name"] = "[ 🔗 ]  Join Server - Execute this to join Server :",
                            ["value"] = "```".."game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."')".."```"
                        }
                    },
                    ["description"] =  "[Click here to Join for Roblox Web Version](https://www.roblox.com/home?placeId="..game.JobId..") | ",
                    ["footer"] = {
                        ["text"] = "Thunder Z • "..formattedDate.." at "..formattedTime.." • "..region
                    },
                    ["image"] = {
                        ["url"] = "https://i.imgur.com/2wosJIs.gif"
                    }
                }
            }
        }
    }
    request({
        Url = "https://nodedeploy-production-1172.up.railway.app/safe-webhook", -- Ganti dengan URL Replit Anda jika digunakan secara online
        Body = HttpService:JSONEncode(mirage),
        Method = "POST",
        Headers = {
            ["content-type"] = "application/json",
            ["authorization"] = "fd9ef5416e31069a489c5ff1f806117622383520d1a35425d9bdc428e1d3f9cc" -- Token Anda
        }
    })
elseif World3 and game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Kitsune Island") then
    local Kitsune = {
        ["type"] = "kitsuneisland",
        ["data"] = {
            ["content"] = "",
            ["username"] = "Kitsune Island",
            ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png",
            ["embeds"] = {
                {   
                    ["author"] = {
                        ["name"] = "Thunder Z",
                        ["icon_url"] = 'https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png'
                    },
                    ["type"] = "rich",
                    ["title"] = "**Kitsune Island Checker**",
                    ["thumbnail"] = {
                        ["url"] = "https://i.imgur.com/OA3UFRF.png",
                    },
                    ["color"] = tonumber(0xf1c40f),
                    ["fields"] = {
                        {
                            ["name"] = "**[🦊] Kitsune Island Status:**",
                            ["value"] = "``` Kitsune Island Spawn : ✅ ```"
                        },
                        {
                            ["name"] = "**[👥] Players In Server:**",
                            ["value"] = "``` ".. PlayerCount .."/12 ```"
                        },
                        {
                            ["name"] = "[ 📃 ]  Job Id :",
                            ["value"] = "```"..game.JobId.."```"
                        },
                        {
                            ["name"] = "[ 🔗 ]  Join Server - Execute this to join Server :",
                            ["value"] = "```".."game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."')".."```"
                        }
                    },
                    ["description"] =  "[Click here to Join for Roblox Web Version](https://www.roblox.com/home?placeId="..game.JobId..") | ",
                    ["footer"] = {
                        ["text"] = "Thunder Z • "..formattedDate.." at "..formattedTime.." • "..region
                    },
                    ["image"] = {
                        ["url"] = "https://i.imgur.com/2wosJIs.gif"
                    }
                }
            }
        }
    }
    request({
        Url = "https://nodedeploy-production-1172.up.railway.app/safe-webhook", -- Ganti dengan URL Replit Anda jika digunakan secara online
        Body = HttpService:JSONEncode(Kitsune),
        Method = "POST",
        Headers = {
            ["content-type"] = "application/json",
            ["authorization"] = "fd9ef5416e31069a489c5ff1f806117622383520d1a35425d9bdc428e1d3f9cc" -- Token Anda
        }
    })
elseif World3 and game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Prehistoric Island") then
    local Prehistoric = {
        ["type"] = "prehistoricisland",
        ["data"] = {
            ["content"] = "",
            ["username"] = "Prehistoric Island",
            ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png",
            ["embeds"] = {
                {   
                    ["author"] = {
                        ["name"] = "Thunder Z",
                        ["icon_url"] = 'https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png'
                    },
                    ["type"] = "rich",
                    ["title"] = "**Prehistoric Island Checker**",
                    ["thumbnail"] = {
                        ["url"] = "https://i.imgur.com/sCseVTp.png",
                    },
                    ["color"] = tonumber(0xf1c40f),
                    ["fields"] = {
                        {
                            ["name"] = "**[🌋] Prehistoric Island Status:**",
                            ["value"] = "``` Prehistoric Island Spawn : ✅ ```"
                        },
                        {
                            ["name"] = "**[👥] Players In Server:**",
                            ["value"] = "``` ".. PlayerCount .."/12 ```"
                        },
                        {
                            ["name"] = "[ 📃 ]  Job Id :",
                            ["value"] = "```"..game.JobId.."```"
                        },
                        {
                            ["name"] = "[ 🔗 ]  Join Server - Execute this to join Server :",
                            ["value"] = "```".."game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."')".."```"
                        }
                    },
                    ["description"] =  "[Click here to Join for Roblox Web Version](https://www.roblox.com/home?placeId="..game.JobId..") | ",
                    ["footer"] = {
                        ["text"] = "Thunder Z • "..formattedDate.." at "..formattedTime.." • "..region
                    },
                    ["image"] = {
                        ["url"] = "https://i.imgur.com/2wosJIs.gif"
                    }
                }
            }
        }
    }
    request({
        Url = "https://nodedeploy-production-1172.up.railway.app/safe-webhook", -- Ganti dengan URL Replit Anda jika digunakan secara online
        Body = HttpService:JSONEncode(Prehistoric),
        Method = "POST",
        Headers = {
            ["content-type"] = "application/json",
            ["authorization"] = "fd9ef5416e31069a489c5ff1f806117622383520d1a35425d9bdc428e1d3f9cc" -- Token Anda
        }
    })
elseif World3 and game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Freezing Hydra Island") then
    local Hydra = {
        ["type"] = "hydraisland",
        ["data"] = {
            ["content"] = "",
            ["username"] = "Freezing Hydra Island",
            ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png",
            ["embeds"] = {
                {   
                    ["author"] = {
                        ["name"] = "Thunder Z",
                        ["icon_url"] = 'https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png'
                    },
                    ["type"] = "rich",
                    ["title"] = "**Freezing Hydra Island Checker**",
                    ["thumbnail"] = {
                        ["url"] = "https://i.imgur.com/CS0B2Uu.png",
                    },
                    ["color"] = tonumber(0xf1c40f),
                    ["fields"] = {
                        {
                            ["name"] = "**[🏯] Freezing Hydra Island Status:**",
                            ["value"] = "``` Freezing Hydra Island Spawn : ✅ ```"
                        },
                        {
                            ["name"] = "**[👥] Players In Server:**",
                            ["value"] = "``` ".. PlayerCount .."/12 ```"
                        },
                        {
                            ["name"] = "[ 📃 ]  Job Id :",
                            ["value"] = "```"..game.JobId.."```"
                        },
                        {
                            ["name"] = "[ 🔗 ]  Join Server - Execute this to join Server :",
                            ["value"] = "```".."game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."')".."```"
                        }
                    },
                    ["description"] =  "[Click here to Join for Roblox Web Version](https://www.roblox.com/home?placeId="..game.JobId..") | ",
                    ["footer"] = {
                        ["text"] = "Thunder Z • "..formattedDate.." at "..formattedTime.." • "..region
                    },
                    ["image"] = {
                        ["url"] = "https://i.imgur.com/2wosJIs.gif"
                    }
                }
            }
        }
    }
    request({
        Url = "https://nodedeploy-production-1172.up.railway.app/safe-webhook", -- Ganti dengan URL Replit Anda jika digunakan secara online
        Body = HttpService:JSONEncode(Hydra),
        Method = "POST",
        Headers = {
            ["content-type"] = "application/json",
            ["authorization"] = "fd9ef5416e31069a489c5ff1f806117622383520d1a35425d9bdc428e1d3f9cc" -- Token Anda
        }
    })
-- [Full Moon]
elseif World3 and game:GetService("Lighting").Sky.MoonTextureId=="http://www.roblox.com/asset/?id=9709149431" then
   
    local moon = {
        ["type"] = "moonhook",
            ["data"] = {
            ["content"] = "",
            ["username"] = "Moon Phase",
            ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png",
            ["embeds"] = {
                {   
                    ["author"] = {
                        ["name"] = "Thunder Z",
                        ["icon_url"] = 'https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png'
                    },
                    ["type"] = "rich",
                    ["title"] = "**Full Moon Checker**",
                    ["thumbnail"] = {
                        ["url"] = "https://i.imgur.com/Ve4waRT.png",
                    },
                    ["color"] = tonumber(0xf1c40f),
                    ["fields"] = {
                        {
                            ["name"] = "**[ 🌕 ] Moon Phase :**",
                            ["value"] = "``` 🌕 : Full Moon 100% ```"
                        },
                        {
                            ["name"] = "**[👥] Players In Server:**",
                            ["value"] = "``` ".. PlayerCount .."/12 ```"
                        },
                        {
                            ["name"] = "[ 📃 ]  Job Id :",
                            ["value"] = "```"..game.JobId.."```"
                        },
                        {
                            ["name"] = "[ 🔗 ]  Join Server - Execute this to join Server :",
                            ["value"] = "```".."game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."')".."```"
                        }
                        
                    },
                    ["description"] =  "[Click here to Join for Roblox Web Version](https://www.roblox.com/home?placeId="..game.JobId..") | ",
                    ["footer"] = {
                        ["text"] = "Thunder Z • "..formattedDate.." at "..formattedTime.." • "..region
                    },
                    ["image"] = {
                        ["url"] = "https://i.imgur.com/2wosJIs.gif"
                    }
                }
            }
        }
    }
    request({
        Url = "https://nodedeploy-production-1172.up.railway.app/safe-webhook", -- Ganti dengan URL Replit Anda jika digunakan secara online
        Body = HttpService:JSONEncode(moon),
        Method = "POST",
        Headers = {
            ["content-type"] = "application/json",
            ["authorization"] = "fd9ef5416e31069a489c5ff1f806117622383520d1a35425d9bdc428e1d3f9cc" -- Token Anda
        }
    })
elseif World2 then
    local RemoteSword = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LegendarySwordDealer","1")
    if table.find(SwordOcon, RemoteSword) then
        local sword = {
            ["type"] = "sword",
            ["data"] = {
                ["content"] = "",
                ["username"] = "Legendary Sword Dealer",
                ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png",
                ["embeds"] = {
                    {   
                        ["author"] = {
                            ["name"] = "Thunder Z",
                            ["icon_url"] = 'https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png'
                        },
                        ["type"] = "rich",
                        ["title"] = "**Legendary Sword Checker**",
                        ["thumbnail"] = {
                            ["url"] = SwordImage,
                        },
                        ["color"] = tonumber(0x800080),
                        ["fields"] = {
                            {
                                ["name"] = "**[ ⚔️ ] Sword Type :**",
                                ["value"] = "``` ".. SwordList .." ```"
                            },
                            {
                                ["name"] = "**[👥] Players In Server:**",
                                ["value"] = "``` ".. PlayerCount .."/12 ```"
                            },
                            {
                                ["name"] = "[ 📃 ]  Job Id :",
                                ["value"] = "```"..game.JobId.."```"
                            },
                            {
                                ["name"] = "[ 🔗 ]  Join Server - Execute this to join Server :",
                                ["value"] = "```".."game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."')".."```"
                            }
                            
                        },
                        ["description"] =  "[Click here to Join for Roblox Web Version](https://www.roblox.com/home?placeId="..game.JobId..") | ",
                        ["footer"] = {
                            ["text"] = "Thunder Z • "..formattedDate.." at "..formattedTime.." • "..region
                        },
                        ["image"] = {
                            ["url"] = "https://i.imgur.com/2wosJIs.gif"
                        }
                    }
                }
            }
        }
        request({
            Url = "https://nodedeploy-production-1172.up.railway.app/safe-webhook", -- Ganti dengan URL Replit Anda jika digunakan secara online
            Body = HttpService:JSONEncode(sword),
            Method = "POST",
            Headers = {
                ["content-type"] = "application/json",
                ["authorization"] = "fd9ef5416e31069a489c5ff1f806117622383520d1a35425d9bdc428e1d3f9cc" -- Token Anda
            }
        })
    end
end

for i, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
    if table.find(worldBossNames, v.Name) then
        local bosswak = {
            ["type"] = "bosstok",
            ["data"] = {
                ["content"] = "",
                ["username"] = "Boss Raid",
                ["avatar_url"] = "https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png",
                ["embeds"] = {
                    {   
                        ["author"] = {
                            ["name"] = "Thunder Z",
                            ["icon_url"] = 'https://cdn.discordapp.com/attachments/962302731308105758/1323104514986872923/White_Black_Dark_Brutalist_Rock_Metal_Playlist_Cover_2.png'
                        },
                        ["type"] = "rich",
                        ["title"] = "**Boss Raid Checker**",
                        ["color"] = tonumber(0x00ffff),
                        ["fields"] = {
                            {
                                ["name"] = "**[ 💀 ] Boss Name :**",
                                ["value"] = "```" ..v.Name.. "```"
                            },
                            {
                                ["name"] = "[ 🌊 ]  Location :",
                                ["value"] = "```"..Lautan.."```"
                            },
                            {
                                ["name"] = "**[👥] Players In Server:**",
                                ["value"] = "``` ".. PlayerCount .."/12 ```"
                            },
                            {
                                ["name"] = "[ 📃 ]  Job Id :",
                                ["value"] = "```"..game.JobId.."```"
                            },
                            {
                                ["name"] = "[ 🔗 ]  Join Server - Execute this to join Server :",
                                ["value"] = "```".."game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId,'"..game.JobId.."')".."```"
                            },
                            {
                                ["name"] = "[Click here to Join for Roblox Web Version](https://www.roblox.com/home?placeId="..game.JobId..")"
                            }
                        },
                        ["description"] =  "[Click here to Join for Roblox Web Version](https://www.roblox.com/home?placeId="..game.JobId..") | ",
                        ["footer"] = {
                            ["text"] = "Thunder Z • "..formattedDate.." at "..formattedTime.." • "..region
                        },
                        ["image"] = {
                            ["url"] = "https://i.imgur.com/2wosJIs.gif"
                        }
                    }
                }
            }
        }
        request({
            Url = "https://nodedeploy-production-1172.up.railway.app/safe-webhook", -- Ganti dengan URL Replit Anda jika digunakan secara online
            Body = HttpService:JSONEncode(bosswak),
            Method = "POST",
            Headers = {
                ["content-type"] = "application/json",
                ["authorization"] = "fd9ef5416e31069a489c5ff1f806117622383520d1a35425d9bdc428e1d3f9cc" -- Token Anda
            }
        })
    end
end
